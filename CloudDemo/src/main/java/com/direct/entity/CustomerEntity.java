package com.direct.entity;

public class CustomerEntity {
	public int C_Id;//编号
	public String C_name;//姓名
	public String C_sex;//性别
	public String C_age;//出生日期
	public String C_place;//客户地址
	public String C_phone;//手机
	public String C_Models;//车型
	public String C_Email;//邮箱
	public String C_emIP;//电话
	public int C_Balance;//余额
	public int getC_Id() {
		return C_Id;
	}
	public void setC_Id(int c_Id) {
		C_Id = c_Id;
	}
	public String getC_name() {
		return C_name;
	}
	public void setC_name(String c_name) {
		C_name = c_name;
	}
	public String getC_sex() {
		return C_sex;
	}
	public void setC_sex(String c_sex) {
		C_sex = c_sex;
	}
	public String getC_age() {
		return C_age;
	}
	public void setC_age(String c_age) {
		C_age = c_age;
	}
	public String getC_place() {
		return C_place;
	}
	public void setC_place(String c_place) {
		C_place = c_place;
	}
	public String getC_phone() {
		return C_phone;
	}
	public void setC_phone(String c_phone) {
		C_phone = c_phone;
	}
	public String getC_Models() {
		return C_Models;
	}
	public void setC_Models(String c_Models) {
		C_Models = c_Models;
	}
	public String getC_Email() {
		return C_Email;
	}
	public void setC_Email(String c_Email) {
		C_Email = c_Email;
	}
	public String getC_emIP() {
		return C_emIP;
	}
	public void setC_emIP(String c_emIP) {
		C_emIP = c_emIP;
	}
	public int getC_Balance() {
		return C_Balance;
	}
	public void setC_Balance(int c_Balance) {
		C_Balance = c_Balance;
	}
	public CustomerEntity(String c_name, String c_sex, String c_age,
			String c_place, String c_phone, String c_Models, String c_Email,
			String c_emIP, int c_Balance) {
		super();
		C_name = c_name;
		C_sex = c_sex;
		C_age = c_age;
		C_place = c_place;
		C_phone = c_phone;
		C_Models = c_Models;
		C_Email = c_Email;
		C_emIP = c_emIP;
		C_Balance = c_Balance;
	}
	public CustomerEntity() {
		super();
	}
	
}
