
SET @log1 = '2018-05-01';  -- 登录时间区间1
SET @log2 = '2018-05-11';  -- 登录时间区间2
SET @cre1 = '2018-04-24';  -- 创角时间区间1
SET @cre2 = '2018-05-05';  -- 创角时间区间2

CALL subGenLineup(@log1,@log2,@cre1,@cre2);

