package com.direct.entity;

import java.util.Date;

public class AttendanceEnity {
	private int id;
	private StaffionEntity staffId;
	private String time;
	private String beginTime;
	private String clockIn;
	private String endTime;
	private String clockOut;
	private int statusId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public StaffionEntity getStaffId() {
		return staffId;
	}
	public void setStaffId(StaffionEntity staffId) {
		this.staffId = staffId;
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
	public String getClockIn() {
		return clockIn;
	}
	public void setClockIn(String clockIn) {
		this.clockIn = clockIn;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getClockOut() {
		return clockOut;
	}
	public void setClockOut(String clockOut) {
		this.clockOut = clockOut;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public AttendanceEnity(int id, StaffionEntity staffId, String time,
			String beginTime, String clockIn, String endTime, String clockOut,
			int statusId) {
		super();
		this.id = id;
		this.staffId = staffId;
		this.time = time;
		this.beginTime = beginTime;
		this.clockIn = clockIn;
		this.endTime = endTime;
		this.clockOut = clockOut;
		this.statusId = statusId;
	}
	public AttendanceEnity(StaffionEntity staffId, String time,
			String beginTime, String clockIn, String endTime, String clockOut,
			int statusId) {
		super();
		this.staffId = staffId;
		this.time = time;
		this.beginTime = beginTime;
		this.clockIn = clockIn;
		this.endTime = endTime;
		this.clockOut = clockOut;
		this.statusId = statusId;
	}

	public AttendanceEnity() {
		super();
	}
	
	

	
	
}
