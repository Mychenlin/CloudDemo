package com.direct.entity;

import java.util.Date;


public class StaffionEntity {
	public int sId;	//员工编号
	public String sName;//员工姓名
	public String sIP;	//员工电话
	public String sPassword; //员工密码
	public String sSex;	//员工性别
	public String sBirthdate; //员工出生年月
	public PositionEntity sPosId; //员工职位
	public float sBasepay; //员工基本工资
	public float sSocial; //员工社保
	public String sEntrytime; //员工入职时间
	public String sDeparturetiome; //员工离职时间
	public int sZZ; //员工任职状态
	public int sZT; //员工删除状态
	public int getsId() {
		return this.sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsIP() {
		return sIP;
	}
	public void setsIP(String sIP) {
		this.sIP = sIP;
	}
	public String getsPassword() {
		return sPassword;
	}
	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}
	public String getsSex() {
		return sSex;
	}
	public void setsSex(String sSex) {
		this.sSex = sSex;
	}
	public String getsBirthdate() {
		return sBirthdate;
	}
	public void setsBirthdate(String sBirthdate) {
		this.sBirthdate = sBirthdate;
	}
	public PositionEntity getsPosId() {
		return this.sPosId;
	}
	public void setsPosId(PositionEntity sPosId) {
		this.sPosId = sPosId;
	}
	public float getsBasepay() {
		return sBasepay;
	}
	public void setsBasepay(float sBasepay) {
		this.sBasepay = sBasepay;
	}
	public float getsSocial() {
		return sSocial;
	}
	public void setsSocial(float sSocial) {
		this.sSocial = sSocial;
	}
	public String getsEntrytime() {
		return sEntrytime;
	}
	public void setsEntrytime(String sEntrytime) {
		this.sEntrytime = sEntrytime;
	}
	public String getsDeparturetiome() {
		return sDeparturetiome;
	}
	public void setsDeparturetiome(String sDeparturetiome) {
		this.sDeparturetiome = sDeparturetiome;
	}
	public int getsZZ() {
		return sZZ;
	}
	public void setsZZ(int sZZ) {
		this.sZZ = sZZ;
	}
	public int getsZT() {
		return sZT;
	}
	public void setsZT(int sZT) {
		this.sZT = sZT;
	}
	public StaffionEntity(int sId, String sName, String sIP, String sPassword,
			String sSex, String sBirthdate, PositionEntity sPosId,
			float sBasepay, float sSocial, String sEntrytime,
			String sDeparturetiome, int sZZ, int sZT) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.sIP = sIP;
		this.sPassword = sPassword;
		this.sSex = sSex;
		this.sBirthdate = sBirthdate;
		this.sPosId = sPosId;
		this.sBasepay = sBasepay;
		this.sSocial = sSocial;
		this.sEntrytime = sEntrytime;
		this.sDeparturetiome = sDeparturetiome;
		this.sZZ = sZZ;
		this.sZT = sZT;
	}
	public StaffionEntity() {
		super();
	}
	
	
}
