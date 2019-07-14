package com.direct.entity;

public class RepyEntity {

	public int reId;
	public ReservationSMSEntiry rrId;
	public int rsId;
	public String rhtime;
	public String rRemark;
	public int getReId() {
		return reId;
	}
	public void setReId(int reId) {
		this.reId = reId;
	}
	public ReservationSMSEntiry getRrId() {
		return rrId;
	}
	public void setRrId(ReservationSMSEntiry rrId) {
		this.rrId = rrId;
	}
	public int getRsId() {
		return rsId;
	}
	public void setRsId(int rsId) {
		this.rsId = rsId;
	}
	public String getRhtime() {
		return rhtime;
	}
	public void setRhtime(String rhtime) {
		this.rhtime = rhtime;
	}
	public String getrRemark() {
		return rRemark;
	}
	public void setrRemark(String rRemark) {
		this.rRemark = rRemark;
	}
	public RepyEntity(int reId, ReservationSMSEntiry rrId, int rsId,
			String rhtime, String rRemark) {
		super();
		this.reId = reId;
		this.rrId = rrId;
		this.rsId = rsId;
		this.rhtime = rhtime;
		this.rRemark = rRemark;
	}
	public RepyEntity() {
		super();
	}
	
	
	
}
