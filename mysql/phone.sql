--mysql 导入数据库 

--创建表 最新手机号段归属地数据库

--字段：前三位 号段 省份 城市 运营商类型  邮编 区号 行政区划编码

CREATE TABLE `phone``.`phone` (
`pref`  VARCHAR(45) NULL,
`phone` VARCHAR(45) NULL,
`province` VARCHAR(45) NULL,
`city` VARCHAR(45) NULL,
`isp` VARCHAR(45) NULL,
`post_code` VARCHAR(45) NULL,
`city_code` VARCHAR(45) NULL,
`area_code` VARCHAR(45) NULL
);


#导入txt到mysql
load data local infile 'c:/phone.txt'
into table phone
fields terminated by '\t'
lines terminated by '\r\n'
(pref, phone, province,city,isp,post_code,city_code,area_code);


#导入csv到mysql
load data local infile 'c:/phone.csv'
into table  phone
fields terminated by ',' 
optionally enclosed by '"'
escaped by '"' 
lines terminated by '\r\n'
(pref, phone, province,city,isp,post_code,city_code,area_code);


--默认 txt为中文编码  导入时 请转为utf-8编码 以免乱码 

--mysql乱码如何解决？


--解决：

--确保两者编码统一 才不会乱码

--（1）先将txt文件转换为UTF-8格式 

--（2）导入命令中加入character set utf8

--如：

…… into table test character set utf8 fields……


The used command is not allowed with this MySQL version
[mysqld]        #服务端配置  
local-infle = 1  
  
[mysql]         #客户端配置  
local-infile = 1  


