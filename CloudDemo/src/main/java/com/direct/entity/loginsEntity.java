package com.direct.entity;

public class loginsEntity {
	public int lId;
	public String lName;
	public String lpassword;
	public int getlId() {
		return lId;
	}
	public void setlId(int lId) {
		this.lId = lId;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getLpassword() {
		return lpassword;
	}
	public void setLpassword(String lpassword) {
		this.lpassword = lpassword;
	}
	public loginsEntity(int lId, String lName, String lpassword) {
		super();
		this.lId = lId;
		this.lName = lName;
		this.lpassword = lpassword;
	}
	public loginsEntity() {
		super();
	}
	

}
