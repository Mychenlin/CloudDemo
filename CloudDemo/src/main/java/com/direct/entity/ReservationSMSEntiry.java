package com.direct.entity;

public class ReservationSMSEntiry {
	public int rId;
	public String rName;
	public String rftime;
	public String rIp;
	public String rRemark;
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getRftime() {
		return rftime;
	}
	public void setRftime(String rftime) {
		this.rftime = rftime;
	}
	public String getrIp() {
		return rIp;
	}
	public void setrIp(String rIp) {
		this.rIp = rIp;
	}
	public String getrRemark() {
		return rRemark;
	}
	public void setrRemark(String rRemark) {
		this.rRemark = rRemark;
	}
	public ReservationSMSEntiry(int rId, String rName, String rftime,
			String rIp, String rRemark) {
		super();
		this.rId = rId;
		this.rName = rName;
		this.rftime = rftime;
		this.rIp = rIp;
		this.rRemark = rRemark;
	}
	public ReservationSMSEntiry() {
		super();
	}

	


}
