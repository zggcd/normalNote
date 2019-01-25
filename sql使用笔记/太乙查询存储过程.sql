DELIMITER $$


DROP PROCEDURE IF EXISTS `subGenLineup`$$

CREATE  PROCEDURE `subGenLineup`(IN timeLogin1 VARCHAR(50),IN timeLogin2 VARCHAR(50),IN timeCreate1 VARCHAR(50),IN timeCreate2 VARCHAR(50))
BEGIN	
	DECLARE i INT;
	DECLARE n INT;
	DECLARE a1 DOUBLE;
	DECLARE a2 DOUBLE;
	DECLARE a3 DOUBLE;
	
	DECLARE loop1 INT;
	DECLARE time1 INT;
	
	DECLARE  timeLog1 BIGINT;
	DECLARE  timeLog2 BIGINT;
	DECLARE  timeCre1 BIGINT;
	DECLARE  timeCre2 BIGINT;
	SET  timeLog1 = UNIX_TIMESTAMP(timeLogin1)*1000;
	SET  timeLog2 = UNIX_TIMESTAMP(timeLogin2)*1000;
	SET  timeCre1 = UNIX_TIMESTAMP(timeCreate1)*1000;
	SET  timeCre2 = UNIX_TIMESTAMP(timeCreate2)*1000;
	
	-- human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 -- 活跃用户
	
	-- 删除临时表
	DROP TABLE IF EXISTS aa1;
	DROP TABLE IF EXISTS a1;
	DROP TABLE IF EXISTS a2;
	DROP TABLE IF EXISTS a3;
	DROP TABLE IF EXISTS a4;
	DROP TABLE IF EXISTS a5;
	DROP TABLE IF EXISTS a6;
	DROP TABLE IF EXISTS a7;   
	DROP TABLE IF EXISTS huamnInfo;
	DROP TABLE IF EXISTS aaa;	
	DROP TABLE IF EXISTS allhuman1;
	DROP TABLE IF EXISTS allhuman2;
	DROP TABLE IF EXISTS allhuman3;
	-- 删除数据表
	DROP TABLE IF EXISTS aaaaaa; 
	
	-- 创建结果表
	CREATE TABLE aaaaaa ( 
		id INT NOT NULL AUTO_INCREMENT,
		NAME VARCHAR(100) DEFAULT "",
		vip04 DOUBLE DEFAULT 0,
		vip57 DOUBLE DEFAULT 0,
		vip8 DOUBLE DEFAULT 0,	
		PRIMARY KEY (id)
	)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
	
	INSERT INTO aaaaaa (NAME) VALUES ('用户平均等级');
	INSERT INTO aaaaaa (NAME) VALUES ('用户平均元宝剩余');
	INSERT INTO aaaaaa (NAME) VALUES ('装备平均强化等级');
	INSERT INTO aaaaaa (NAME) VALUES ('装备平均精炼等级');
	INSERT INTO aaaaaa (NAME) VALUES ('主角的平均进阶等级');
	INSERT INTO aaaaaa (NAME) VALUES ('上阵英雄的平均进阶等级(非主角)（资质10）');
	INSERT INTO aaaaaa (NAME) VALUES ('上阵英雄的平均进阶等级(非主角)（资质12）');
	INSERT INTO aaaaaa (NAME) VALUES ('上阵英雄的平均进阶等级(非主角)（资质13）');
	INSERT INTO aaaaaa (NAME) VALUES ('上阵英雄的平均进阶等级(非主角)（资质16）');
	INSERT INTO aaaaaa (NAME) VALUES ('符文（符）平均强化等级');
	INSERT INTO aaaaaa (NAME) VALUES ('符文（符）平均精炼等级');
	INSERT INTO aaaaaa (NAME) VALUES ('符文（经卷）平均强化等级');
	INSERT INTO aaaaaa (NAME) VALUES ('符文（经卷）平均精炼等级');
	INSERT INTO aaaaaa (NAME) VALUES ('玄兵的平均进阶等级（15品质）');
	INSERT INTO aaaaaa (NAME) VALUES ('玄兵的平均进阶等级（18品质）');
	
	
	-- 用户平均等级
	SET a1 = (SELECT AVG(LEVEL) FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
	SET a2 = (SELECT AVG(LEVEL) FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
	SET a3 = (SELECT AVG(LEVEL) FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=8);
	
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '用户平均等级';
	UPDATE aaaaaa SET vip57 = a2 WHERE NAME = '用户平均等级';
	UPDATE aaaaaa SET vip8 = a3 WHERE NAME = '用户平均等级';
	
	-- 用户的平均元宝剩余
	
	SET a1 = (SELECT AVG(gold) FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
	SET a2 = (SELECT AVG(gold) FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
	SET a3 = (SELECT AVG(gold) FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=8);
	
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '用户平均元宝剩余';
	UPDATE aaaaaa SET vip57 = a2 WHERE NAME = '用户平均元宝剩余';
	UPDATE aaaaaa SET vip8 = a3 WHERE NAME = '用户平均元宝剩余';
	
	-- **********获得 三个vip等级的活跃武将id--- 开始******
	SET loop1 = 1;
	SET time1 = 3;	
	WHILE loop1 <= time1 DO
	
	-- 活跃用户信息 vip0-vip4
	IF loop1 = 1 THEN
		CREATE TEMPORARY TABLE huamnInfo  (SELECT * FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
	ELSEIF loop1 = 2 THEN
        	CREATE TEMPORARY TABLE huamnInfo  (SELECT * FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
	ELSEIF loop1 =3 THEN
        	CREATE TEMPORARY TABLE huamnInfo  (SELECT * FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=8);
	END IF;	
	
	-- 截取上阵阵容
	SET @str = CONCAT("CREATE TEMPORARY TABLE aa1 (SELECT  SUBSTRING( huamnInfo.GenLineup,
	LENGTH(SUBSTRING_INDEX(huamnInfo.GenLineup, '{', 1))+2,
	LENGTH(SUBSTRING_INDEX(huamnInfo.GenLineup, '}', 1)) -LENGTH(SUBSTRING_INDEX(huamnInfo.GenLineup, '{', 1))-1)  AS ids FROM huamnInfo)");
	PREPARE stmt FROM @str;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt; /*删除定义*/   
	-- 截取英雄id
	SET i = 1;
	SET n = 7;
	SET @a = CONCAT('a',1);   	
	WHILE i <= n DO	
	SET @str = CONCAT("CREATE TEMPORARY TABLE ", @a ," (SELECT  SUBSTRING( aa1.ids,
	LENGTH(SUBSTRING_INDEX(aa1.ids, ':', ",i,"))+2,
	LENGTH(SUBSTRING_INDEX(aa1.ids, ',', ",i,")) -LENGTH(SUBSTRING_INDEX(aa1.ids, ':', ",i,"))-1
	)  AS ids FROM aa1 WHERE LENGTH(SUBSTRING( aa1.ids,
	LENGTH(SUBSTRING_INDEX(aa1.ids, ':', ",i,"))+2,
	LENGTH(SUBSTRING_INDEX(aa1.ids, ',', ",i,")) -LENGTH(SUBSTRING_INDEX(aa1.ids, ':', ",i,"))-1
	))>6)");
	
	PREPARE stmt FROM @str;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt; /*删除定义*/   
	
        SET i = i + 1;
        SET @a = CONCAT('a',i); 
	END WHILE;
	
	ALTER TABLE a1 MODIFY ids BIGINT;
	ALTER TABLE a2 MODIFY ids BIGINT;
	ALTER TABLE a3 MODIFY ids BIGINT;
	ALTER TABLE a4 MODIFY ids BIGINT;
	ALTER TABLE a5 MODIFY ids BIGINT;
	ALTER TABLE a6 MODIFY ids BIGINT;
	ALTER TABLE a7 MODIFY ids BIGINT;
	-- 得到所有上阵武将（包括主角）的id
	CREATE TEMPORARY TABLE aaa SELECT * FROM a1;
	INSERT INTO aaa SELECT * FROM a2;
	INSERT INTO aaa SELECT * FROM a3;
	INSERT INTO aaa SELECT * FROM a4;
	INSERT INTO aaa SELECT * FROM a5;
	INSERT INTO aaa SELECT * FROM a6;
	INSERT INTO aaa SELECT * FROM a7;
	
	IF loop1 = 1 THEN
		CREATE TEMPORARY TABLE allhuman1 SELECT * FROM aaa;
	ELSEIF loop1 = 2 THEN
		CREATE TEMPORARY TABLE allhuman2 SELECT * FROM aaa;
	ELSEIF loop1 =3 THEN
		CREATE TEMPORARY TABLE allhuman3 SELECT * FROM aaa;
	END IF;		
	SET loop1 = loop1 + 1;
	
	-- 删除临时表
	DROP TABLE IF EXISTS aa1;
	DROP TABLE IF EXISTS a1;
	DROP TABLE IF EXISTS a2;
	DROP TABLE IF EXISTS a3;
	DROP TABLE IF EXISTS a4;
	DROP TABLE IF EXISTS a5;
	DROP TABLE IF EXISTS a6;
	DROP TABLE IF EXISTS a7;   
	DROP TABLE IF EXISTS huamnInfo;
	DROP TABLE IF EXISTS aaa;
	END WHILE; 
	-- **********获得 三个vip等级的活跃武将id--- 结束******
	
	
	-- 装备平均强化等级
	SET a1 = (SELECT AVG(item_bag.`IntensifyLv`) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (item_bag.`Type` = '16777472' OR item_bag.`Type` = '16777728' OR item_bag.`Type` = '16777984' OR item_bag.`Type` = '16778240') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '装备平均强化等级';
	SET a1 = (SELECT AVG(item_bag.`IntensifyLv`) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (item_bag.`Type` = '16777472' OR item_bag.`Type` = '16777728' OR item_bag.`Type` = '16777984' OR item_bag.`Type` = '16778240') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '装备平均强化等级';
	SET a1 = (SELECT AVG(item_bag.`IntensifyLv`) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (item_bag.`Type` = '16777472' OR item_bag.`Type` = '16777728' OR item_bag.`Type` = '16777984' OR item_bag.`Type` = '16778240') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '装备平均强化等级';	
	
	-- 装备平均精炼等级
	SET a1 = (SELECT AVG(item_bag.`RefineLv`) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (item_bag.`Type` = '16777472' OR item_bag.`Type` = '16777728' OR item_bag.`Type` = '16777984' OR item_bag.`Type` = '16778240') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '装备平均精炼等级';
	SET a1 = (SELECT AVG(item_bag.`RefineLv`) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (item_bag.`Type` = '16777472' OR item_bag.`Type` = '16777728' OR item_bag.`Type` = '16777984' OR item_bag.`Type` = '16778240') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '装备平均精炼等级';
	SET a1 = (SELECT AVG(item_bag.`RefineLv`) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (item_bag.`Type` = '16777472' OR item_bag.`Type` = '16777728' OR item_bag.`Type` = '16777984' OR item_bag.`Type` = '16778240') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '装备平均精炼等级';
	
	-- 主角的平均进阶等级:
	SET a1 = (SELECT AVG(AdvancedLv) FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=0 AND human.`VipLevel` <=4);
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '主角的平均进阶等级';
	SET a1 = (SELECT AVG(AdvancedLv) FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=5 AND human.`VipLevel` <=7);
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '主角的平均进阶等级';
	SET a1 = (SELECT AVG(AdvancedLv) FROM human WHERE human.`TimeLogin` > timeLog1 AND human.`TimeLogin` < timeLog2 AND human.`TimeCreate`> timeCre1 AND human.`TimeCreate`< timeCre2 AND human.`VipLevel`>=8);
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '主角的平均进阶等级';
	
	-- 上阵英雄的平均进阶等级(非主角)（资质10）
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 10 AND general.`id` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质10）';
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 10 AND general.`id` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质10）';
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 10 AND general.`id` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质10）';
	
	-- 上阵英雄的平均进阶等级(非主角)（资质12）
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 12 AND general.`id` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质12）';
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 12 AND general.`id` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质12）';
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 12 AND general.`id` IN (SELECT *FROM allhuman3));
	
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质12）';
	-- 上阵英雄的平均进阶等级(非主角)（资质13）
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 13 AND general.`id` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质13）';
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 13 AND general.`id` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质13）';
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 13 AND general.`id` IN (SELECT *FROM allhuman3));
	
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质13）';
	-- 上阵英雄的平均进阶等级(非主角)（资质16）
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 16 AND general.`id` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质16）';
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 16 AND general.`id` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质16）';
	SET a1 = (SELECT AVG(AdvancedLv) FROM general WHERE general.`Aptitude` = 16 AND general.`id` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '上阵英雄的平均进阶等级(非主角)（资质16）';
	
	-- 符文（符）平均强化等级
	SET a1 = (SELECT AVG(IntensifyLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '符文（符）平均强化等级';
	SET a1 = (SELECT AVG(IntensifyLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '符文（符）平均强化等级';
	SET a1 = (SELECT AVG(IntensifyLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '符文（符）平均强化等级';
	-- 符文（符）平均精炼等级
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '符文（符）平均精炼等级';
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '符文（符）平均精炼等级';
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663552' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '符文（符）平均精炼等级';
	
	
	-- 符文（经卷）平均强化等级
	SET a1 = (SELECT AVG(IntensifyLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '符文（经卷）平均强化等级';
	SET a1 = (SELECT AVG(IntensifyLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '符文（经卷）平均强化等级';
	SET a1 = (SELECT AVG(IntensifyLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '符文（经卷）平均强化等级';
	
	-- 符文（经卷）平均精炼等级
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '符文（经卷）平均精炼等级';
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '符文（经卷）平均精炼等级';
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '100663808' ) AND item_bag.`OwnerId` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '符文（经卷）平均精炼等级';	
	
	-- 玄兵的平均进阶等级（15品质）
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005014' OR sn = '4005015' OR sn = '4005016' OR sn = '4005017' OR sn = '4005019' OR sn = '4005020' OR sn = '4005021' OR sn = '4005022' OR sn = '4005023' OR sn = '4005029' OR sn = '4005030' OR sn = '4005031' OR sn = '4005032' OR sn = '4005033' OR sn = '4005034' OR sn = '4005040' OR sn = '4005041' OR sn = '4005042' OR sn = '4005043' OR sn = '4005044' OR sn = '4005045' OR sn = '4005046' OR sn = '4005047') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '玄兵的平均进阶等级（15品质）';
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005014' OR sn = '4005015' OR sn = '4005016' OR sn = '4005017' OR sn = '4005019' OR sn = '4005020' OR sn = '4005021' OR sn = '4005022' OR sn = '4005023' OR sn = '4005029' OR sn = '4005030' OR sn = '4005031' OR sn = '4005032' OR sn = '4005033' OR sn = '4005034' OR sn = '4005040' OR sn = '4005041' OR sn = '4005042' OR sn = '4005043' OR sn = '4005044' OR sn = '4005045' OR sn = '4005046' OR sn = '4005047') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '玄兵的平均进阶等级（15品质）';
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005014' OR sn = '4005015' OR sn = '4005016' OR sn = '4005017' OR sn = '4005019' OR sn = '4005020' OR sn = '4005021' OR sn = '4005022' OR sn = '4005023' OR sn = '4005029' OR sn = '4005030' OR sn = '4005031' OR sn = '4005032' OR sn = '4005033' OR sn = '4005034' OR sn = '4005040' OR sn = '4005041' OR sn = '4005042' OR sn = '4005043' OR sn = '4005044' OR sn = '4005045' OR sn = '4005046' OR sn = '4005047') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '玄兵的平均进阶等级（15品质）';
	
	
	-- 玄兵的平均进阶等级（18品质）
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005011' OR sn = '4005012' OR sn = '4005013' OR sn = '4005018' OR sn = '4005020' OR sn = '4005024' OR sn = '4005025' OR sn = '4005026' OR sn = '4005027' OR sn = '4005028' OR sn = '4005035' OR sn = '4005036' OR sn = '4005037' OR sn = '4005038' OR sn = '4005039' OR sn = '4005048' OR sn = '4005049' OR sn = '4005050' OR sn = '4005051' OR sn = '4005052' OR sn = '4005053' OR sn = '4005054' OR sn = '4005055') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman1));
	UPDATE aaaaaa SET vip04 = a1 WHERE NAME = '玄兵的平均进阶等级（18品质）';
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005011' OR sn = '4005012' OR sn = '4005013' OR sn = '4005018' OR sn = '4005020' OR sn = '4005024' OR sn = '4005025' OR sn = '4005026' OR sn = '4005027' OR sn = '4005028' OR sn = '4005035' OR sn = '4005036' OR sn = '4005037' OR sn = '4005038' OR sn = '4005039' OR sn = '4005048' OR sn = '4005049' OR sn = '4005050' OR sn = '4005051' OR sn = '4005052' OR sn = '4005053' OR sn = '4005054' OR sn = '4005055') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman2));
	UPDATE aaaaaa SET vip57 = a1 WHERE NAME = '玄兵的平均进阶等级（18品质）';
	SET a1 = (SELECT AVG(RefineLv) FROM item_bag WHERE item_bag.`CrossId` > 1 AND (TYPE = '134217984' ) AND (sn = '4005011' OR sn = '4005012' OR sn = '4005013' OR sn = '4005018' OR sn = '4005020' OR sn = '4005024' OR sn = '4005025' OR sn = '4005026' OR sn = '4005027' OR sn = '4005028' OR sn = '4005035' OR sn = '4005036' OR sn = '4005037' OR sn = '4005038' OR sn = '4005039' OR sn = '4005048' OR sn = '4005049' OR sn = '4005050' OR sn = '4005051' OR sn = '4005052' OR sn = '4005053' OR sn = '4005054' OR sn = '4005055') AND item_bag.`OwnerId` IN (SELECT *FROM allhuman3));
	UPDATE aaaaaa SET vip8 = a1 WHERE NAME = '玄兵的平均进阶等级（18品质）';
	
	DROP TABLE IF EXISTS allhuman1;
	DROP TABLE IF EXISTS allhuman2;
	DROP TABLE IF EXISTS allhuman3;
	
    END$$

DELIMITER ;