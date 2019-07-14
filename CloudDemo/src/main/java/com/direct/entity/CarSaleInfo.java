package com.direct.entity;

import java.util.Date;

public class CarSaleInfo {
	private int id;//车辆销售记录编号
	private StaffionEntity staId;//销售人员（员工实体）
	private String cusId;//购买客户（客户实体）
	private CarSaleInfo carId;//车辆（车辆实体）
	
	private Date dealTime;//成交时间
	private double advance;//预收
	private double netReceipts;//实收
	private double receivable;//应收
	public CarSaleInfo(int id, StaffionEntity staId, String cusId,
			CarSaleInfo carId, Date dealTime, double advance,
			double netReceipts, double receivable) {
		super();
		this.id = id;
		this.staId = staId;
		this.cusId = cusId;
		this.carId = carId;
		this.dealTime = dealTime;
		this.advance = advance;
		this.netReceipts = netReceipts;
		this.receivable = receivable;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public StaffionEntity getStaId() {
		return staId;
	}
	public void setStaId(StaffionEntity staId) {
		this.staId = staId;
	}
	public String getCusId() {
		return cusId;
	}
	public void setCusId(String cusId) {
		this.cusId = cusId;
	}
	public CarSaleInfo getCarId() {
		return carId;
	}
	public void setCarId(CarSaleInfo carId) {
		this.carId = carId;
	}
	public Date getDealTime() {
		return dealTime;
	}
	public void setDealTime(Date dealTime) {
		this.dealTime = dealTime;
	}
	public double getAdvance() {
		return advance;
	}
	public void setAdvance(double advance) {
		this.advance = advance;
	}
	public double getNetReceipts() {
		return netReceipts;
	}
	public void setNetReceipts(double netReceipts) {
		this.netReceipts = netReceipts;
	}
	public double getReceivable() {
		return receivable;
	}
	public void setReceivable(double receivable) {
		this.receivable = receivable;
	}
	public CarSaleInfo() {
		super();
	}
	public CarSaleInfo(StaffionEntity staId, String cusId, CarSaleInfo carId,
			Date dealTime, double advance, double netReceipts, double receivable) {
		super();
		this.staId = staId;
		this.cusId = cusId;
		this.carId = carId;
		this.dealTime = dealTime;
		this.advance = advance;
		this.netReceipts = netReceipts;
		this.receivable = receivable;
	}
	
}
