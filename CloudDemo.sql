DROP DATABASE IF EXISTS CouldShop;
create database CouldShop default character set utf8 collate utf8_general_ci;
use CouldShop;
-- ----------------------------
-- Table structure for t_branch
-- ----------------------------
DROP TABLE IF EXISTS `t_branch`;
CREATE TABLE `t_branch` (
  `BId` int(11) NOT NULL AUTO_INCREMENT,
  `BName` varchar(255) NOT NULL,
  `BRemark` varchar(255) NOT NULL,
  `BZT` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`BId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_branch
-- ----------------------------
INSERT INTO `t_branch` VALUES ('1', '技术部', '为公司提供技术支持', '1');

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `PId` int(11) NOT NULL AUTO_INCREMENT,
  `PName` varchar(255) NOT NULL,
  `PBId` int(11) NOT NULL,
  `PRemark` varchar(255) DEFAULT NULL,
  `PZT` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PId`),
  KEY `FK_key` (`PBId`),
  CONSTRAINT `FK_key` FOREIGN KEY (`PBId`) REFERENCES `t_branch` (`BId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position
-- ----------------------------
INSERT INTO `t_position` VALUES ('1', '技术经理', '1', '技术人才', '1');

-- ----------------------------
-- Table structure for t_staffion
-- ----------------------------
DROP TABLE IF EXISTS `t_staffion`;
CREATE TABLE `t_staffion` (
  `SId` int(11) NOT NULL AUTO_INCREMENT,
  `SName` varchar(255) NOT NULL,
  `SIP` varchar(255) NOT NULL,
  `SPassword` varchar(255) NOT NULL,
  `SSex` varchar(255) DEFAULT NULL,
  `SBirthdate` datetime NOT NULL,
  `SPosId` int(11) NOT NULL,
  `SBasepay` float NOT NULL,
  `SSocial` float NOT NULL,
  `SEntrytime` datetime NOT NULL,
  `SDeparturetiome` datetime DEFAULT NULL,
  `SZZ` int(11) NOT NULL DEFAULT '1',
  `SZT` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SId`),
  KEY `P_Fk_key` (`SPosId`),
  CONSTRAINT `P_Fk_key` FOREIGN KEY (`SPosId`) REFERENCES `t_position` (`PId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_staffion
-- ----------------------------
-- 招聘信息表
create table `Recruitment`
(
	`reId` int(20) NOT NULL AUTO_INCREMENT primary key,-- 编号
  `post_id` int(20) NOT NULL,-- 职位id
  `education` varchar(20) NOT NULL,-- 学历
  `start_time` datetime NOT NULL,-- 发布时间
  `end_time` datetime NOT NULL,-- 截止时间
  `salary_min` int(20) DEFAULT NULL,-- 最低薪资
  `salary_max` int(20) DEFAULT NULL,-- 最高薪资
  `sum` int(20) DEFAULT NULL,-- 招聘人数
	KEY `P_Fk_key1` (`post_id`),
	CONSTRAINT `P_Fk_key1` FOREIGN KEY (`post_id`) REFERENCES `t_position` (`PId`)
);

-- 应聘信息表
create table `Application`
(
	`A_id` int(20) NOT NULL AUTO_INCREMENT primary key,-- 应聘id
  `A_name` varchar(255) DEFAULT NULL,-- 姓名
  `A_sex` varchar(255) DEFAULT NULL,-- 性别
  `A_birthday` varchar(255) DEFAULT NULL,-- 出生日期
  `A_phone` varchar(255) DEFAULT NULL,-- 手机
  `A_Time` varchar(255) DEFAULT NULL,-- 应聘时间
  `A_postss` int(11) DEFAULT NULL,-- 职位id
  `A_present` varchar(255) DEFAULT NULL,-- 贯籍
  `A_natio` varchar(255) DEFAULT NULL,-- 民族
  `A_place` varchar(255) DEFAULT NULL,-- 现居住地址
  `A_blood` varchar(255) DEFAULT NULL,-- 血型
  `A_idcate` varchar(255) DEFAULT NULL,-- 身份证编号
  `A_marital` varchar(255) DEFAULT NULL,-- 婚姻状况
  `A_politics` varchar(255) DEFAULT NULL,-- 政治面貌
  `A_maxeducation` varchar(255) DEFAULT NULL,-- 学历
  `A_maxdegree` varchar(255) DEFAULT NULL,-- 学位
  `A_Email` varchar(255) DEFAULT NULL,-- 邮箱
  `A_emIP` varchar(255) DEFAULT NULL,-- 电话
  `A_Englist` varchar(255) DEFAULT NULL,-- 外语等级
  `A_computer` varchar(255) DEFAULT NULL,-- 计算机等级
	`A_Learning_experience` varchar(255) DEFAULT NULL,-- 学习经历
	`A_Job_resume` varchar(255) DEFAULT NULL,-- 工作简历
	`A_state` int DEFAULT '0',-- 应聘状态（0审核、1录用、2未通过审核）
	KEY `P_Fk_key2` (`A_postss`),
	CONSTRAINT `P_Fk_key2` FOREIGN KEY (`A_postss`) REFERENCES `t_position` (`PId`)
);


-- 客户信息表
create table `Customer`
(
	`C_Id` int(20) NOT NULL AUTO_INCREMENT primary key,-- 编号
  `C_name` varchar(20) NOT NULL,-- 客户名字
	`C_sex` varchar(20) DEFAULT '男',-- 客户性别
	`C_age` int ,-- 客户年龄
	`C_place` varchar(20) NOT NULL,-- 客户地址
	`C_phone` varchar(255) DEFAULT NULL,-- 手机	
	`C_Models` varchar(255) DEFAULT NULL,-- 车型
	`C_Email` varchar(255) DEFAULT NULL,-- 邮箱
  `C_emIP` varchar(255) DEFAULT NULL,-- 电话
	`C_Balance` int DEFAULT '0'-- 余额
);


-- 客户预约信息表
create table `appointment`
(
	`a_Id` int(20) NOT NULL AUTO_INCREMENT primary key,-- 编号
	`C_Id` int(20) NOT NULL,-- 客户id
	`a_time` datetime NOT NULL,-- 发起预约时间
	`a_Estimated_time` datetime NOT NULL,-- 预计服务时间
	`a_type` varchar(255) DEFAULT NULL,-- 预约类型
	`a_remark` varchar(100) DEFAULT NULL, -- 备注
	KEY `P_Fk_key13` (`C_Id`),
	CONSTRAINT `P_Fk_key13` FOREIGN KEY (`C_Id`) REFERENCES `Customer` (`C_Id`)
);

-- ----------------------------
-- Table structure for ims_autoparts_car_brand
-- ----------------------------
DROP TABLE IF EXISTS `ims_autoparts_car_brand`;
CREATE TABLE `ims_autoparts_car_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `initials` varchar(5) DEFAULT NULL COMMENT '首字母',
  `name` varchar(255) DEFAULT NULL,
  `pic_url` longtext,
  `status` tinyint(1) DEFAULT '1',
  `sort` int(11) DEFAULT '1',
  `is_hot` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7025 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ims_autoparts_car_brand
-- ----------------------------
INSERT INTO `ims_autoparts_car_brand` VALUES ('6723', '4', '0', 'A', '奥迪', '/home/web/home/images/brand/100x100_f40_autohomecar__wKgHEVs9u5WAV441AAAKdxZGE4U148.png', '1', '1', '0', '1527063241');
INSERT INTO `ims_autoparts_car_brand` VALUES ('6724', '4', '0', 'A', 'AC Schnitzer', '/home/web/home/images/brand/100x100_f40_autohomecar__ChcCQFs9vBKAO3YSAAAW0WOWvRc555.png', '1', '1', '0', '1527063241');
INSERT INTO `ims_autoparts_car_brand` VALUES ('6725', '4', '0', 'A', '阿斯顿·马丁', '/home/web/home/images/brand/100x100_f40_autohomecar__wKgHEVs9u6GAPWN8AAAYsmBsCWs847.png', '1', '1', '0', '1527063241');
INSERT INTO `ims_autoparts_car_brand` VALUES ('6726', '4', '0', 'A', '安凯客车', '/home/web/home/images/brand/100x100_f40_autohomecar__ChcCSFs8riCAYVA2AAApQLgf8a0969.png', '1', '1', '0', '1527063241');

-- ----------------------------
-- Table structure for ims_autoparts_car_info
-- ----------------------------
DROP TABLE IF EXISTS `ims_autoparts_car_info`;
CREATE TABLE `ims_autoparts_car_info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Manufacturer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Energy type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Time to market` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `maximum power` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Maximum torque` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Engine` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Transmission case` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Length * width * height` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Body structure` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Maximum speed` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Official 0-100km/h acceleration (s)` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `0-100km/h acceleration (s)` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Measured 100-0 km/h braking (m)` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `Integrated Fuel Consumption of Ministry of Industry and Informat` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `Measured fuel consumption (L/100km)` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `Quality assurance` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Main/Co-pilot seat airbag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Anterior/posterior lateral balloon` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Front/rear head balloon (air curtain)` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `knee airbag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Rear seat belt airbag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Rear row central airbag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Passive Pedestrian Protection` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Tire Pressure Monitoring Function` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Zero tire pressure to continue driving` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Unfastened seat belt reminder` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ISOFIX child seat interface` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ABS anti lock braking` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Braking Force Distribution (EBD/CBC, etc.)` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Brake assistance (EBA/BAS/BA, etc.)` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Traction Control (ASR/TCS/TRC, etc.)` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Body Stability Control (ESC/ESP/DSC, etc.)` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Doubling assistance` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ldws` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Lane Maintenance Assistance System` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Road Traffic Sign Recognition` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Active Brake/Active Safety System` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Night vision system` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Tips for Fatigue Driving` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `number` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ims_autoparts_car_info
-- ----------------------------
INSERT INTO `ims_autoparts_car_info` VALUES ('1', 'smart forfour 2018款 1.0L 52千瓦灵动版', '12.28万', 'smart', '微型车', '汽油', '2018.06', '52', '91', '1.0L 71马力 L3', '6挡双离合', '3495*1665*1554', '5门4座两厢车', '151', '16.9', '-', '-', '4.7', '-', '三年不限公里', '主●&nbsp;/&nbsp;副●', '前●&nbsp;/&nbsp;后-', '-', '-', '-', '-', '-', null, '-', null, '●', '●', '●', '●', '●', '●', '-', '-', '-', '-', '-', '-', '-', null);
INSERT INTO `ims_autoparts_car_info` VALUES ('2', 'smart forfour 2018款 1.0L 52千瓦激情版', '13.28万', 'smart', '微型车', '汽油', '2018.06', '52', '91', '1.0L 71马力 L3', '6挡双离合', '3495*1665*1554', '5门4座两厢车', '151', '16.9', '-', '-', '4.7', '-', '三年不限公里', '主●&nbsp;/&nbsp;副●', '前●&nbsp;/&nbsp;后-', '-', '-', '-', '-', '-', null, '-', null, '●', '●', '●', '●', '●', '●', '-', '-', '-', '-', '-', '-', '-', null);
INSERT INTO `ims_autoparts_car_info` VALUES ('3', 'smart forfour 2018款 0.9T 66千瓦风尚型', '14.58万', 'smart', '微型车', '汽油', '2018.05', '66', '135', '0.9T 90马力 L3', '6挡双离合', '3495*1665*1554', '5门4座两厢车', '165', '11.9', '-', '-', '4.8', '-', '三年不限公里', '主●&nbsp;/&nbsp;副●', '前●&nbsp;/&nbsp;后-', '-', '-', '-', '-', '-', null, '-', null, '●', '●', '●', '●', '●', '●', '-', '-', '-', '-', '-', '-', '-', null);
INSERT INTO `ims_autoparts_car_info` VALUES ('4', 'smart forfour 2018款 0.9T 66千瓦先锋版', '15.08万', 'smart', '微型车', '汽油', '2018.06', '66', '135', '0.9T 90马力 L3', '6挡双离合', '3495*1665*1554', '5门4座两厢车', '165', '11.9', '-', '-', '4.8', '-', '三年不限公里', '主●&nbsp;/&nbsp;副●', '前●&nbsp;/&nbsp;后-', '-', '-', '-', '-', '-', null, '-', null, '●', '●', '●', '●', '●', '●', '-', '○', '-', '-', '-', '-', '-', null);

-- ----------------------------
-- Table structure for ims_autoparts_car_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_autoparts_car_type`;
CREATE TABLE `ims_autoparts_car_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pic_url` longtext,
  `status` tinyint(1) DEFAULT '1',
  `sort` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76660 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ims_autoparts_car_type
-- ----------------------------
INSERT INTO `ims_autoparts_car_type` VALUES ('73290', '4', '6723', '奥迪A3', '/home/web/home/images/cartype/160_autohomecar__ChcCP1v9FwmAOKj-AA2TDHRWKf8147.jpg', '1', '1', '1527063241');
INSERT INTO `ims_autoparts_car_type` VALUES ('73291', '4', '6723', '奥迪A4L', '/home/web/home/images/cartype/160_autohomecar__ChsEfVvtVHiAOzUCABHw-uf3Rdg846.jpg', '1', '1', '1527063241');
INSERT INTO `ims_autoparts_car_type` VALUES ('73292', '4', '6723', '奥迪A6L', '/home/web/home/images/cartype/160_autohomecar__ChsEn1vtpgGAGKgoAANCJp9b8Xg537.jpg', '1', '1', '1527063241');
INSERT INTO `ims_autoparts_car_type` VALUES ('73293', '4', '6723', '奥迪A6L新能源', '/home/web/home/images/cartype/160_autohomecar__wKgH21mgFOGATtH6AAIODrVZ7Cc958.jpg', '1', '1', '1527063241');
INSERT INTO `ims_autoparts_car_type` VALUES ('73294', '4', '6723', '奥迪Q2L', '/home/web/home/images/cartype/160_autohomecar__ChcCRVuiCp2ACQjhAAll7I76Ejs694.jpg', '1', '1', '1527063241');

-- 车辆采购支出记录表
create table CarPayRecord
(
	id int primary key auto_increment, -- 编号(主键，自增长)
	carId int not null, -- 车辆id(外键)
	purNum int not null, -- 采购数量
	cost double not null, -- 总费用
	staId int not null, -- 采购人员(外键)
	pruTime datetime not null, -- 采购时间
	KEY `P_Fk_key6` (`carId`),
  CONSTRAINT `P_Fk_key6` FOREIGN KEY (`carId`) REFERENCES `ims_autoparts_car_info` (`id`)
);

-- 车辆销售收入记录表
create table CarSale
(
	id int primary key auto_increment, -- 编号(主键，自增长)
	staId int not null, -- 销售人员(外键)
	cusId int not null, -- 客户id（外键）
	carId int not null, -- 车辆id(外键)
	dealTime datetime not null, -- 成交时间
	advance double not null, -- 预收
	netReceipts double not null, -- 实收
	receivable double not null, -- 应收
	KEY `P_Fk_key11` (`staId`),
  CONSTRAINT `P_Fk_key11` FOREIGN KEY (`staId`) REFERENCES `t_staffion` (`SId`),
	KEY `P_Fk_key12` (`cusId`),
  CONSTRAINT `P_Fk_key12` FOREIGN KEY (`cusId`) REFERENCES `Customer` (`C_Id`),
	KEY `P_Fk_key10` (`carId`),
  CONSTRAINT `P_Fk_key10` FOREIGN KEY (`carId`) REFERENCES `ims_autoparts_car_info` (`id`)
);


-- 薪资发放记录表--
create table Salary(
	sId int not null auto_increment primary key,
	staId int not null , -- 员工Id（外键）--
	merits double ,			 -- 绩效-- 
	subsidy double DEFAULT 300,	-- 补贴 --
	askingLeave DOUBLE,				-- 请假扣款--
	askingLate	DOUBLE,	-- 迟到扣款
	askingUnpunched DOUBLE,	-- 未打卡扣款--
	askingRetirement DOUBLE,	-- 早退扣款 --
	askingAbsenteeism DOUBLE, -- 旷工扣款--
	askingIndividual DOUBLE,	-- 个税扣款 --
	amountMoney DOUBLE, -- 应发金额--
	actualMOney	DOUBLE,	-- 实发金额--
	totalCompany DOUBLE, -- 公司总成本（五险一金）--
	methodMoney VARCHAR(30) not NULL, -- 发放方式--
	Paymenttime datetime, -- 发放时间--
	CashierId int, -- 出纳人(外键) --
	KEY `P_Fk_key14` (`staId`),
  CONSTRAINT `P_Fk_key14` FOREIGN KEY (`staId`) REFERENCES `t_staffion` (`SId`),
	KEY `P_Fk_key15` (`CashierId`),
  CONSTRAINT `P_Fk_key15` FOREIGN KEY (`CashierId`) REFERENCES `t_staffion` (`SId`)
);


-- 车辆采购申请表--
create table apply(
	aId  int not null auto_increment primary key, -- 编号--
	applicationName int not null ,	-- 申请人(外键)--
	carId int not null, -- 车辆id(外键)--
	carNum int not null, -- 采购数量--
	AmountMoney double not null, -- 申请金额--
	ActualMoney double , -- 实际支出--
	RepaymentMoney DOUBLE, -- 还款金额--
	Applicationtime datetime, -- 申请时间--
	remark varchar(100) ,-- 备注 --
	state VARCHAR(30) not null DEFAULT '未审核', -- 状态--
	AuditorName int,  -- 审核人(外键)--
	KEY `P_Fk_key16` (`applicationName`),
  CONSTRAINT `P_Fk_key16` FOREIGN KEY (`applicationName`) REFERENCES `t_staffion` (`SId`),
	KEY `P_Fk_key17` (`AuditorName`),
  CONSTRAINT `P_Fk_key17` FOREIGN KEY (`AuditorName`) REFERENCES `t_staffion` (`SId`),
	KEY `P_Fk_key18` (`carId`),
  CONSTRAINT `P_Fk_key18` FOREIGN KEY (`carId`) REFERENCES `ims_autoparts_car_info` (`id`)
);
-- 其他支出表 --
create table OtherMoney(
	oId int not null auto_increment primary key, -- 编号--
	otherType varchar(50) not null, -- 支出类型--
	othMoney DOUBLE not null, -- 支出金额--
	othName int, --  支出人员(外键)--
	remark varchar(100), -- 备注--
	KEY `P_Fk_key19` (`othName`),
  CONSTRAINT `P_Fk_key19` FOREIGN KEY (`othName`) REFERENCES `t_staffion` (`SId`)
); 

-- 投诉表 --
create table Complaint(
	Id int not null auto_increment primary key, -- 编号--
	Cid int ,
	type VARCHAR(50) not null,
	remark VARCHAR(200)not null,
	KEY `P_Fk_key20` (`Cid`),
  CONSTRAINT `P_Fk_key20` FOREIGN KEY (`Cid`) REFERENCES `customer` (`C_Id`)
);

-- 门店表
create table Store(
	Id int not null auto_increment primary key, -- 编号--
	name varchar(50) not null, -- 门店姓名
	address varchar(100) not null, -- 门店地址-- 
	phone varchar(20) not null, -- 联系电话 --
	remark varchar(550) -- 备注--
);

-- 新闻表--
create table News(
	Id int not null  auto_increment primary key, -- 编号--
	type varchar(50) not null, -- 类型--
	content varchar(500) not null, -- 内容--
	remark varchar(500) -- 备注--
); 
-- 公司资金表--
create table capital(
	Id int not null auto_increment primary key, -- 编号--
	Money DOUBLE,
	remark VARCHAR (200)
);

INSERT into capital(Money,remark) VALUES(30000000,'这是公司的老本');

-- ---------------------------------------------------------
-- 插入员工数据表
INSERT INTO `t_staffion` VALUES ('1', 'admin', '17685188555', '123456', '男', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('2', 'system', '17685188555', '123456', '男', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('3', '管理员工', '17685188555', '123456', '男', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('4', '管理人员', '17685188555', '123456', '男', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('5', 'admin', '17685188555', '123456', '男', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('6', 'system', '17685188555', '123456', '男', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('7', '管理员工', '17685188555', '123456', '男', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('8', '管理人员', '17685188555', '123456', '男', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');


-- 考勤表
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤主键',
  `staffId` int(11) NOT NULL  COMMENT '员工id,外键',
	`time` date NOT NULL COMMENT '考勤日期，年月日',
	`beginTime` datetime NOT NULL COMMENT '上班时间,格式时-分-秒',
	`clockIn` datetime COMMENT '上班打卡,格式时-分-秒',
	`endTime` datetime NOT NULL COMMENT '下班时间,格式时-分-秒',
  `clockOut` datetime COMMENT '下班打卡,格式时-分-秒',
	`statusId` INT NOT NULL COMMENT '0迟到，1早退2正常',
	PRIMARY KEY (`id`),
	KEY `P_Fk_key3` (`staffId`),
  CONSTRAINT `P_Fk_key3` FOREIGN KEY (`staffId`) REFERENCES `t_staffion` (`SId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 请假表
DROP TABLE IF EXISTS `leaveRoster`; -- 原本为leave，但是与mysql关键字重复所以更改
CREATE TABLE `leaveRoster` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '请假主键',
	`name` VARCHAR(100) COMMENT '请假名称',
	`staffId` int(11) NOT NULL COMMENT '员工id,外键',
  `time` datetime NOT NULL COMMENT '申请时间,年-月-日-时-分-秒',
	`beginTime` datetime NOT NULL COMMENT '请假开始时间,年-月-日-时-分-秒',
	`endTime` datetime NOT NULL COMMENT '请假结束时间,年-月-日-时-分-秒',
	`reason` VARCHAR(100)  NULL COMMENT '请假理由',
	`leaveStatus` int NULL COMMENT '1:批准，2:不批准,0:未审核', -- 原本为status因与mysql关键字冲突改为leaveStatus
	PRIMARY KEY (`id`),
	KEY `P_Fk_key4` (`staffId`),
  CONSTRAINT `P_Fk_key4` FOREIGN KEY (`staffId`) REFERENCES `t_staffion` (`SId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- 请假表测试数据
select * from   leaveRoster inner JOIN t_staffion where leaveRoster.id=t_staffion.SId

