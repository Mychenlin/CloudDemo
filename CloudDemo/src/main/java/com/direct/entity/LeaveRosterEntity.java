package com.direct.entity;

import java.util.Date;

public class LeaveRosterEntity {
	private int id;
	private String name;
	private int staffId;//员工Id（外键）
	private String time;
	private String beginTime;
	private String endTime;
	private String reason;
	private int leaveStatus;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getLeaveStatus() {
		return leaveStatus;
	}
	public void setLeaveStatus(int leaveStatus) {
		this.leaveStatus = leaveStatus;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public LeaveRosterEntity() {
		super();
	}
	
	
}

/*
CREATE TABLE `leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '请假主键',
	`name` VARCHAR(100) COMMENT '请假名称',
	`staffId` int(11) NOT NULL COMMENT '员工id,外键',
    `time` datetime NOT NULL COMMENT '申请时间,年-月-日-时-分-秒',
	`beginTime` datetime NOT NULL COMMENT '请假开始时间,年-月-日-时-分-秒',
	`endTime` datetime NOT NULL COMMENT '请假结束时间,年-月-日-时-分-秒',
	`reason` VARCHAR(100)  NULL COMMENT '请假理由',
	`status` int NULL COMMENT '1:批准，2:不批准,0:未审核',
	PRIMARY KEY (`id`),
	KEY `P_Fk_key4` (`staffId`),
  CONSTRAINT `P_Fk_key4` FOREIGN KEY (`staffId`) REFERENCES `t_staffion` (`SId`),
	KEY `P_Fk_key5` (`department`),
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

 * */


