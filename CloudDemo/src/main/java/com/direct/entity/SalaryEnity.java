package com.direct.entity;

import java.io.Serializable;
import java.util.Date;

public class SalaryEnity implements Serializable {
	private int sId; //主键 自增长
	private double merits; //绩效
	private double subsidy; //补贴
	private double askingLeave; //请假扣款
	private double askingLate; //迟到扣款
	private double askingUnpunched; //未打卡扣款
	private double askingRetirement; //早退扣款
	private double askingAbsenteeism; //旷工扣款
	private double askingIndividual; //个税扣款
	private double amountMoney; //应发金额
	private double actualMOney;//实发金额
	private double totalCompany;//公司总成本（五险一金)
	private String methodMoney;//发放方式
	private Date paymenttime;//发放时间
	
	private StaffionEntity staId;//员工Id（外键）
	private StaffionEntity cashierId;//出纳人(外键)
	
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public double getMerits() {
		return merits;
	}
	public void setMerits(double merits) {
		this.merits = merits;
	}
	public double getSubsidy() {
		return subsidy;
	}
	public void setSubsidy(double subsidy) {
		this.subsidy = subsidy;
	}
	public double getAskingLeave() {
		return askingLeave;
	}
	public void setAskingLeave(double askingLeave) {
		this.askingLeave = askingLeave;
	}
	public double getAskingLate() {
		return askingLate;
	}
	public void setAskingLate(double askingLate) {
		this.askingLate = askingLate;
	}
	public double getAskingUnpunched() {
		return askingUnpunched;
	}
	public void setAskingUnpunched(double askingUnpunched) {
		this.askingUnpunched = askingUnpunched;
	}
	public double getAskingRetirement() {
		return askingRetirement;
	}
	public void setAskingRetirement(double askingRetirement) {
		this.askingRetirement = askingRetirement;
	}
	public double getAskingAbsenteeism() {
		return askingAbsenteeism;
	}
	public void setAskingAbsenteeism(double askingAbsenteeism) {
		this.askingAbsenteeism = askingAbsenteeism;
	}
	public double getAskingIndividual() {
		return askingIndividual;
	}
	public void setAskingIndividual(double askingIndividual) {
		this.askingIndividual = askingIndividual;
	}
	public double getAmountMoney() {
		return amountMoney;
	}
	public void setAmountMoney(double amountMoney) {
		this.amountMoney = amountMoney;
	}
	public double getActualMOney() {
		return actualMOney;
	}
	public void setActualMOney(double actualMOney) {
		this.actualMOney = actualMOney;
	}
	public double getTotalCompany() {
		return totalCompany;
	}
	public void setTotalCompany(double totalCompany) {
		this.totalCompany = totalCompany;
	}
	public String getMethodMoney() {
		return methodMoney;
	}
	public void setMethodMoney(String methodMoney) {
		this.methodMoney = methodMoney;
	}
	public Date getPaymenttime() {
		return paymenttime;
	}
	public void setPaymenttime(Date paymenttime) {
		this.paymenttime = paymenttime;
	}
	public StaffionEntity getStaId() {
		return staId;
	}
	public void setStaId(StaffionEntity staId) {
		this.staId = staId;
	}
	public StaffionEntity getCashierId() {
		return cashierId;
	}
	public void setCashierId(StaffionEntity cashierId) {
		this.cashierId = cashierId;
	}
	public SalaryEnity(int sId, double merits, double subsidy, double askingLeave,
			double askingLate, double askingUnpunched, double askingRetirement,
			double askingAbsenteeism, double askingIndividual,
			double amountMoney, double actualMOney, double totalCompany,
			String methodMoney, Date paymenttime, StaffionEntity staId,
			StaffionEntity cashierId) {
		super();
		this.sId = sId;
		this.merits = merits;
		this.subsidy = subsidy;
		this.askingLeave = askingLeave;
		this.askingLate = askingLate;
		this.askingUnpunched = askingUnpunched;
		this.askingRetirement = askingRetirement;
		this.askingAbsenteeism = askingAbsenteeism;
		this.askingIndividual = askingIndividual;
		this.amountMoney = amountMoney;
		this.actualMOney = actualMOney;
		this.totalCompany = totalCompany;
		this.methodMoney = methodMoney;
		paymenttime = paymenttime;
		this.staId = staId;
		cashierId = cashierId;
	}
	
	public SalaryEnity(double merits, double subsidy, double askingLeave,
			double askingLate, double askingUnpunched, double askingRetirement,
			double askingAbsenteeism, double askingIndividual,
			double amountMoney, double actualMOney, double totalCompany,
			String methodMoney, Date paymenttime, StaffionEntity staId,
			StaffionEntity cashierId) {
		super();
		this.merits = merits;
		this.subsidy = subsidy;
		this.askingLeave = askingLeave;
		this.askingLate = askingLate;
		this.askingUnpunched = askingUnpunched;
		this.askingRetirement = askingRetirement;
		this.askingAbsenteeism = askingAbsenteeism;
		this.askingIndividual = askingIndividual;
		this.amountMoney = amountMoney;
		this.actualMOney = actualMOney;
		this.totalCompany = totalCompany;
		this.methodMoney = methodMoney;
		this.paymenttime = paymenttime;
		this.staId = staId;
		this.cashierId = cashierId;
	}
	public SalaryEnity() {
		super();
	}
	
	
}
