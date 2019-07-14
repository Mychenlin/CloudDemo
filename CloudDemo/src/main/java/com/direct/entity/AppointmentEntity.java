package com.direct.entity;

public class AppointmentEntity {
	public int a_Id;//编号
	public CustomerEntity C_info;//客户信息
	public String a_time;//发起预约时间
	public String a_Estimated_time;//预计服务时间
	public String a_type;//预约类型
	public String a_remark;//备注
	public String a_state;
	
	public int getA_Id() {
		return a_Id;
	}

	public void setA_Id(int a_Id) {
		this.a_Id = a_Id;
	}

	public CustomerEntity getC_info() {
		return C_info;
	}

	public void setC_info(CustomerEntity c_info) {
		C_info = c_info;
	}

	public String getA_time() {
		return a_time;
	}

	public void setA_time(String a_time) {
		this.a_time = a_time;
	}

	public String getA_Estimated_time() {
		return a_Estimated_time;
	}

	public void setA_Estimated_time(String a_Estimated_time) {
		this.a_Estimated_time = a_Estimated_time;
	}

	public String getA_type() {
		return a_type;
	}

	public void setA_type(String a_type) {
		this.a_type = a_type;
	}

	public String getA_remark() {
		return a_remark;
	}

	public void setA_remark(String a_remark) {
		this.a_remark = a_remark;
	}

	public String getA_state() {
		return a_state;
	}

	public void setA_state(String a_state) {
		this.a_state = a_state;
	}

	public AppointmentEntity(int a_Id, CustomerEntity c_info, String a_time,
			String a_Estimated_time, String a_type, String a_remark,
			String a_state) {
		super();
		this.a_Id = a_Id;
		C_info = c_info;
		this.a_time = a_time;
		this.a_Estimated_time = a_Estimated_time;
		this.a_type = a_type;
		this.a_remark = a_remark;
		this.a_state = a_state;
	}

	public AppointmentEntity(CustomerEntity c_info, String a_time,
			String a_Estimated_time, String a_type, String a_remark,
			String a_state) {
		super();
		C_info = c_info;
		this.a_time = a_time;
		this.a_Estimated_time = a_Estimated_time;
		this.a_type = a_type;
		this.a_remark = a_remark;
		this.a_state = a_state;
	}

	public AppointmentEntity() {
		super();
	}
	
}
