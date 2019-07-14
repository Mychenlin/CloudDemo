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
INSERT INTO `t_branch` VALUES ('1', '������', 'Ϊ��˾�ṩ����֧��', '1');

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
INSERT INTO `t_position` VALUES ('1', '��������', '1', '�����˲�', '1');

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
-- ��Ƹ��Ϣ��
create table `Recruitment`
(
	`reId` int(20) NOT NULL AUTO_INCREMENT primary key,-- ���
  `post_id` int(20) NOT NULL,-- ְλid
  `education` varchar(20) NOT NULL,-- ѧ��
  `start_time` datetime NOT NULL,-- ����ʱ��
  `end_time` datetime NOT NULL,-- ��ֹʱ��
  `salary_min` int(20) DEFAULT NULL,-- ���н��
  `salary_max` int(20) DEFAULT NULL,-- ���н��
  `sum` int(20) DEFAULT NULL,-- ��Ƹ����
	KEY `P_Fk_key1` (`post_id`),
	CONSTRAINT `P_Fk_key1` FOREIGN KEY (`post_id`) REFERENCES `t_position` (`PId`)
);

-- ӦƸ��Ϣ��
create table `Application`
(
	`A_id` int(20) NOT NULL AUTO_INCREMENT primary key,-- ӦƸid
  `A_name` varchar(255) DEFAULT NULL,-- ����
  `A_sex` varchar(255) DEFAULT NULL,-- �Ա�
  `A_birthday` varchar(255) DEFAULT NULL,-- ��������
  `A_phone` varchar(255) DEFAULT NULL,-- �ֻ�
  `A_Time` varchar(255) DEFAULT NULL,-- ӦƸʱ��
  `A_postss` int(11) DEFAULT NULL,-- ְλid
  `A_present` varchar(255) DEFAULT NULL,-- �Ἦ
  `A_natio` varchar(255) DEFAULT NULL,-- ����
  `A_place` varchar(255) DEFAULT NULL,-- �־�ס��ַ
  `A_blood` varchar(255) DEFAULT NULL,-- Ѫ��
  `A_idcate` varchar(255) DEFAULT NULL,-- ���֤���
  `A_marital` varchar(255) DEFAULT NULL,-- ����״��
  `A_politics` varchar(255) DEFAULT NULL,-- ������ò
  `A_maxeducation` varchar(255) DEFAULT NULL,-- ѧ��
  `A_maxdegree` varchar(255) DEFAULT NULL,-- ѧλ
  `A_Email` varchar(255) DEFAULT NULL,-- ����
  `A_emIP` varchar(255) DEFAULT NULL,-- �绰
  `A_Englist` varchar(255) DEFAULT NULL,-- ����ȼ�
  `A_computer` varchar(255) DEFAULT NULL,-- ������ȼ�
	`A_Learning_experience` varchar(255) DEFAULT NULL,-- ѧϰ����
	`A_Job_resume` varchar(255) DEFAULT NULL,-- ��������
	`A_state` int DEFAULT '0',-- ӦƸ״̬��0��ˡ�1¼�á�2δͨ����ˣ�
	KEY `P_Fk_key2` (`A_postss`),
	CONSTRAINT `P_Fk_key2` FOREIGN KEY (`A_postss`) REFERENCES `t_position` (`PId`)
);


-- �ͻ���Ϣ��
create table `Customer`
(
	`C_Id` int(20) NOT NULL AUTO_INCREMENT primary key,-- ���
  `C_name` varchar(20) NOT NULL,-- �ͻ�����
	`C_sex` varchar(20) DEFAULT '��',-- �ͻ��Ա�
	`C_age` int ,-- �ͻ�����
	`C_place` varchar(20) NOT NULL,-- �ͻ���ַ
	`C_phone` varchar(255) DEFAULT NULL,-- �ֻ�	
	`C_Models` varchar(255) DEFAULT NULL,-- ����
	`C_Email` varchar(255) DEFAULT NULL,-- ����
  `C_emIP` varchar(255) DEFAULT NULL,-- �绰
	`C_Balance` int DEFAULT '0'-- ���
);


-- �ͻ�ԤԼ��Ϣ��
create table `appointment`
(
	`a_Id` int(20) NOT NULL AUTO_INCREMENT primary key,-- ���
	`C_Id` int(20) NOT NULL,-- �ͻ�id
	`a_time` datetime NOT NULL,-- ����ԤԼʱ��
	`a_Estimated_time` datetime NOT NULL,-- Ԥ�Ʒ���ʱ��
	`a_type` varchar(255) DEFAULT NULL,-- ԤԼ����
	`a_remark` varchar(100) DEFAULT NULL, -- ��ע
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
  `initials` varchar(5) DEFAULT NULL COMMENT '����ĸ',
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
INSERT INTO `ims_autoparts_car_brand` VALUES ('6723', '4', '0', 'A', '�µ�', '/home/web/home/images/brand/100x100_f40_autohomecar__wKgHEVs9u5WAV441AAAKdxZGE4U148.png', '1', '1', '0', '1527063241');
INSERT INTO `ims_autoparts_car_brand` VALUES ('6724', '4', '0', 'A', 'AC Schnitzer', '/home/web/home/images/brand/100x100_f40_autohomecar__ChcCQFs9vBKAO3YSAAAW0WOWvRc555.png', '1', '1', '0', '1527063241');
INSERT INTO `ims_autoparts_car_brand` VALUES ('6725', '4', '0', 'A', '��˹�١���', '/home/web/home/images/brand/100x100_f40_autohomecar__wKgHEVs9u6GAPWN8AAAYsmBsCWs847.png', '1', '1', '0', '1527063241');
INSERT INTO `ims_autoparts_car_brand` VALUES ('6726', '4', '0', 'A', '�����ͳ�', '/home/web/home/images/brand/100x100_f40_autohomecar__ChcCSFs8riCAYVA2AAApQLgf8a0969.png', '1', '1', '0', '1527063241');

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
INSERT INTO `ims_autoparts_car_info` VALUES ('1', 'smart forfour 2018�� 1.0L 52ǧ���鶯��', '12.28��', 'smart', '΢�ͳ�', '����', '2018.06', '52', '91', '1.0L 71���� L3', '6��˫���', '3495*1665*1554', '5��4�����ᳵ', '151', '16.9', '-', '-', '4.7', '-', '���겻�޹���', '����&nbsp;/&nbsp;����', 'ǰ��&nbsp;/&nbsp;��-', '-', '-', '-', '-', '-', null, '-', null, '��', '��', '��', '��', '��', '��', '-', '-', '-', '-', '-', '-', '-', null);
INSERT INTO `ims_autoparts_car_info` VALUES ('2', 'smart forfour 2018�� 1.0L 52ǧ�߼����', '13.28��', 'smart', '΢�ͳ�', '����', '2018.06', '52', '91', '1.0L 71���� L3', '6��˫���', '3495*1665*1554', '5��4�����ᳵ', '151', '16.9', '-', '-', '4.7', '-', '���겻�޹���', '����&nbsp;/&nbsp;����', 'ǰ��&nbsp;/&nbsp;��-', '-', '-', '-', '-', '-', null, '-', null, '��', '��', '��', '��', '��', '��', '-', '-', '-', '-', '-', '-', '-', null);
INSERT INTO `ims_autoparts_car_info` VALUES ('3', 'smart forfour 2018�� 0.9T 66ǧ�߷�����', '14.58��', 'smart', '΢�ͳ�', '����', '2018.05', '66', '135', '0.9T 90���� L3', '6��˫���', '3495*1665*1554', '5��4�����ᳵ', '165', '11.9', '-', '-', '4.8', '-', '���겻�޹���', '����&nbsp;/&nbsp;����', 'ǰ��&nbsp;/&nbsp;��-', '-', '-', '-', '-', '-', null, '-', null, '��', '��', '��', '��', '��', '��', '-', '-', '-', '-', '-', '-', '-', null);
INSERT INTO `ims_autoparts_car_info` VALUES ('4', 'smart forfour 2018�� 0.9T 66ǧ���ȷ��', '15.08��', 'smart', '΢�ͳ�', '����', '2018.06', '66', '135', '0.9T 90���� L3', '6��˫���', '3495*1665*1554', '5��4�����ᳵ', '165', '11.9', '-', '-', '4.8', '-', '���겻�޹���', '����&nbsp;/&nbsp;����', 'ǰ��&nbsp;/&nbsp;��-', '-', '-', '-', '-', '-', null, '-', null, '��', '��', '��', '��', '��', '��', '-', '��', '-', '-', '-', '-', '-', null);

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
INSERT INTO `ims_autoparts_car_type` VALUES ('73290', '4', '6723', '�µ�A3', '/home/web/home/images/cartype/160_autohomecar__ChcCP1v9FwmAOKj-AA2TDHRWKf8147.jpg', '1', '1', '1527063241');
INSERT INTO `ims_autoparts_car_type` VALUES ('73291', '4', '6723', '�µ�A4L', '/home/web/home/images/cartype/160_autohomecar__ChsEfVvtVHiAOzUCABHw-uf3Rdg846.jpg', '1', '1', '1527063241');
INSERT INTO `ims_autoparts_car_type` VALUES ('73292', '4', '6723', '�µ�A6L', '/home/web/home/images/cartype/160_autohomecar__ChsEn1vtpgGAGKgoAANCJp9b8Xg537.jpg', '1', '1', '1527063241');
INSERT INTO `ims_autoparts_car_type` VALUES ('73293', '4', '6723', '�µ�A6L����Դ', '/home/web/home/images/cartype/160_autohomecar__wKgH21mgFOGATtH6AAIODrVZ7Cc958.jpg', '1', '1', '1527063241');
INSERT INTO `ims_autoparts_car_type` VALUES ('73294', '4', '6723', '�µ�Q2L', '/home/web/home/images/cartype/160_autohomecar__ChcCRVuiCp2ACQjhAAll7I76Ejs694.jpg', '1', '1', '1527063241');

-- �����ɹ�֧����¼��
create table CarPayRecord
(
	id int primary key auto_increment, -- ���(������������)
	carId int not null, -- ����id(���)
	purNum int not null, -- �ɹ�����
	cost double not null, -- �ܷ���
	staId int not null, -- �ɹ���Ա(���)
	pruTime datetime not null, -- �ɹ�ʱ��
	KEY `P_Fk_key6` (`carId`),
  CONSTRAINT `P_Fk_key6` FOREIGN KEY (`carId`) REFERENCES `ims_autoparts_car_info` (`id`)
);

-- �������������¼��
create table CarSale
(
	id int primary key auto_increment, -- ���(������������)
	staId int not null, -- ������Ա(���)
	cusId int not null, -- �ͻ�id�������
	carId int not null, -- ����id(���)
	dealTime datetime not null, -- �ɽ�ʱ��
	advance double not null, -- Ԥ��
	netReceipts double not null, -- ʵ��
	receivable double not null, -- Ӧ��
	KEY `P_Fk_key11` (`staId`),
  CONSTRAINT `P_Fk_key11` FOREIGN KEY (`staId`) REFERENCES `t_staffion` (`SId`),
	KEY `P_Fk_key12` (`cusId`),
  CONSTRAINT `P_Fk_key12` FOREIGN KEY (`cusId`) REFERENCES `Customer` (`C_Id`),
	KEY `P_Fk_key10` (`carId`),
  CONSTRAINT `P_Fk_key10` FOREIGN KEY (`carId`) REFERENCES `ims_autoparts_car_info` (`id`)
);


-- н�ʷ��ż�¼��--
create table Salary(
	sId int not null auto_increment primary key,
	staId int not null , -- Ա��Id�������--
	merits double ,			 -- ��Ч-- 
	subsidy double DEFAULT 300,	-- ���� --
	askingLeave DOUBLE,				-- ��ٿۿ�--
	askingLate	DOUBLE,	-- �ٵ��ۿ�
	askingUnpunched DOUBLE,	-- δ�򿨿ۿ�--
	askingRetirement DOUBLE,	-- ���˿ۿ� --
	askingAbsenteeism DOUBLE, -- �����ۿ�--
	askingIndividual DOUBLE,	-- ��˰�ۿ� --
	amountMoney DOUBLE, -- Ӧ�����--
	actualMOney	DOUBLE,	-- ʵ�����--
	totalCompany DOUBLE, -- ��˾�ܳɱ�������һ��--
	methodMoney VARCHAR(30) not NULL, -- ���ŷ�ʽ--
	Paymenttime datetime, -- ����ʱ��--
	CashierId int, -- ������(���) --
	KEY `P_Fk_key14` (`staId`),
  CONSTRAINT `P_Fk_key14` FOREIGN KEY (`staId`) REFERENCES `t_staffion` (`SId`),
	KEY `P_Fk_key15` (`CashierId`),
  CONSTRAINT `P_Fk_key15` FOREIGN KEY (`CashierId`) REFERENCES `t_staffion` (`SId`)
);


-- �����ɹ������--
create table apply(
	aId  int not null auto_increment primary key, -- ���--
	applicationName int not null ,	-- ������(���)--
	carId int not null, -- ����id(���)--
	carNum int not null, -- �ɹ�����--
	AmountMoney double not null, -- ������--
	ActualMoney double , -- ʵ��֧��--
	RepaymentMoney DOUBLE, -- ������--
	Applicationtime datetime, -- ����ʱ��--
	remark varchar(100) ,-- ��ע --
	state VARCHAR(30) not null DEFAULT 'δ���', -- ״̬--
	AuditorName int,  -- �����(���)--
	KEY `P_Fk_key16` (`applicationName`),
  CONSTRAINT `P_Fk_key16` FOREIGN KEY (`applicationName`) REFERENCES `t_staffion` (`SId`),
	KEY `P_Fk_key17` (`AuditorName`),
  CONSTRAINT `P_Fk_key17` FOREIGN KEY (`AuditorName`) REFERENCES `t_staffion` (`SId`),
	KEY `P_Fk_key18` (`carId`),
  CONSTRAINT `P_Fk_key18` FOREIGN KEY (`carId`) REFERENCES `ims_autoparts_car_info` (`id`)
);
-- ����֧���� --
create table OtherMoney(
	oId int not null auto_increment primary key, -- ���--
	otherType varchar(50) not null, -- ֧������--
	othMoney DOUBLE not null, -- ֧�����--
	othName int, --  ֧����Ա(���)--
	remark varchar(100), -- ��ע--
	KEY `P_Fk_key19` (`othName`),
  CONSTRAINT `P_Fk_key19` FOREIGN KEY (`othName`) REFERENCES `t_staffion` (`SId`)
); 

-- Ͷ�߱� --
create table Complaint(
	Id int not null auto_increment primary key, -- ���--
	Cid int ,
	type VARCHAR(50) not null,
	remark VARCHAR(200)not null,
	KEY `P_Fk_key20` (`Cid`),
  CONSTRAINT `P_Fk_key20` FOREIGN KEY (`Cid`) REFERENCES `customer` (`C_Id`)
);

-- �ŵ��
create table Store(
	Id int not null auto_increment primary key, -- ���--
	name varchar(50) not null, -- �ŵ�����
	address varchar(100) not null, -- �ŵ��ַ-- 
	phone varchar(20) not null, -- ��ϵ�绰 --
	remark varchar(550) -- ��ע--
);

-- ���ű�--
create table News(
	Id int not null  auto_increment primary key, -- ���--
	type varchar(50) not null, -- ����--
	content varchar(500) not null, -- ����--
	remark varchar(500) -- ��ע--
); 
-- ��˾�ʽ��--
create table capital(
	Id int not null auto_increment primary key, -- ���--
	Money DOUBLE,
	remark VARCHAR (200)
);

INSERT into capital(Money,remark) VALUES(30000000,'���ǹ�˾���ϱ�');

-- ---------------------------------------------------------
-- ����Ա�����ݱ�
INSERT INTO `t_staffion` VALUES ('1', 'admin', '17685188555', '123456', '��', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('2', 'system', '17685188555', '123456', '��', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('3', '����Ա��', '17685188555', '123456', '��', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('4', '������Ա', '17685188555', '123456', '��', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('5', 'admin', '17685188555', '123456', '��', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('6', 'system', '17685188555', '123456', '��', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('7', '����Ա��', '17685188555', '123456', '��', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');
INSERT INTO `t_staffion` VALUES ('8', '������Ա', '17685188555', '123456', '��', '1999-11-11 00:00:00', '1', '2000', '200', '2019-05-03 00:00:00', '2019-06-01 00:00:00', '1', '1');


-- ���ڱ�
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������',
  `staffId` int(11) NOT NULL  COMMENT 'Ա��id,���',
	`time` date NOT NULL COMMENT '�������ڣ�������',
	`beginTime` datetime NOT NULL COMMENT '�ϰ�ʱ��,��ʽʱ-��-��',
	`clockIn` datetime COMMENT '�ϰ��,��ʽʱ-��-��',
	`endTime` datetime NOT NULL COMMENT '�°�ʱ��,��ʽʱ-��-��',
  `clockOut` datetime COMMENT '�°��,��ʽʱ-��-��',
	`statusId` INT NOT NULL COMMENT '0�ٵ���1����2����',
	PRIMARY KEY (`id`),
	KEY `P_Fk_key3` (`staffId`),
  CONSTRAINT `P_Fk_key3` FOREIGN KEY (`staffId`) REFERENCES `t_staffion` (`SId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- ��ٱ�
DROP TABLE IF EXISTS `leaveRoster`; -- ԭ��Ϊleave��������mysql�ؼ����ظ����Ը���
CREATE TABLE `leaveRoster` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������',
	`name` VARCHAR(100) COMMENT '�������',
	`staffId` int(11) NOT NULL COMMENT 'Ա��id,���',
  `time` datetime NOT NULL COMMENT '����ʱ��,��-��-��-ʱ-��-��',
	`beginTime` datetime NOT NULL COMMENT '��ٿ�ʼʱ��,��-��-��-ʱ-��-��',
	`endTime` datetime NOT NULL COMMENT '��ٽ���ʱ��,��-��-��-ʱ-��-��',
	`reason` VARCHAR(100)  NULL COMMENT '�������',
	`leaveStatus` int NULL COMMENT '1:��׼��2:����׼,0:δ���', -- ԭ��Ϊstatus����mysql�ؼ��ֳ�ͻ��ΪleaveStatus
	PRIMARY KEY (`id`),
	KEY `P_Fk_key4` (`staffId`),
  CONSTRAINT `P_Fk_key4` FOREIGN KEY (`staffId`) REFERENCES `t_staffion` (`SId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ��ٱ��������
select * from   leaveRoster inner JOIN t_staffion where leaveRoster.id=t_staffion.SId

