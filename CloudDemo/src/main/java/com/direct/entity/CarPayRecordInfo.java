package com.direct.entity;

import java.util.Date;

public class CarPayRecordInfo {
	private int id;//车辆采购记录编号
	private CarInfo ci;//车辆（实体）
	private int purNum;//采购数量
	private double cost;//总费用
	private StaffionEntity sta;//采购人员（员工实体）
	private Date pruTime;//采购时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public CarInfo getCi() {
		return ci;
	}
	public void setCi(CarInfo ci) {
		this.ci = ci;
	}
	public int getPurNum() {
		return purNum;
	}
	public void setPurNum(int purNum) {
		this.purNum = purNum;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public StaffionEntity getSta() {
		return sta;
	}
	public void setSta(StaffionEntity sta) {
		this.sta = sta;
	}
	public Date getPruTime() {
		return pruTime;
	}
	public void setPruTime(Date pruTime) {
		this.pruTime = pruTime;
	}
	
}
