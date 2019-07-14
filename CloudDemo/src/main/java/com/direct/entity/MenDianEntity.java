package com.direct.entity;

public class MenDianEntity {
	public int  mId;
	public String mName;
	public String mFname;
	public String mIp;
	public String mhtime;
	public int mZT;
	public String mTzT;
	public String rRemark;
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmFname() {
		return mFname;
	}
	public void setmFname(String mFname) {
		this.mFname = mFname;
	}
	public String getmIp() {
		return mIp;
	}
	public void setmIp(String mIp) {
		this.mIp = mIp;
	}
	public String getMhtime() {
		return mhtime;
	}
	public void setMhtime(String mhtime) {
		this.mhtime = mhtime;
	}
	public int getmZT() {
		return mZT;
	}
	public void setmZT(int mZT) {
		this.mZT = mZT;
	}
	public String getmTzT() {
		return mTzT;
	}
	public void setmTzT(String mTzT) {
		this.mTzT = mTzT;
	}
	public String getrRemark() {
		return rRemark;
	}
	public void setrRemark(String rRemark) {
		this.rRemark = rRemark;
	}
	public MenDianEntity(int mId, String mName, String mFname, String mIp,
			String mhtime, int mZT, String mTzT, String rRemark) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.mFname = mFname;
		this.mIp = mIp;
		this.mhtime = mhtime;
		this.mZT = mZT;
		this.mTzT = mTzT;
		this.rRemark = rRemark;
	}
	public MenDianEntity() {
		super();
	}
	
	

}
