// 条件：  4月24日-4月27日开启的服务器活跃（在5月1日、5月2日有登录）玩家（安卓混服1服-13服，应用宝服务器1服-7服，iOS2服-3服）： 区分vip0-vip4，vip5-vip7，vip8及以上三个用户层;

//计算活跃用户;
SELECT COUNT(1) FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4;
SELECT COUNT(*) FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7;
SELECT COUNT(1) FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8;

//用户的平均等级;
SELECT AVG(LEVEL) AS lvAv  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4;
SELECT AVG(LEVEL) AS lvAv  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7;
SELECT AVG(LEVEL) AS lvAv  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8;
// 用户的平均元宝剩余;
SELECT AVG(gold) AS lvAv  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4;
SELECT AVG(gold) AS lvAv  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7;
SELECT AVG(gold) AS lvAv  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8;



SELECT human.`AdvancedLv` FROM human WHERE human.`id` IN (SELECT * FROM aaa);
SELECT general.`AdvancedLv` FROM general WHERE general.`id` IN (SELECT * FROM aaa);

SELECT AVG(human.`AdvancedLv`) AS lvAv FROM human WHERE human.`id` IN (SELECT * FROM aaa);
SELECT AVG(general.`AdvancedLv`) AS lvAv FROM general WHERE general.`id` IN (SELECT * FROM aaa);



// 用户每日平均点金元宝消耗;

// 用户每日平均元宝总消耗;
-- 需要建立一张活跃用户的主将和上阵武将的id表

//用户装备的平均强化等级;-- 以活跃用户的主角，以及上阵主将为id进行过滤
SELECT AVG(IntensifyLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '16777472' OR TYPE = '16777728' OR TYPE = '16777984' OR TYPE = '16778240') AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
SELECT AVG(IntensifyLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '16777472' OR TYPE = '16777728' OR TYPE = '16777984' OR TYPE = '16778240') AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
SELECT AVG(IntensifyLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '16777472' OR TYPE = '16777728' OR TYPE = '16777984' OR TYPE = '16778240') AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);

//用户装备的平均精炼等级;
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '16777472' OR TYPE = '16777728' OR TYPE = '16777984' OR TYPE = '16778240') AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '16777472' OR TYPE = '16777728' OR TYPE = '16777984' OR TYPE = '16778240') AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '16777472' OR TYPE = '16777728' OR TYPE = '16777984' OR TYPE = '16778240') AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);



//用户上阵英雄的平均进阶等级（主角）;
SELECT AVG(AdvancedLv) AS lvAv  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4;
SELECT AVG(AdvancedLv) AS lvAv  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7;
SELECT AVG(AdvancedLv) AS lvAv  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8;

//用户上阵英雄的平均进阶等级（10资质武将）;
SELECT AVG(AdvancedLv) AS lvAv FROM general WHERE general.`Aptitude` = 10 AND general.`HumanId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
SELECT AVG(AdvancedLv) AS lvAv FROM general WHERE general.`Aptitude` = 12 AND general.`HumanId`  IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
SELECT AVG(AdvancedLv) AS lvAv FROM general WHERE general.`Aptitude` = 13 AND general.`HumanId`  IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);
SELECT AVG(AdvancedLv) AS lvAv FROM general WHERE general.`Aptitude` = 16 AND general.`HumanId`  IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);


//用户上阵英雄的平均进阶等级（12资质武将）;
//用户上阵英雄的平均进阶等级（主角、10资质武将、12资质武将、13资质武将、16资质武将）;
//用户上阵英雄的平均进阶等级（主角、10资质武将、12资质武将、13资质武将、16资质武将）;

//用户符文的平均强化等级（2个）;
-- 符文
SELECT AVG(IntensifyLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
SELECT AVG(IntensifyLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
SELECT AVG(IntensifyLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);
-- 经卷
SELECT AVG(IntensifyLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
SELECT AVG(IntensifyLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
SELECT AVG(IntensifyLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);


//用户符文的平均精炼等级（2个）;
-- 符文
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);
-- 经卷
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);

//用户玄兵的平均进阶等级（15品质、18品质;
-- 15
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005014' OR sn = '4005015' OR sn = '4005016' OR sn = '4005017' OR sn = '4005019' OR sn = '4005020' OR sn = '4005021' OR sn = '4005022' OR sn = '4005023' OR sn = '4005029' OR sn = '4005030' OR sn = '4005031' OR sn = '4005032' OR sn = '4005033' OR sn = '4005034' OR sn = '4005040' OR sn = '4005041' OR sn = '4005042' OR sn = '4005043' OR sn = '4005044' OR sn = '4005045' OR sn = '4005046' OR sn = '4005047')
  AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005014' OR sn = '4005015' OR sn = '4005016' OR sn = '4005017' OR sn = '4005019' OR sn = '4005020' OR sn = '4005021' OR sn = '4005022' OR sn = '4005023' OR sn = '4005029' OR sn = '4005030' OR sn = '4005031' OR sn = '4005032' OR sn = '4005033' OR sn = '4005034' OR sn = '4005040' OR sn = '4005041' OR sn = '4005042' OR sn = '4005043' OR sn = '4005044' OR sn = '4005045' OR sn = '4005046' OR sn = '4005047')
 AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005014' OR sn = '4005015' OR sn = '4005016' OR sn = '4005017' OR sn = '4005019' OR sn = '4005020' OR sn = '4005021' OR sn = '4005022' OR sn = '4005023' OR sn = '4005029' OR sn = '4005030' OR sn = '4005031' OR sn = '4005032' OR sn = '4005033' OR sn = '4005034' OR sn = '4005040' OR sn = '4005041' OR sn = '4005042' OR sn = '4005043' OR sn = '4005044' OR sn = '4005045' OR sn = '4005046' OR sn = '4005047')
 AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);

-- 18
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005011' OR sn = '4005012' OR sn = '4005013' OR sn = '4005018' OR sn = '4005020' OR sn = '4005024' OR sn = '4005025' OR sn = '4005026' OR sn = '4005027' OR sn = '4005028' OR sn = '4005035' OR sn = '4005036' OR sn = '4005037' OR sn = '4005038' OR sn = '4005039' OR sn = '4005048' OR sn = '4005049' OR sn = '4005050' OR sn = '4005051' OR sn = '4005052' OR sn = '4005053' OR sn = '4005054' OR sn = '4005055') AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005011' OR sn = '4005012' OR sn = '4005013' OR sn = '4005018' OR sn = '4005020' OR sn = '4005024' OR sn = '4005025' OR sn = '4005026' OR sn = '4005027' OR sn = '4005028' OR sn = '4005035' OR sn = '4005036' OR sn = '4005037' OR sn = '4005038' OR sn = '4005039' OR sn = '4005048' OR sn = '4005049' OR sn = '4005050' OR sn = '4005051' OR sn = '4005052' OR sn = '4005053' OR sn = '4005054' OR sn = '4005055') AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
SELECT AVG(RefineLv) AS lvAv FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005011' OR sn = '4005012' OR sn = '4005013' OR sn = '4005018' OR sn = '4005020' OR sn = '4005024' OR sn = '4005025' OR sn = '4005026' OR sn = '4005027' OR sn = '4005028' OR sn = '4005035' OR sn = '4005036' OR sn = '4005037' OR sn = '4005038' OR sn = '4005039' OR sn = '4005048' OR sn = '4005049' OR sn = '4005050' OR sn = '4005051' OR sn = '4005052' OR sn = '4005053' OR sn = '4005054' OR sn = '4005055') AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8);

-- 通过OwnerName名字查找物品
SELECT * FROM item_bag WHERE  OwnerName='千乘鸿飞';

-- 通过 OwnerId 名字查找物品
SELECT * FROM item_bag WHERE  OwnerId='100000000031000004';


-- 通过id查找物品
SELECT * FROM item_bag WHERE  id='100000001285000064';

-- 通过crossid查找物品
SELECT * FROM item_bag WHERE  CrossId='100020000046000026';


SELECT * FROM item_bag WHERE item_bag.`CrossId` > 1 AND item_bag.`OwnerId` IN(SELECT id  FROM human WHERE human.`VipLevel` >= '8');


-- 18
SELECT  * FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND item_bag.`OwnerId` IN (SELECT id  FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);










SELECT * FROM human WHERE FIND_IN_SET(100020000046000003, human.`GenLineup`);
SELECT * FROM human WHERE GenLineup LIKE "%100020000046000003%";

-- 新的查询语句学习

-- count 计算数量 count(*) 或者count(1) 都可以计算数量
//计算活跃用户;
SELECT COUNT(1) FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4;
SELECT COUNT(*) FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7;
SELECT COUNT(1) FROM human WHERE human.`TimeLogin` > 1525104000000 AND human.`TimeCreate`< 1524844800000 AND human.`VipLevel`>=8;


-- SUBSTRING_INDEX(str,delim,COUNT) 说明：substring_index（被截取字段，关键字，关键字第几次出现，负数表示倒过来数）;
SELECT SUBSTRING_INDEX(human.`GenLineup`, ':', 1) FROM human; -- 选择从 开头开始，到关键字出现的位置 之间的内容

-- SUBSTRING(str, pos)截取字符串; 从 str 指定位置pos 开始截取,从左至右，直到右边结尾，正数表示指定位置从左开始数，负数表示从右开始数
SELECT SUBSTRING(id, 5) FROM human;
SELECT SUBSTRING(id, -10) FROM human;


-- SUBSTRING(str, pos,len);截取字符串; 从 str 指定位置pos 开始截取指定长度len;pos 下标是从1开始的
SELECT SUBSTRING(human.`GenLineup`, 5,3) FROM human;

-- LENGTH()表示计算一个字符串的长度，以下:::长度为3
SELECT SUBSTRING(human.`GenLineup`, LENGTH(':::')) FROM human;

-- LOCATE(SUBSTR,str) 返回子串 SUBSTR 在字符串 str 中第一次出现的位置。如果子串 SUBSTR 在 str 中不存在，返回值为 0;
SELECT LOCATE('g0',human.`GenLineup`) FROM human;

-- LOCATE(SUBSTR,str,pos) 返回子串 SUBSTR 在字符串 str 中的第 pos 位置后第一次出现的位置。如果 SUBSTR 不在 str 中返回 0;
SELECT LOCATE('g',human.`GenLineup`,6) FROM human;

SELECT SUBSTRING( human.`GenLineup`, LOCATE(':',human.`GenLineup`)+1, ( LOCATE(',',human.`GenLineup`)-1-LOCATE(':',human.`GenLineup`) )  ) FROM human;

-- 截取第一个武将
SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 1)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))-1

)  AS SIGNED FROM human;

SELECT  * FROM human WHERE CAST(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 1)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))-1

) AS SIGNED ) > 1000;

-- cast 数据类型转换 还有convert() cast(value as type) 、 convert(value,type)
SELECT  * IF (CAST(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 1)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))-1

) AS SIGNED ) > 1000 , 1 , 0) FROM human;

SELECT * FROM general WHERE id = '100000000031000004';
SELECT * FROM human WHERE id = '100000000031000004';

-- 查询截取id，然后建表;

CREATE TABLE a1 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 1)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 1)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 1))-1

))>6);

CREATE TABLE a2 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 2))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 2)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 2))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 2))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 2)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 2))-1

))>6);

CREATE TABLE a3 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 3))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 3)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 3))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 3))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 3)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 3))-1

))>6);

CREATE TABLE a4 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 4))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 4)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 4))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 4))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 4)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 4))-1

))>6);

CREATE TABLE a5 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 5))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 5)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 5))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 5))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 5)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 5))-1

))>6);

CREATE TABLE a6 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 6))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 6)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 6))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 6))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 6)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 6))-1

))>6);

CREATE TABLE a7 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 7))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 7)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 7))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 7))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 7)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 7))-1

))>6);

CREATE TABLE a8 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 8))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 8)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 8))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 8))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 8)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 8))-1

))>6);

CREATE TABLE a9 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 9))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 9)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 9))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 9))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 9)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 9))-1

))>6);

CREATE TABLE a10 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 10))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 10)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 10))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 10))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 10)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 10))-1

))>6);

CREATE TABLE a11 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 11))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 11)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 11))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 11))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 11)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 11))-1

))>6);

CREATE TABLE a12 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 12))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 12)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 12))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 12))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 12)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 12))-1

))>6);

CREATE TABLE a13 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 13))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 13)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 13))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 13))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 13)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 13))-1

))>6);

CREATE TABLE a14 (SELECT  SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 14))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 14)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 14))-1

)  AS ids FROM human WHERE LENGTH(SUBSTRING( human.`GenLineup`,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 14))+2,

LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ',', 14)) -LENGTH(SUBSTRING_INDEX(human.`GenLineup`, ':', 14))-1

))>6);

CREATE TABLE a15 (SELECT SUBSTRING_INDEX(a14.`ids`, '}', 1) AS ids FROM a14);
CREATE TABLE a17 (SELECT SUBSTRING_INDEX(a7.`ids`, '}', 1) AS ids FROM a7);
CREATE TABLE a1copy (SELECT * FROM a1);

-- 修改表的数据类型: alter修改的意思。 ALTER TABLE 表名  MODIFY COLUMN 字段名 字段类型定义;
ALTER TABLE a1 MODIFY ids BIGINT;
ALTER TABLE a2 MODIFY ids BIGINT;
ALTER TABLE a3 MODIFY ids BIGINT;
ALTER TABLE a4 MODIFY ids BIGINT;
ALTER TABLE a5 MODIFY ids BIGINT;
ALTER TABLE a6 MODIFY ids BIGINT;
ALTER TABLE a17 MODIFY ids BIGINT;
ALTER TABLE a8 MODIFY ids BIGINT;
ALTER TABLE a9 MODIFY ids BIGINT;
ALTER TABLE a10 MODIFY ids BIGINT;
ALTER TABLE a11 MODIFY ids BIGINT;
ALTER TABLE a12 MODIFY ids BIGINT;
ALTER TABLE a13 MODIFY ids BIGINT;
ALTER TABLE a15 MODIFY ids BIGINT;


-- 把一个表出入到另外一个表
INSERT INTO a1 SELECT * FROM a2;
INSERT INTO a1 SELECT * FROM a3;
INSERT INTO a1 SELECT * FROM a4;
INSERT INTO a1 SELECT * FROM a5;
INSERT INTO a1 SELECT * FROM a6;
INSERT INTO a1 SELECT * FROM a17;
INSERT INTO a1 SELECT * FROM a8;
INSERT INTO a1 SELECT * FROM a9;
INSERT INTO a1 SELECT * FROM a10;
INSERT INTO a1 SELECT * FROM a11;
INSERT INTO a1 SELECT * FROM a12;
INSERT INTO a1 SELECT * FROM a13;
INSERT INTO a1 SELECT * FROM a15;

-- 修改一个列的数据类型，同时修改列的名字
ALTER TABLE a1 CHANGE COLUMN ids momo BIGINT;

-- 增加一个列1
ALTER TABLE a1 ADD COLUMN id2 INT;

-- 增加一个列2:指定列的位置 alter table 表名 add column 列名 varchar(20) not null after user1;
ALTER TABLE a1 ADD COLUMN id3 INT NOT NULL AFTER momo;

-- 删除一个列 alter table 表名 drop column 列名；
ALTER TABLE award DROP COLUMN a;
-- 删除多个列:alter table 表名 drop column 列名,drop column 列名;
ALTER TABLE a1 DROP COLUMN id,DROP COLUMN id2;

-- 插入一行
INSERT INTO av (NAME,vip04Advancelv,vip57Advancelv,vip8Advancelv) VALUES ('kk',1,2,3);
INSERT INTO av (NAME) VALUES ('主角的平均进阶等级');

-- 修改一个数据
UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值;

-- union*************开始
-- 合并查询两张表，排除重复的值
SELECT * FROM a14 UNION SELECT * FROM a15;
-- 合并查询两张表，不排除重复的值
SELECT * FROM a14 UNION ALL SELECT * FROM a15;
-- union*************结束

-- AS**********************学习开始：
-- 1.可给数据列取一个新别名
-- 2.可给表取一个新别名
-- 3.可把经计算或总结的结果用另外一个新名称来代替
-- select查询可以使用AS关键字为查询的字段起一个别名，该别名用作表达式的列名，并且别名可以在GROUP BY，ORDER BY或HAVING等语句中使用
SELECT ids AS fuck FROM a14 AS fool;
-- 由于AS是可选的，如果你在查询字段之间忘记输入逗号，MySQL将把第二个字段作为第一个字段的别名。例如，在下面的SQL语句中columnb被视为columna的别名：
SELECT ids fff FROM a14;
-- 结果集 当做 fool表。此处不产生新表，命名一个新的表名要干啥？用于存储过程？？
SELECT * FROM a14 AS fool;
SELECT * FROM fool;-- 错误

-- AS**********************学习结束：

-- group by**********************开始

-- by 后面添加的是条件，以某一个条件分组，计算数值
-- 所谓的分组就是将一个“数据集”划分成若干个“小区域”，然后针对若干个“小区域”进行数据处理。
-- 注意： 在select指定的字段要么就要包含在Group By语句的后面，作为分组的依据；要么就要被包含在聚合函数中。
SELECT  sex ,SUM(human.`Level`) AS sumlevel FROM zhenhuadb.`human` GROUP BY human.`Sex` ; -- 正确
-- 以性别作为分组，计算等级总和，并计算每个分组的数量
SELECT  sex ,SUM(human.`Level`) AS sumlevel, COUNT(*) AS num FROM zhenhuadb.`human` GROUP BY human.`Sex` ; -- 正确

SELECT  sex ,id,account,NAME,SUM(human.`Level`) AS sumlevel FROM zhenhuadb.`human` GROUP BY human.`Sex` ORDER BY sumlevel DESC; -- 正确,但是这样是毫无意义的，我们是要计算不同的sex类的等级之和
-- 注意：mysql 并不支持group by all，只要在group by 后面加上多个条件就可以了！！
SELECT sex ,combat, SUM(human.`Level`) AS sumlevel FROM human GROUP BY  sex,combat;

-- group by**********************结束

-- having ***********************开始
-- having字句可以让我们筛选成组后的各种数据，where字句在聚合前先筛选记录，也就是说作用在group by和having字句前。而 having子句在聚合后对组记录进行筛选。
-- 分组计算数据：
SELECT sex, SUM(combat) AS sumcombatt FROM human GROUP BY sex;
-- 再分组计算后，筛选结果,此处不能用到where
SELECT sex, SUM(combat) AS sumcombatt FROM human GROUP BY sex HAVING SUM(combat)>339087;

-- having ***********************结束

-- IN**********************开始

-- IN 运算符用于 WHERE 表达式中，以列表项的形式支持多个选择，语法如下：
-- WHERE column IN (value1,value2,...)
-- WHERE column NOT IN (value1,value2,...)
-- 当 IN 前面加上 NOT 运算符时，表示与 IN 相反的意思，即不在这些列表项内选择。

SELECT * FROM USER WHERE uid IN (2,3,5);
-- 更多情况下，IN 列表项的值是不明确的，而可能是通过一个子查询得到的：

SELECT * FROM article WHERE uid IN(SELECT uid FROM USER WHERE STATUS=0);
-- IN 列表项不仅支持数字，也支持字符甚至时间日期类型等，并且可以将这些不同类型的数据项混合排列而无须跟 column 的类型保持一致：

SELECT * FROM USER WHERE uid IN(1,2,'3','c');
-- 一个 IN 只能对一个字段进行范围比对，如果要指定更多字段，可以使用 AND 或 OR 逻辑运算符：

SELECT * FROM USER WHERE uid IN(1,2) OR username IN('admin','manong');
-- 使用 AND 或 OR 逻辑运算符后，IN 还可以和其他如 LIKE、>=、= 等运算符一起使用。

-- IN 列表项不仅支持数字，也支持字符甚至时间日期类型等，并且可以将这些不同类型的数据项混合排列而无须跟 column 的类型保持一致：

SELECT * FROM USER WHERE uid IN(1,2,'3','c');
-- 一个 IN 只能对一个字段进行范围比对，如果要指定更多字段，可以使用 AND 或 OR 逻辑运算符：

SELECT * FROM USER WHERE uid IN(1,2) OR username IN('admin','manong')
-- 使用 AND 或 OR 逻辑运算符后，IN 还可以和其他如 LIKE、>=、= 等运算符一起使用。

-- 关于 IN 运算符的效率问题

-- 如果 IN 的列表项是确定的，那么可以用多个 OR 来代替：

SELECT * FROM USER WHERE uid IN (2,3,5);
-- 等效为：
SELECT * FROM USER WHERE (uid=2 OR aid=3 OR aid=5);
-- 一般认为，如果是对索引字段进行操作，使用 OR 效率高于 IN，但对于列表项不确定的时候（如需要子查询得到结果），就必须使用 IN 运算符。另外，对于子查询表数据小于主查询的时候，也是适用 IN 运算符的。

-- IN**********************结束
CREATE TABLE a_uion  ((SELECT  a14.`ids` FROM a14 UNION SELECT a15.`ids` FROM a15) AS foll);

SELECT  a14.`ids` FROM a14 UNION SELECT a15.`ids` FROM a15;

SELECT a14.`ids` AS foool FROM a14;

-- 在一个表格内插入另一个表格中的数据，排除重复的数据
INSERT INTO a14 SELECT * FROM a15 WHERE a15.`ids` NOT IN (SELECT * FROM a14);

INSERT INTO a1 SELECT human.`id` FROM human WHERE human.id NOT IN (SELECT * FROM a1);

-- ******************时间转化--开始************************
-- 日期转换为时间戳 ：秒 如：1525104000，转成毫秒要*1000
SELECT UNIX_TIMESTAMP('2018-05-01');  
SELECT UNIX_TIMESTAMP('2018-05-02');  

-- 似乎是有now()当前时间才能用，直接写秒是错误的
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d'); 
-- 时间戳秒 转换为 日期
SELECT FROM_UNIXTIME(1525104000000/1000);
SELECT FROM_UNIXTIME(1524844800000/1000);

-- ******************时间转化--结束************************

-- 两个表的查询结果放在一起
SELECT item_bag.`id`,item_bag.`OwnerId`,item_bag.`Sn` ,item_bag.`Num`,human.`StarLv` FROM item_bag,human WHERE item_bag.`Sn` ='5001005' AND human.`id` ='200020000196000042' AND item_bag.`OwnerId` = '200020000196000042';

-- 查看指定的数据库中的表格的个数
SELECT COUNT(TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_SCHEMA ='user_login';

-- ******************删除多余的条目--开始************************
-- 删除多余的条目，保留等级最大的那个
DELETE FROM human WHERE account IN (SELECT account FROM ( SELECT account FROM human b GROUP BY b.account HAVING COUNT(*)> 1)b ) 
AND LEVEL NOT IN (SELECT LEVEL FROM ( SELECT MAX(c.level) AS LEVEL FROM human c GROUP BY c.account HAVING COUNT(*)> 1)c)
-- 删除多余的条目，保留id最小的
DELETE FROM human WHERE account IN (SELECT account FROM ( SELECT account FROM human b GROUP BY b.account HAVING COUNT(*)> 1)b ) 
AND id NOT IN (SELECT id FROM(SELECT MIN(d.id) AS id FROM human d GROUP BY d.account HAVING COUNT(*)>1)d );
-- ******************删除多余的条目--结束************************

-- ******************删除条目--开始************************
 -- 删除表数据 ，再添加时，下标从1开始
 TRUNCATE temp1;
 -- delete删除 ，再添加时，下标是原来最大值+1
 DELETE FROM temp1;
 -- delete 可以添加 where 子句 
 DELETE FROM temp1 WHERE id = '1';
-- ******************删除条目--结束************************


-- ******************临时表创建--开始************************
-- 创建一个 临时表，把所有重复的值放在一起
DROP TABLE IF EXISTS huamnInfo;
CREATE  TEMPORARY TABLE huamnInfo (SELECT * FROM human WHERE account IN (SELECT account FROM human GROUP BY account HAVING COUNT(*)>1));
-- ******************临时表创建--结束************************

-- 根据某个字段的值，修改另一个字段的值，并限制修改的范围
UPDATE human
    SET NAME = CASE LEVEL 
        WHEN 80 THEN 'laji' 
        WHEN 44 THEN 'zhu'
        WHEN 3 THEN 'bendan' 
    END
WHERE id IN (100000000000000003,2,3);


-- 夸数据库 同表查询
SELECT a.Account FROM anzhuo.human a,anzhuo2.human b WHERE a.`Account` = b.`Account`;

-- CONCAT拼接字符串 CONCAT（str1,str2,str3....）
SELECT CONCAT(1,2,3,4,5,6,7);

-- 选择 id最大的一组数据
SELECT * FROM human WHERE id = (SELECT MAX(id) FROM human);

-- 筛选重名的账号

SELECT * FROM (SELECT * FROM human WHERE NAME IN (SELECT NAME FROM human GROUP BY NAME HAVING COUNT(*) >1) AS namelist) WHERE LEVEL = (SELECT MAX(LEVEL) FROM namelist);

 SELECT * FROM ( SELECT COUNT(*) AS COUNT  ,NAME,SUM(LEVEL) AS lv FROM human GROUP BY NAME ORDER BY COUNT DESC ,LEVEL DESC ) AS tmp GROUP BY COUNT,NAME ORDER BY COUNT DESC ,lv DESC;
 
 
 SELECT COUNT(*),id ,NAME,LEVEL FROM human GROUP BY NAME,LEVEL;
 
 
 SELECT MAX(LEVEL) AS LEVEL FROM human GROUP BY account HAVING COUNT(*)> 1;

 SELECT  MAX(LEVEL) FROM human GROUP BY NAME HAVING COUNT(*)> 1;
 
 -- 找到重复的字段
 SELECT * FROM tb_table WHERE sample_code IN(  SELECT sample_code FROM tb_table GROUP BY sample_code HAVING COUNT(sample_code) > 1   );
 -- 删除重复的字段
 DELETE FROM tb_table WHERE id NOT IN (SELECT maxid FROM (SELECT MAX(id) AS maxid FROM tb_table GROUP BY sample_code) b);

-- 获取重复牛字段的记录中，其他字段是最大的记录
SELECT id,NAME,COUNT(1),MAX(CONCAT(LEVEL, '-', id)) AS maxlevel FROM human GROUP BY NAME HAVING COUNT(1)>1;
SELECT id,NAME,COUNT(1),MIN(CONCAT(LEVEL, '-', id)) AS minlevel FROM human GROUP BY NAME HAVING COUNT(1)>1;

-- 数据表删除重复字段，只保留等级最大的值
SELECT id,NAME,account,LEVEL FROM human WHERE account IN (SELECT account FROM ( SELECT account FROM human GROUP BY account HAVING COUNT(*)> 1) AS fuck1) 
AND CONCAT(LEVEL,'-',id)  IN (SELECT MAX(CONCAT(LEVEL, '-', id)) AS maxlevel FROM human GROUP BY account HAVING COUNT(1)>1);

-- 强制转换字符串为数字CONCAT
-- 拼装的字符串要转换成 signed格式 才能比较大小？？？
SELECT account,MAX(CAST(CONCAT(LEVEL,SUBSTRING(id, 1,5)) AS SIGNED )) AS maxlevel FROM human GROUP BY account HAVING COUNT(1)>1;
SELECT account,MAX(CONCAT(LEVEL,SUBSTRING(id, 1,5))) AS maxlevel FROM human GROUP BY account HAVING COUNT(1)>1;

SELECT MAX(CAST(CONCAT(LEVEL,SUBSTRING(id, 1,10)) AS SIGNED)) AS maxlevelId FROM human GROUP BY account HAVING COUNT(1)>1;
SELECT MAX(CAST(CONCAT(LEVEL,SUBSTRING(id,1,8),SUBSTRING(id,-8)) AS SIGNED)) AS maxlevelId FROM human GROUP BY account HAVING COUNT(1)>1;

-- 要拆分id，不然会超过范围
SELECT account,MAX(CAST(CONCAT(LEVEL,id) AS SIGNED )) AS maxlevel FROM human GROUP BY account HAVING COUNT(1)>1;


-- 进制转换
-- CONV(N,from_base,to_base)
-- N是要转换的数据，from_base是原进制，to_base是目标进制。 
SELECT CONV('123',10,10);

-- 超长数字可以转换为double双精度 decimal(指定长度，保留的小数位数)
SELECT MAX(CAST(CONCAT(LEVEL,id) AS  DECIMAL(23,0))) AS maxlevel FROM human GROUP BY account HAVING COUNT(1)>1;

-- 查找两个数据库，两个表字段相同的记录
-- 未简化：
SELECT anzhuo.`human`.`id`,anzhuo.`human`.`Name` ,anzhuo2.`human`.`id`,anzhuo2.`human`.`Name` FROM anzhuo.`human`,anzhuo2.`human` WHERE anzhuo.`human`.`Account` = anzhuo2.`human`.`Account`;
-- 简化后：select 表别名.列名 from 库名.表名 表别名，库名2.表名2 表别名2 where 表别名.列名 = 表别名.列名
-- 观察：在 from后面定义 表别名， 格式： 库.表 别名
SELECT a.`id`,a.`Name`, b.`id`,b.`Name` FROM anzhuo.`human` a,anzhuo2.`human` b WHERE a.`Account` = b.`Account`;

-- 获取数据库当前时间
SELECT NOW();-- 当前机器时间
SELECT CURRENT_TIMESTAMP(3);
SELECT CURRENT_TIMESTAMP(6);
SELECT REPLACE(UNIX_TIMESTAMP(CURRENT_TIMESTAMP(3)), '.', '');-- 获取当前机器时间毫秒
SELECT REPLACE(UNIX_TIMESTAMP(CURRENT_TIMESTAMP(6)), '.', '');-- 获取当前机器时间微秒


-- -------------------------------------------------------合服bug修改
-- 检测
SELECT * FROM activity_humandata WHERE activity_humandata.humanid = "100070000016000009";
SELECT * FROM instance WHERE instance.`id` = "100070000016000009";
SELECT * FROM backlog WHERE backlog.humanid = "100070000016000009";
SELECT * FROM fengmo WHERE fengmo.id = "100070000016000009";
SELECT * FROM friend WHERE friend.id = "100070000016000009";
SELECT * FROM general WHERE general.humanid = "100070000016000009";
SELECT * FROM human_ext WHERE human_ext.id = "100070000016000009";
SELECT * FROM human_ext2 WHERE human_ext2.id = "100070000016000009";
SELECT * FROM mail WHERE mail.receiver = "100070000016000009";
SELECT * FROM quest WHERE quest.id = "100070000016000009";
SELECT * FROM rep_special WHERE rep_special.id = "100070000016000009";
SELECT * FROM rep_turn_around WHERE rep_turn_around.humanid = "100070000016000009";
SELECT * FROM shopexchange WHERE shopexchange.id = "100070000016000009";
SELECT * FROM tower WHERE tower.id = "100070000016000009";



-- 查询数量
SELECT COUNT(1) FROM human; -- 2571  830
SELECT COUNT(1) FROM lastId; --  221
SELECT COUNT(1) FROM humancopy; -- 1490
SELECT COUNT(1) FROM activity_humandata; -- 30521
SELECT COUNT(1) FROM copy_activity_humandata; -- 43797
SELECT * FROM lastId; --  221

-- 开始。。。。。修改 合服bug
-- 
-- 
CREATE TABLE  humancopy LIKE human;
CREATE TABLE `maxId` (`id` BIGINT(20) NOT NULL, PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;
CREATE TABLE `lastId` (`id` BIGINT(20) NOT NULL, PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;
CREATE TABLE `repeatIds` (  `id` BIGINT(20) NOT NULL, `level` INT(11) NOT NULL, `Account` VARCHAR(64) NOT NULL,`Name` VARCHAR(32) NOT NULL, PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;
CREATE TABLE  copy_activity_humandata LIKE activity_humandata;
CREATE TABLE  copy_instance LIKE instance;
CREATE TABLE  copy_backlog LIKE backlog;
CREATE TABLE  copy_fengmo LIKE fengmo;
CREATE TABLE  copy_friend LIKE friend;
CREATE TABLE  copy_general LIKE general ;
CREATE TABLE  copy_human_ext LIKE human_ext;
CREATE TABLE  copy_human_ext2 LIKE human_ext2;
CREATE TABLE  copy_mail LIKE mail;
CREATE TABLE  copy_quest LIKE quest;
CREATE TABLE  copy_rep_special LIKE rep_special;
CREATE TABLE  copy_rep_turn_around LIKE rep_turn_around;
CREATE TABLE  copy_shopexchange LIKE shopexchange;
CREATE TABLE  copy_tower LIKE tower ;

-- 插入所有的角色信息 
INSERT INTO humancopy SELECT * FROM `ty_ios8game`.`human`;
INSERT INTO humancopy SELECT * FROM `ty_ios9game`.`human`;
INSERT INTO humancopy SELECT * FROM `ty_ios10game`.`human`;
INSERT INTO humancopy SELECT * FROM `ty_ios11game`.`human`;
INSERT INTO humancopy SELECT * FROM `ty_ios12game`.`human`;


INSERT INTO repeatIds (id,LEVEL,Account,NAME) SELECT id,LEVEL,Account,NAME FROM humancopy WHERE account IN (SELECT account FROM humancopy GROUP BY account HAVING COUNT(1)>1);
INSERT INTO maxId SELECT MAX(CAST(CONCAT(LEVEL,SUBSTRING(id, 1,5),SUBSTRING(id, -9)) AS SIGNED)) FROM repeatIds GROUP BY account HAVING COUNT(1)>1;
-- 得到要插入的id
INSERT INTO lastId (SELECT id FROM repeatIds WHERE CAST(CONCAT(LEVEL,SUBSTRING(id, 1,5),SUBSTRING(id, -9)) AS SIGNED) IN (SELECT id FROM maxId));

-- 插入重复的数据 `ty_ios13game`
INSERT INTO copy_activity_humandata SELECT * FROM `ty_ios8game`.`activity_humandata`;
INSERT INTO copy_activity_humandata SELECT * FROM `ty_ios9game`.`activity_humandata`;
INSERT INTO copy_activity_humandata SELECT * FROM `ty_ios10game`.`activity_humandata`;
INSERT INTO copy_activity_humandata SELECT * FROM `ty_ios11game`.`activity_humandata`;
INSERT INTO copy_activity_humandata SELECT * FROM `ty_ios12game`.`activity_humandata`;

INSERT INTO copy_instance SELECT * FROM `ty_ios8game`.`instance`;
INSERT INTO copy_instance SELECT * FROM `ty_ios9game`.`instance`;
INSERT INTO copy_instance SELECT * FROM `ty_ios10game`.`instance`;
INSERT INTO copy_instance SELECT * FROM `ty_ios11game`.`instance`;
INSERT INTO copy_instance SELECT * FROM `ty_ios12game`.`instance`;

INSERT INTO copy_backlog SELECT * FROM `ty_ios8game`.`backlog`;
INSERT INTO copy_backlog SELECT * FROM `ty_ios9game`.`backlog`;
INSERT INTO copy_backlog SELECT * FROM `ty_ios10game`.`backlog`;
INSERT INTO copy_backlog SELECT * FROM `ty_ios11game`.`backlog`;
INSERT INTO copy_backlog SELECT * FROM `ty_ios12game`.`backlog`;

INSERT INTO copy_fengmo SELECT * FROM `ty_ios8game`.`fengmo`;
INSERT INTO copy_fengmo SELECT * FROM `ty_ios9game`.`fengmo`;
INSERT INTO copy_fengmo SELECT * FROM `ty_ios10game`.`fengmo`;
INSERT INTO copy_fengmo SELECT * FROM `ty_ios11game`.`fengmo`;
INSERT INTO copy_fengmo SELECT * FROM `ty_ios12game`.`fengmo`;

INSERT INTO copy_friend SELECT * FROM `ty_ios8game`.`friend`;
INSERT INTO copy_friend SELECT * FROM `ty_ios9game`.`friend`;
INSERT INTO copy_friend SELECT * FROM `ty_ios10game`.`friend`;
INSERT INTO copy_friend SELECT * FROM `ty_ios11game`.`friend`;
INSERT INTO copy_friend SELECT * FROM `ty_ios12game`.`friend`;

INSERT INTO copy_general SELECT * FROM `ty_ios8game`.`general`;
INSERT INTO copy_general SELECT * FROM `ty_ios9game`.`general`;
INSERT INTO copy_general SELECT * FROM `ty_ios10game`.`general`;
INSERT INTO copy_general SELECT * FROM `ty_ios11game`.`general`;
INSERT INTO copy_general SELECT * FROM `ty_ios12game`.`general`;

INSERT INTO copy_human_ext SELECT * FROM `ty_ios8game`.`human_ext`;
INSERT INTO copy_human_ext SELECT * FROM `ty_ios9game`.`human_ext`;
INSERT INTO copy_human_ext SELECT * FROM `ty_ios10game`.`human_ext`;
INSERT INTO copy_human_ext SELECT * FROM `ty_ios11game`.`human_ext`;
INSERT INTO copy_human_ext SELECT * FROM `ty_ios12game`.`human_ext`;

INSERT INTO copy_human_ext2 SELECT * FROM `ty_ios8game`.`human_ext2`;
INSERT INTO copy_human_ext2 SELECT * FROM `ty_ios9game`.`human_ext2`;
INSERT INTO copy_human_ext2 SELECT * FROM `ty_ios10game`.`human_ext2`;
INSERT INTO copy_human_ext2 SELECT * FROM `ty_ios11game`.`human_ext2`;
INSERT INTO copy_human_ext2 SELECT * FROM `ty_ios12game`.`human_ext2`;

INSERT INTO copy_mail SELECT * FROM `ty_ios8game`.`mail`;
INSERT INTO copy_mail SELECT * FROM `ty_ios9game`.`mail`;
INSERT INTO copy_mail SELECT * FROM `ty_ios10game`.`mail`;
INSERT INTO copy_mail SELECT * FROM `ty_ios11game`.`mail`;
INSERT INTO copy_mail SELECT * FROM `ty_ios12game`.`mail`;

INSERT INTO copy_quest SELECT * FROM `ty_ios8game`.`quest`;
INSERT INTO copy_quest SELECT * FROM `ty_ios9game`.`quest`;
INSERT INTO copy_quest SELECT * FROM `ty_ios10game`.`quest`;
INSERT INTO copy_quest SELECT * FROM `ty_ios11game`.`quest`;
INSERT INTO copy_quest SELECT * FROM `ty_ios12game`.`quest`;

INSERT INTO copy_rep_special SELECT * FROM `ty_ios8game`.`rep_special`;
INSERT INTO copy_rep_special SELECT * FROM `ty_ios9game`.`rep_special`;
INSERT INTO copy_rep_special SELECT * FROM `ty_ios10game`.`rep_special`;
INSERT INTO copy_rep_special SELECT * FROM `ty_ios11game`.`rep_special`;
INSERT INTO copy_rep_special SELECT * FROM `ty_ios12game`.`rep_special`;

INSERT INTO copy_rep_turn_around SELECT * FROM `ty_ios8game`.`rep_turn_around`;
INSERT INTO copy_rep_turn_around SELECT * FROM `ty_ios9game`.`rep_turn_around`;
INSERT INTO copy_rep_turn_around SELECT * FROM `ty_ios10game`.`rep_turn_around`;
INSERT INTO copy_rep_turn_around SELECT * FROM `ty_ios11game`.`rep_turn_around`;
INSERT INTO copy_rep_turn_around SELECT * FROM `ty_ios12game`.`rep_turn_around`;

INSERT INTO copy_shopexchange SELECT * FROM `ty_ios8game`.`shopexchange`;
INSERT INTO copy_shopexchange SELECT * FROM `ty_ios9game`.`shopexchange`;
INSERT INTO copy_shopexchange SELECT * FROM `ty_ios10game`.`shopexchange`;
INSERT INTO copy_shopexchange SELECT * FROM `ty_ios11game`.`shopexchange`;
INSERT INTO copy_shopexchange SELECT * FROM `ty_ios12game`.`shopexchange`;

INSERT INTO copy_tower SELECT * FROM `ty_ios8game`.`tower`;
INSERT INTO copy_tower SELECT * FROM `ty_ios9game`.`tower`;
INSERT INTO copy_tower SELECT * FROM `ty_ios10game`.`tower`;
INSERT INTO copy_tower SELECT * FROM `ty_ios11game`.`tower`;
INSERT INTO copy_tower SELECT * FROM `ty_ios12game`.`tower`;




-- 最终插入漏掉的数据

INSERT INTO activity_humandata (SELECT * FROM copy_activity_humandata WHERE copy_activity_humandata.`humanid` IN (SELECT id FROM lastId));
INSERT INTO instance (SELECT * FROM copy_instance WHERE copy_instance.`humanid` IN (SELECT id FROM lastId));
INSERT INTO backlog (SELECT * FROM copy_backlog WHERE copy_backlog.`humanid` IN (SELECT id FROM lastId));
INSERT INTO fengmo (SELECT * FROM copy_fengmo WHERE copy_fengmo.`id` IN (SELECT id FROM lastId));
INSERT INTO friend (SELECT * FROM copy_friend WHERE copy_friend.`id` IN (SELECT id FROM lastId));
INSERT INTO general (SELECT * FROM copy_general WHERE copy_general.`humanid` IN (SELECT id FROM lastId));
INSERT INTO human_ext (SELECT * FROM copy_human_ext WHERE copy_human_ext.`id` IN (SELECT id FROM lastId));
INSERT INTO human_ext2 (SELECT * FROM copy_human_ext2 WHERE copy_human_ext2.`id` IN (SELECT id FROM lastId));
INSERT INTO mail (SELECT * FROM copy_mail WHERE copy_mail.`receiver` IN (SELECT id FROM lastId));
INSERT INTO quest (SELECT * FROM copy_quest WHERE copy_quest.`id` IN (SELECT id FROM lastId));
INSERT INTO rep_special (SELECT * FROM copy_rep_special WHERE copy_rep_special.`id` IN (SELECT id FROM lastId));
INSERT INTO rep_turn_around (SELECT * FROM copy_rep_turn_around WHERE copy_rep_turn_around.`humanid` IN (SELECT id FROM lastId));
INSERT INTO shopexchange (SELECT * FROM copy_shopexchange WHERE copy_shopexchange.`id` IN (SELECT id FROM lastId));
INSERT INTO tower (SELECT * FROM copy_tower WHERE copy_tower.`id` IN (SELECT id FROM lastId));


-- 删除表格
DROP TABLE IF EXISTS humancopy;
DROP TABLE IF EXISTS maxId;
DROP TABLE IF EXISTS lastId;
DROP TABLE IF EXISTS repeatIds;
DROP TABLE IF EXISTS copy_activity_humandata ;
DROP TABLE IF EXISTS copy_instance;
DROP TABLE IF EXISTS copy_backlog;
DROP TABLE IF EXISTS copy_fengmo;
DROP TABLE IF EXISTS copy_friend;
DROP TABLE IF EXISTS copy_general;
DROP TABLE IF EXISTS copy_human_ext;
DROP TABLE IF EXISTS copy_human_ext2;
DROP TABLE IF EXISTS copy_mail;
DROP TABLE IF EXISTS copy_quest;
DROP TABLE IF EXISTS copy_rep_special;
DROP TABLE IF EXISTS copy_rep_turn_around ;
DROP TABLE IF EXISTS copy_shopexchange;
DROP TABLE IF EXISTS copy_tower;


-- 插入单独的，被删除的数据
--
--
-- 查找各个表格指定id的数据
SELECT id,NAME,account,LEVEL,human.`GuideClose`,human.`TimeLogin`,human.`TimeCreate`,human.`TimeLogout` FROM human WHERE account LIKE "%74720yijie_ios%";-- 角色信息 贺兰凤  100080000241000003
SELECT id,NAME,account,LEVEL,human.`GuideClose`,human.`TimeLogin`,human.`TimeCreate`,human.`TimeLogout` FROM human WHERE account LIKE "%55858yijie_ios%";-- 角色信息 许清河 100120000196000028 61级
SELECT * FROM activity_humandata WHERE activity_humandata.`humanId` = "100120000196000028";
SELECT * FROM instance WHERE instance.`humanId` = "100120000196000028";
SELECT * FROM backlog WHERE backlog.`humanId` = "100120000196000028";
SELECT * FROM fengmo WHERE fengmo.`ID` = "100120000196000028";
SELECT * FROM friend WHERE friend.`id` = "100120000196000028";
SELECT * FROM general WHERE general.`humanId` = "100120000196000028";
SELECT * FROM human_ext WHERE human_ext.`id` = "100120000196000028";
SELECT * FROM human_ext2 WHERE human_ext2.`id` = "100120000196000028";
SELECT * FROM mail WHERE mail.`receiver` = "100120000196000028";
SELECT * FROM quest WHERE quest.`id` = "100120000196000028";
SELECT * FROM rep_special WHERE rep_special.`id` = "100120000196000028";
SELECT * FROM rep_turn_around WHERE rep_turn_around.`humanId` = "100120000196000028";
SELECT * FROM shopexchange WHERE shopexchange.`id` = "100120000196000028";
SELECT * FROM tower WHERE tower.`id` = "100120000196000028";

-- 需要手动修改其账号account
-- 插入指定角色的数据
INSERT INTO human SELECT * FROM `ty_ios12game`.`human` WHERE ty_ios12game.`human`.`Account` = '55858yijie_ios';-- 最终插入漏掉的数据  
INSERT INTO activity_humandata (SELECT * FROM ty_ios12game.`activity_humandata` WHERE ty_ios12game.`activity_humandata`.`humanId` = "100120000196000028");
INSERT INTO instance (SELECT * FROM ty_ios12game.`instance` WHERE ty_ios12game.`instance`.`humanid` = "100120000196000028");
INSERT INTO backlog (SELECT * FROM ty_ios12game.`backlog` WHERE ty_ios12game.`backlog`.`humanid` = "100120000196000028");
INSERT INTO fengmo (SELECT * FROM ty_ios12game.`fengmo` WHERE ty_ios12game.`fengmo`.`id` = "100120000196000028");
INSERT INTO friend (SELECT * FROM ty_ios12game.`friend` WHERE ty_ios12game.`friend`.`id` = "100120000196000028");
INSERT INTO general (SELECT * FROM ty_ios12game.`general` WHERE ty_ios12game.`general`.`humanid` = "100120000196000028");
INSERT INTO human_ext (SELECT * FROM ty_ios12game.`human_ext` WHERE ty_ios12game.`human_ext`.`id` = "100120000196000028");
INSERT INTO human_ext2 (SELECT * FROM ty_ios12game.`human_ext2` WHERE ty_ios12game.`human_ext2`.`id` = "100120000196000028");
INSERT INTO mail (SELECT * FROM ty_ios12game.`mail` WHERE ty_ios12game.`mail`.`receiver` = "100120000196000028");
INSERT INTO quest (SELECT * FROM ty_ios12game.`quest` WHERE ty_ios12game.`quest`.`id` = "100120000196000028");
INSERT INTO rep_special (SELECT * FROM ty_ios12game.`rep_special` WHERE ty_ios12game.`rep_special`.`id` = "100120000196000028");
INSERT INTO rep_turn_around (SELECT * FROM ty_ios12game.`rep_turn_around` WHERE ty_ios12game.`rep_turn_around`.`humanid` = "100120000196000028");
INSERT INTO shopexchange (SELECT * FROM ty_ios12game.`shopexchange` WHERE ty_ios12game.`shopexchange`.`id` = "100120000196000028");
INSERT INTO tower (SELECT * FROM ty_ios12game.`tower` WHERE ty_ios12game.`tower`.`id` = "100120000196000028");

-- 需要手动修改其账号account
-- 插入指定角色的数据
-- 流程： 
-- 1.把旧号从旧库中复制插入新库，注意，human的账号会和原来的重复
-- 2.先把账号随便改个名字
-- 3.等旧号都复制过来后，把要覆盖的新号的账号黏贴到旧号账号内，并且，删除新号！
-- 4.结束

-- 把 合服前20服 的 古风歌 300200000061000119 ow0h000Umq_z0IBavNXaioBmvaQD74620B09C2CD765 lv:63 转移到 合服后的服 9_20服 的账号 5E8DAF28E723009836BF9982283FF8DFD74620B09C2CD765

-- 把 合服前 25_28 服 的 挥剑斩情 300280000091000377 ow0h006jmMEW9w21wlTIUv4Ox87MD74620B09C2CD765 lv:74 转移到 合服后的服 21_33 服 的账号 奔水怜梦 DC2A9215853FF426BFE3960D39EC936CD74620B09C2CD765

-- 把 合服前30服 的 冷如冰 300300000046000007 	     ow0h006jmMEW9w21wlTIUv4Ox87MD74620B09C2CD765 lv:51 转移到 合服后的服 21_33 服 的账号 宗正嘉实 06575862DFE41FDE3631FB19851F18A8D74620B09C2CD765

INSERT INTO human SELECT * 		 FROM ty_yyb30game.`human` 			WHERE ty_yyb30game.`human`.`Account` = 'ow0h006jmMEW9w21wlTIUv4Ox87MD74620B09C2CD765';-- 最终插入漏掉的数据  

INSERT INTO activity_humandata (SELECT * FROM ty_yyb30game.`activity_humandata` 	WHERE ty_yyb30game.`activity_humandata`.`humanId` 	= "300300000046000007");
INSERT INTO instance (SELECT *  	 FROM ty_yyb30game.`instance` 			WHERE ty_yyb30game.`instance`.`humanid` 		= "300300000046000007");
INSERT INTO backlog (SELECT *   	 FROM ty_yyb30game.`backlog` 			WHERE ty_yyb30game.`backlog`.`humanid` 			= "300300000046000007");
INSERT INTO fengmo (SELECT * 		 FROM ty_yyb30game.`fengmo` 			WHERE ty_yyb30game.`fengmo`.`id` 			= "300300000046000007");
INSERT INTO friend (SELECT * 		 FROM ty_yyb30game.`friend` 			WHERE ty_yyb30game.`friend`.`id` 			= "300300000046000007");
INSERT INTO general (SELECT * 		 FROM ty_yyb30game.`general` 			WHERE ty_yyb30game.`general`.`humanid` 			= "300300000046000007");
INSERT INTO human_ext (SELECT * 	 FROM ty_yyb30game.`human_ext` 			WHERE ty_yyb30game.`human_ext`.`id` 			= "300300000046000007");
INSERT INTO human_ext2 (SELECT * 	 FROM ty_yyb30game.`human_ext2` 		WHERE ty_yyb30game.`human_ext2`.`id` 			= "300300000046000007");
INSERT INTO mail (SELECT * 		 FROM ty_yyb30game.`mail` 			WHERE ty_yyb30game.`mail`.`receiver` 			= "300300000046000007");
INSERT INTO quest (SELECT * 		 FROM ty_yyb30game.`quest` 			WHERE ty_yyb30game.`quest`.`id` 			= "300300000046000007");
INSERT INTO rep_special (SELECT * 	 FROM ty_yyb30game.`rep_special` 		WHERE ty_yyb30game.`rep_special`.`id` 			= "300300000046000007");
INSERT INTO rep_turn_around (SELECT * 	 FROM ty_yyb30game.`rep_turn_around` 		WHERE ty_yyb30game.`rep_turn_around`.`humanid` 		= "300300000046000007");
INSERT INTO shopexchange (SELECT * 	 FROM ty_yyb30game.`shopexchange` 		WHERE ty_yyb30game.`shopexchange`.`id` 			= "300300000046000007");
INSERT INTO tower (SELECT * 		 FROM ty_yyb30game.`tower` 			WHERE ty_yyb30game.`tower`.`id` 			= "300300000046000007");

-- 全部查询
SELECT id,NAME,account,LEVEL,human.`TimeLogin`,human.`TimeLogout`,human.`GMPrivilege`,human.`GuideClose`,human.`ServerId`
 FROM human ; -- 300280000091000377  ow0h006jmMEW9w21wlTIUv4Ox87MD74620B09C2CD765
 
-- 名字查询
SELECT id,NAME,account,LEVEL,human.`TimeLogin`,human.`TimeLogout`,human.`GMPrivilege`,human.`GuideClose`,human.`ServerId`
 FROM human WHERE NAME LIKE "%冷如冰%"; -- 300280000091000377  ow0h006jmMEW9w21wlTIUv4Ox87MD74620B09C2CD765
 
-- 账号查询
SELECT id,NAME,account,LEVEL,human.`TimeLogin`,human.`TimeLogout`,human.`GMPrivilege`,human.`GuideClose`,human.`ServerId`
 FROM human WHERE human.`Account` LIKE "%冷如冰%"; -- 300280000091000377  ow0h006jmMEW9w21wlTIUv4Ox87MD74620B09C2CD765
 
 -- 账号查询
SELECT id,NAME,account,LEVEL,human.`TimeLogin`,human.`TimeLogout`,human.`GMPrivilege`,human.`GuideClose`,human.`ServerId`
 FROM human WHERE human.`id` = ''; -- 300280000091000377  ow0h006jmMEW9w21wlTIUv4Ox87MD74620B09C2CD765
 
 
-- 查找 对比两个库，查找多余的信息
SELECT  *  FROM  human  WHERE  NOT EXISTS (SELECT 1 FROM human_ext WHERE  human.`id` = human_ext.`id`)  LIMIT 10000 ;
SELECT  *  FROM  human_ext  WHERE  NOT EXISTS (SELECT 1 FROM human WHERE  human_ext.`id` = human.`id`)  LIMIT 10000 ;

// 两个表关联查询;
SELECT human.`id`,human.`Level`,general.* FROM general,human WHERE human.`id` = general.`HumanId` AND human.`Level`<7 AND human.`Level`>5;


