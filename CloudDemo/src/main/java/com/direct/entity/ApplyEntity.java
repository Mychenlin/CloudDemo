package com.direct.entity;

import java.util.Date;

public class ApplyEntity {
	private int aId;//车辆采购申请编号
	private StaffionEntity applicationName;//申请人（员工实体）
	private double amountMoney;//申请金额
	private double actualMoney;//实际支出
	private double repaymentMoney;//还款金额
	private Date applicationtime;//申请时间
	private String state;//状态
	private StaffionEntity auditorName;//审核人（员工实体）
	public int getaId() {
		return aId;
	}
	public void setaId(int aId) {
		this.aId = aId;
	}
	public StaffionEntity getApplicationName() {
		return applicationName;
	}
	public void setApplicationName(StaffionEntity applicationName) {
		this.applicationName = applicationName;
	}
	public double getAmountMoney() {
		return amountMoney;
	}
	public void setAmountMoney(double amountMoney) {
		this.amountMoney = amountMoney;
	}
	public double getActualMoney() {
		return actualMoney;
	}
	public void setActualMoney(double actualMoney) {
		this.actualMoney = actualMoney;
	}
	public double getRepaymentMoney() {
		return repaymentMoney;
	}
	public void setRepaymentMoney(double repaymentMoney) {
		this.repaymentMoney = repaymentMoney;
	}
	public Date getApplicationtime() {
		return applicationtime;
	}
	public void setApplicationtime(Date applicationtime) {
		this.applicationtime = applicationtime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public StaffionEntity getAuditorName() {
		return auditorName;
	}
	public void setAuditorName(StaffionEntity auditorName) {
		this.auditorName = auditorName;
	}
	
}
