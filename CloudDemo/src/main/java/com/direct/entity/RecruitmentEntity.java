package com.direct.entity;

public class RecruitmentEntity {
	public int reId;//编号
	public PositionEntity post;//职位对象
	public String education;//学历
	public String pRemark;//职位介绍
	public String start_time;//发布时间
	public String end_time;//截止时间
	public int salarymin;//最低薪资
	public int salary_max;//最高薪资
	public int sum;//招聘人数
	
	

	public int getReId() {
		return reId;
	}



	public void setReId(int reId) {
		this.reId = reId;
	}



	public PositionEntity getPost() {
		return post;
	}



	public void setPost(PositionEntity post) {
		this.post = post;
	}



	public String getEducation() {
		return education;
	}



	public void setEducation(String education) {
		this.education = education;
	}



	public String getpRemark() {
		return pRemark;
	}



	public void setpRemark(String pRemark) {
		this.pRemark = pRemark;
	}



	public String getStart_time() {
		return start_time;
	}



	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}



	public String getEnd_time() {
		return end_time;
	}



	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}



	public int getSalarymin() {
		return salarymin;
	}



	public void setSalarymin(int salarymin) {
		this.salarymin = salarymin;
	}



	public int getSalary_max() {
		return salary_max;
	}



	public void setSalary_max(int salary_max) {
		this.salary_max = salary_max;
	}



	public int getSum() {
		return sum;
	}



	public void setSum(int sum) {
		this.sum = sum;
	}



	public RecruitmentEntity(PositionEntity post, String education,
			String pRemark, String start_time, String end_time, int salarymin,
			int salary_max, int sum) {
		super();
		this.post = post;
		this.education = education;
		this.pRemark = pRemark;
		this.start_time = start_time;
		this.end_time = end_time;
		this.salarymin = salarymin;
		this.salary_max = salary_max;
		this.sum = sum;
	}



	public RecruitmentEntity() {
		super();
	}
	
}
