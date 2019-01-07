using msg;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System;
using System.Linq;
using System.Text;
using UniCore;

namespace Taiyi
{
    public enum ServerState
    {
        NewFree,
        Normal,
        Fill,
        Close,
        Free,
        NewNormal,
        NewFill,
        NewClose,
    }

    public class ServerInfo
    {
        public int id;
        public string name;
        public string zone;
        public string ip;
        public int port;
        public ServerState state;
    }

    public class LoginData : BaseData
    {
        public static LoginData Inst;

        public class RecentServerData
        {
            public int serverId;
            public string humanName;
            public int humanLv;
            public ServerInfo info;
        }

        private bool mInitFinished;
        private List<RecentServerData> m_recentServers = new List<RecentServerData>();
        private List<ServerInfo> m_allServers = new List<ServerInfo>();
        private Dictionary<string, List<ServerInfo>> m_zoneDict = new Dictionary<string, List<ServerInfo>>();

        public bool IsInitFinish { get { return mInitFinished; } }
        public List<ServerInfo> AllServers { get { return m_allServers; } }
        public List<RecentServerData> RecentServers { get { return m_recentServers; } }
        public Dictionary<string, List<ServerInfo>> ZoneInfo { get { return m_zoneDict; } }

        ServerInfo defaultServer = new ServerInfo();
        public ServerInfo DefaultServer
        {
            set { defaultServer = value; }
            get { return defaultServer; }
        }

        private Coroutine m_waitConnect;

        protected override void OnInit()
        {
            Inst = this;

            mInitFinished = false;
            InitRecentServerData();
            // 直连测试
            AddInitServerList(1, "Test", "47.101.184.123", 20005);

            //UniCore.WWWDownloader.Get().DownloadAndCacheText("serverlist.txt", InitServerList);
            EventDispatcher.Inst.AddListener(HumanInfoEvent.HumanInfoChange, OnHumanInfoChange);
        }

        protected override void OnDeInit()
        {
            base.OnDeInit();
            EventDispatcher.Inst.RemoveListener(HumanInfoEvent.HumanInfoChange, OnHumanInfoChange);
        }

        private void OnHumanInfoChange()
        {
            if (CurrServerId >= 0 && PlayerData.Inst.human != null)
                SaveRecentServerData(CurrServerId, PlayerData.Inst.human.name, PlayerData.Inst.human.level);
        }

        public void UpdateServerList()
        {
            //UniCore.WWWDownloader.Get().DownloadAndCacheText("serverlist.txt", InitServerList);
        }

        public ServerInfo GetServerInfo(int id)
        {
            for (int i = 0; i < m_allServers.Count; i++)
            {
                if (m_allServers[i] != null && m_allServers[i].id == id)
                    return m_allServers[i];
            }

            return null;
        }

        void InitRecentServerData()
        {
            string recentServerJson = RecentServerJson;
            if (!string.IsNullOrEmpty(recentServerJson))
            {
                m_recentServers = fastJSON.JSON.ToObject<List<RecentServerData>>(recentServerJson);
                for (int i = m_recentServers.Count - 1; i >= 0; i--)
                {
                    if (m_recentServers[i].info == null)
                        m_recentServers.RemoveAt(i);
                }

                while (m_recentServers.Count > 2)
                    m_recentServers.RemoveAt(m_recentServers.Count - 1);
            }
        }

        void AddInitServerList(int serverID, string serverName, string serverIP, int serverProt)
        {
            m_allServers.Clear();
            ServerInfo info = new ServerInfo()
            {
                id = serverID,
                name = serverName,
                zone = "测试",
                ip = serverIP,
                port = serverProt,
                state = ServerState.Free
            };

            List<ServerInfo> serverList;
            if (!m_zoneDict.TryGetValue(info.zone, out serverList))
                m_zoneDict.Add(info.zone, serverList = new List<ServerInfo>());

            int index = serverList.FindIndex(x => x.id == info.id);
            

            m_allServers.Add(info);

            DefaultServer = AllServers[AllServers.Count - 1];
            EventDispatcher.Inst.Dispatch(GameFlowEvent.DownLoadEnd);

            UpdateRecentServerData();
            if (!mInitFinished)
                mInitFinished = true;
            else
                PanelManager.Inst.Open<ServerListPanel>();
        }

        void InitServerList(string text)
        {
            string content = text == null ? string.Empty : text;
            m_allServers.Clear();

            using (StringReader reader = new StringReader(content))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    if (string.IsNullOrEmpty(line))
                        continue;

                    string trim = line.Trim();
                    if (trim.StartsWith("//") || trim.StartsWith("#"))
                        continue;

                    string[] array = trim.Split("\t ".ToCharArray());
                    if (array.Length != 6)
                    {
                        Debug.LogError(string.Format("invaild server info! ({0})", line));
                        continue;
                    }

                    ServerInfo info = new ServerInfo()
                    {
                        id = int.Parse(array[0]),
                        name = array[1],
                        zone = array[2],
                        ip = array[3],
                        port = int.Parse(array[4]),
                        state = (ServerState)UniCore.GeneralUtils.ForceInt(array[5])
                    };

                    List<ServerInfo> serverList;
                    if (!m_zoneDict.TryGetValue(info.zone, out serverList))
                        m_zoneDict.Add(info.zone, serverList = new List<ServerInfo>());

                    int index = serverList.FindIndex(x => x.id == info.id);
                    if (index < 0)
                        serverList.Add(info);
                    else
                        serverList[index] = info;

                    m_allServers.Add(info);
                }
            }

            DefaultServer = AllServers[AllServers.Count - 1];
            EventDispatcher.Inst.Dispatch(GameFlowEvent.DownLoadEnd);

            UpdateRecentServerData();
            if (!mInitFinished)
                mInitFinished = true;
            else
                PanelManager.Inst.Open<ServerListPanel>();
        }

        private void UpdateRecentServerData()
        {
            for (int i = m_recentServers.Count - 1; i >= 0; i--)
            {
                RecentServerData recent = m_recentServers[i];
                ServerInfo info = GetServerInfo(recent.serverId);
                if (info == null)
                    m_recentServers.RemoveAt(i);
                else
                    m_recentServers[i].info = info;
            }
        }

        public void SaveRecentServerData(int serverId, string humanName, int humanLv)
        {
            RecentServerData item = null;
            for (int i = 0; i < m_recentServers.Count; i++)
            {
                if (m_recentServers[i].serverId == serverId)
                {
                    item = m_recentServers[i];
                    item.humanName = humanName;
                    item.humanLv = humanLv;

                    m_recentServers.RemoveAt(i);
                    break;
                }
            }

            if (item == null)
            {
                item = new RecentServerData();
                item.serverId = serverId;
                item.humanName = humanName;
                item.humanLv = humanLv;
                item.info = GetServerInfo(serverId);
            }

            m_recentServers.Insert(0, item);

            while (m_recentServers.Count > 2)
                m_recentServers.RemoveAt(m_recentServers.Count - 1);

            RecentServerJson = fastJSON.JSON.ToJSON(m_recentServers);
        }

        public int CurrServerId
        {
            get;
            set;
        }

        public string ServerIP
        {
            get;
            set;
        }

        public int ServerPort
        {
            get;
            set;
        }

        public string RecentServerJson
        {
            get { return PlayerPrefs.GetString("RecentServers"); }
            set { PlayerPrefs.SetString("RecentServers", value); }
        }

        public string UserName
        {
            get { return PlayerPrefs.GetString("UserName"); }
            set { PlayerPrefs.SetString("UserName", value); }
        }

        public string ChannelId { get; set; }

        public string ChannelUserId { get; set; }

        public string Token { get; set; }

        public string ExtraParam { get; set; }

        public void Login(string name = "")
        {
            GameLog.Caizhuen.Debug("Taiyi Login");

            if (ConnectAPI.Active())
            {
                LoginImp(name);
            }
            else
            {
                m_waitConnect = StartCoroutine(WaitForConnect());

                ConnectAPI.onConnect += OnConnect;
                ConnectAPI.Connect(ServerIP, ServerPort);

            }

#if !SDK_YIJIE && !SDK_JUHE && !SDK_MOXIAN
            //string name = (m_panel as LoginPanel).UserName;
            if (!string.IsNullOrEmpty(name))
                UserName = name;
#endif

#if UNITY_IOS
            TalkingData.Inst.Login(LoginData.Inst.UserName);
#endif
        }

        private void LoginImp(string name = "")
        {
            CSLogin msg = new CSLogin();
            int id = LoginData.Inst.CurrServerId;
            msg.version = CurrentBundleVersion.version;
#if SDK_YIJIE || SDK_JUHE || SDK_MOXIAN
            bool newbiePass = PlayerPrefs.GetInt("NewbiePassed", 0) == 1;
            //GameLog.Xuezhishan.Error("LoginData LoginImp newbiePass={0}", newbiePass);
            if (newbiePass)
            {
                msg.loginType = ELoginType.YJ;
                msg.account = UserName;
                msg.channelId = ChannelId;
                msg.password = Token;
                //GameLog.Xuezhishan.Error("Taiyi normal login");
                msg.serverId = LoginData.Inst.CurrServerId;
#if UNITY_ANDROID
                msg.deviceType = EDeviceType.Android;
#endif

#if UNITY_IPHONE
                msg.deviceType = EDeviceType.IosBreak;
#endif

            }
#else
                msg.loginType = ELoginType.PC;
#if OFFICIAL_SERVER
            msg.serverId = LoginData.Inst.CurrServerId;;
#else
            msg.serverId = -1;
#endif
            if (string.IsNullOrEmpty(name))
                name = SystemInfo.deviceUniqueIdentifier.Substring(0, 15).Replace('-', 'A');
            msg.account = name;
            UserName = name;
#endif
            ConnectAPI.QueuePacket(msg);
        }


        System.Collections.IEnumerator WaitForConnect()
        {
            yield return new WaitForSeconds(0.3f);
            PopupWindowManager.Inst.ShowWaitPanel(true);
            m_waitConnect = null;
        }

        private void OnConnect(NetErrors error)
        {
            if (m_waitConnect != null)
            {
                StopCoroutine(m_waitConnect);
                m_waitConnect = null;
            }
            else
            {
                PopupWindowManager.Inst.ShowWaitPanel(false);
            }

            ConnectAPI.onConnect -= OnConnect;

            if (error == NetErrors.ERROR_OK)
            {
                bool newbiePass = PlayerPrefs.GetInt("NewbiePassed", 0) == 1;

                    LoginImp(UserName);

            }
            else
            {
                PopupWindowManager.Inst.ShowTips("连接失败，服务器未开启！");
                GameLog.Caizhuen.Error(error.ToString());
            }
        }

        public void LoginForNewbie()
        {
            //GameLog.Xuezhishan.Error("LoginData LoginForNewbie ConnectAPI active:{0}", ConnectAPI.Active());
            if (!ConnectAPI.Active())
            {
                m_waitConnect = StartCoroutine(WaitForConnect());

                ConnectAPI.onConnect += OnConnect2;
                //ServerIP = DefaultServer.ip;
                //ServerPort = DefaultServer.port;
                ConfParam paraCfg = ConfParam.Get("NewbieServerAddress");
                if (paraCfg != null)
                {
                    ServerIP = paraCfg.value;
                }
                paraCfg = ConfParam.Get("NewbieServerPort");
                if (paraCfg != null)
                {
                    ServerPort = Int32.Parse(paraCfg.value);
                }
                ConnectAPI.Connect(ServerIP, ServerPort);
            }
            else
            {
                SendNewbie();
            }
        }

        private void OnConnect2(NetErrors error)
        {
            if (m_waitConnect != null)
            {
                StopCoroutine(m_waitConnect);
                m_waitConnect = null;
            }
            else
            {
                PopupWindowManager.Inst.ShowWaitPanel(false);
            }

            ConnectAPI.onConnect -= OnConnect2;

            if (error == NetErrors.ERROR_OK)
            {
                SendNewbie();
            }
            else
            {
                PopupWindowManager.Inst.ShowTips("连接失败，服务器未开启！");
                GameLog.Caizhuen.Error(error.ToString());
            }
        }

        private void SendNewbie()
        {
            //GameLog.Xuezhishan.Error("Send CSNewbieFight");
            CSNewbieFight msg1 = new CSNewbieFight();
            ConnectAPI.QueuePacket(msg1);
        }
    }
}
