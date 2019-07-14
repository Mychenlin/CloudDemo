package com.direct.entity;

public class PositionEntity {
	public int pId;
	public String pName;
	public BranchEntity pBId ;
	public String pRemark;
	public int pZT ;
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public BranchEntity getpBId() {
		return pBId;
	}
	public void setpBId(BranchEntity pBId) {
		this.pBId = pBId;
	}
	public String getpRemark() {
		return pRemark;
	}
	public void setpRemark(String pRemark) {
		this.pRemark = pRemark;
	}
	public int getpZT() {
		return pZT;
	}
	public void setpZT(int pZT) {
		this.pZT = pZT;
	}
	public PositionEntity(int pId, String pName, BranchEntity pBId,
			String pRemark, int pZT) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pBId = pBId;
		this.pRemark = pRemark;
		this.pZT = pZT;
	}
	public PositionEntity() {
		super();
	}

}
