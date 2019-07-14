package com.direct.entity;


public class BranchEntity {
	public int bId;
	public String bName;
	public String bRemark;
	public int bZT ;
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbRemark() {
		return bRemark;
	}
	public void setbRemark(String bRemark) {
		this.bRemark = bRemark;
	}
	public int getbZT() {
		return bZT;
	}
	public void setbZT(int bZT) {
		this.bZT = bZT;
	}
	public BranchEntity(int bId, String bName, String bRemark, int bZT) {
		super();
		this.bId = bId;
		this.bName = bName;
		this.bRemark = bRemark;
		this.bZT = bZT;
	}
	public BranchEntity() {
		super();
	}
	
	
}
