package com.direct.entity;

public class CompleaintsEntity {
//意见
	public int cId;
	public String cName;
	public String cIp;
	public String cEmail;
	public String cremark;
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcIp() {
		return cIp;
	}
	public void setcIp(String cIp) {
		this.cIp = cIp;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getCremark() {
		return cremark;
	}
	public void setCremark(String cremark) {
		this.cremark = cremark;
	}
	
	public CompleaintsEntity() {
		super();
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public CompleaintsEntity(int cId, String cName, String cIp, String cEmail,
			String cremark) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cIp = cIp;
		this.cEmail = cEmail;
		this.cremark = cremark;
	}
	
	
}
