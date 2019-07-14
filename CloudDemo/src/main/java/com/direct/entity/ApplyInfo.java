package com.direct.entity;


public class ApplyInfo {  
	private int appId;//车辆采购申请编号
	private CarInfo ci;//车辆实体
	private ApplyEntity ae;//申请表实体
	private int carNum;//采购数量
	public ApplyEntity getAe() {
		return ae;
	}
	public void setAe(ApplyEntity ae) {
		this.ae = ae;
	}
	public int getAppId() {
		return appId;
	}
	public void setAppId(int appId) {
		this.appId = appId;
	}
	public CarInfo getCi() {
		return ci;
	}
	public void setCi(CarInfo ci) {
		this.ci = ci;
	}
	public int getCarNum() {
		return carNum;
	}
	public void setCarNum(int carNum) {
		this.carNum = carNum;
	}
	
}
