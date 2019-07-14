package com.direct.entity;

import java.util.Date;

public class OtherMoney {
	private int oId;//主键  自增长
	private String otherType;// 支出类型
	private double othMoney;//支出金额
	private StaffionEntity othName;//支出人员(外键)
	private Date othtime;//支出时间
	private String remark;//备注
	public int getoId() {
		return oId;
	}
	public void setoId(int oId) {
		this.oId = oId;
	}
	public String getOtherType() {
		return otherType;
	}
	public void setOtherType(String otherType) {
		this.otherType = otherType;
	}
	public double getOthMoney() {
		return othMoney;
	}
	public void setOthMoney(double othMoney) {
		this.othMoney = othMoney;
	}
	public StaffionEntity getOthName() {
		return othName;
	}
	public void setOthName(StaffionEntity othName) {
		this.othName = othName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Date getOthtime() {
		return othtime;
	}
	public void setOthtime(Date othtime) {
		this.othtime = othtime;
	}
	public OtherMoney(int oId, String otherType, double othMoney, StaffionEntity othName, Date othtime, String remark) {
		super();
		this.oId = oId;
		this.otherType = otherType;
		this.othMoney = othMoney;
		this.othName = othName;
		this.othtime = othtime;
		this.remark = remark;
	}
	public OtherMoney(String otherType, double othMoney, StaffionEntity othName, Date othtime, String remark) {
		super();
		this.otherType = otherType;
		this.othMoney = othMoney;
		this.othName = othName;
		this.othtime = othtime;
		this.remark = remark;
	}
	public OtherMoney() {
		super();
	}

	
	  
}
