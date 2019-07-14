package com.direct.entity;

public class ApplicationEntity { 
	public int A_id;//应聘id
	public String A_name;//姓名
	public String A_sex;//性别
	public String A_birthday;//出生日期
	public String A_phone;//手机
	public String A_Time;//应聘时间
	public String A_salary;
	public PositionEntity A_postss;//职位id
	public String A_present;//贯籍
	public String A_natio;//民族
	public String A_place;//现居住地址
	public String A_blood;//血型
	public String A_idcate;//身份证编号
	public String A_marital;//婚姻状况
	public String A_politics;//政治面貌
	public String A_maxeducation;//学历
	public String A_maxdegree;//学位
	public String A_Email;//邮箱
	public String A_emIP;//电话
	public String A_Englist;//外语等级
	public String A_computer;//计算机等级
	public String A_Learning_experience;//学习经历
	public String A_Job_resume;//工作简历
	public String A_state;//应聘状态（0审核、1录用、2未通过审核）
	
	

	public int getA_id() {
		return A_id;
	}



	public void setA_id(int a_id) {
		A_id = a_id;
	}



	public String getA_name() {
		return A_name;
	}



	public void setA_name(String a_name) {
		A_name = a_name;
	}



	public String getA_sex() {
		return A_sex;
	}



	public void setA_sex(String a_sex) {
		A_sex = a_sex;
	}



	public String getA_birthday() {
		return A_birthday;
	}



	public void setA_birthday(String a_birthday) {
		A_birthday = a_birthday;
	}



	public String getA_phone() {
		return A_phone;
	}



	public void setA_phone(String a_phone) {
		A_phone = a_phone;
	}



	public String getA_Time() {
		return A_Time;
	}



	public void setA_Time(String a_Time) {
		A_Time = a_Time;
	}



	public String getA_salary() {
		return A_salary;
	}



	public void setA_salary(String a_salary) {
		A_salary = a_salary;
	}



	public PositionEntity getA_postss() {
		return A_postss;
	}



	public void setA_postss(PositionEntity a_postss) {
		A_postss = a_postss;
	}



	public String getA_present() {
		return A_present;
	}



	public void setA_present(String a_present) {
		A_present = a_present;
	}



	public String getA_natio() {
		return A_natio;
	}



	public void setA_natio(String a_natio) {
		A_natio = a_natio;
	}



	public String getA_place() {
		return A_place;
	}



	public void setA_place(String a_place) {
		A_place = a_place;
	}



	public String getA_blood() {
		return A_blood;
	}



	public void setA_blood(String a_blood) {
		A_blood = a_blood;
	}



	public String getA_idcate() {
		return A_idcate;
	}



	public void setA_idcate(String a_idcate) {
		A_idcate = a_idcate;
	}



	public String getA_marital() {
		return A_marital;
	}



	public void setA_marital(String a_marital) {
		A_marital = a_marital;
	}



	public String getA_politics() {
		return A_politics;
	}



	public void setA_politics(String a_politics) {
		A_politics = a_politics;
	}



	public String getA_maxeducation() {
		return A_maxeducation;
	}



	public void setA_maxeducation(String a_maxeducation) {
		A_maxeducation = a_maxeducation;
	}



	public String getA_maxdegree() {
		return A_maxdegree;
	}



	public void setA_maxdegree(String a_maxdegree) {
		A_maxdegree = a_maxdegree;
	}



	public String getA_Email() {
		return A_Email;
	}



	public void setA_Email(String a_Email) {
		A_Email = a_Email;
	}



	public String getA_emIP() {
		return A_emIP;
	}



	public void setA_emIP(String a_emIP) {
		A_emIP = a_emIP;
	}



	public String getA_Englist() {
		return A_Englist;
	}



	public void setA_Englist(String a_Englist) {
		A_Englist = a_Englist;
	}



	public String getA_computer() {
		return A_computer;
	}



	public void setA_computer(String a_computer) {
		A_computer = a_computer;
	}



	public String getA_Learning_experience() {
		return A_Learning_experience;
	}



	public void setA_Learning_experience(String a_Learning_experience) {
		A_Learning_experience = a_Learning_experience;
	}



	public String getA_Job_resume() {
		return A_Job_resume;
	}



	public void setA_Job_resume(String a_Job_resume) {
		A_Job_resume = a_Job_resume;
	}



	public String getA_state() {
		return A_state;
	}



	public void setA_state(String a_state) {
		A_state = a_state;
	}



	public ApplicationEntity(String a_name, String a_sex, String a_birthday,
			String a_phone, String a_Time, String a_salary,
			PositionEntity a_postss, String a_present, String a_natio,
			String a_place, String a_blood, String a_idcate, String a_marital,
			String a_politics, String a_maxeducation, String a_maxdegree,
			String a_Email, String a_emIP, String a_Englist, String a_computer,
			String a_Learning_experience, String a_Job_resume, String a_state) {
		super();
		A_name = a_name;
		A_sex = a_sex;
		A_birthday = a_birthday;
		A_phone = a_phone;
		A_Time = a_Time;
		A_salary = a_salary;
		A_postss = a_postss;
		A_present = a_present;
		A_natio = a_natio;
		A_place = a_place;
		A_blood = a_blood;
		A_idcate = a_idcate;
		A_marital = a_marital;
		A_politics = a_politics;
		A_maxeducation = a_maxeducation;
		A_maxdegree = a_maxdegree;
		A_Email = a_Email;
		A_emIP = a_emIP;
		A_Englist = a_Englist;
		A_computer = a_computer;
		A_Learning_experience = a_Learning_experience;
		A_Job_resume = a_Job_resume;
		A_state = a_state;
	}



	public ApplicationEntity(int a_id, String a_name, String a_sex,
			String a_birthday, String a_phone, String a_Time, String a_salary,
			PositionEntity a_postss, String a_present, String a_natio,
			String a_place, String a_blood, String a_idcate, String a_marital,
			String a_politics, String a_maxeducation, String a_maxdegree,
			String a_Email, String a_emIP, String a_Englist, String a_computer,
			String a_Learning_experience, String a_Job_resume, String a_state) {
		super();
		A_id = a_id;
		A_name = a_name;
		A_sex = a_sex;
		A_birthday = a_birthday;
		A_phone = a_phone;
		A_Time = a_Time;
		A_salary = a_salary;
		A_postss = a_postss;
		A_present = a_present;
		A_natio = a_natio;
		A_place = a_place;
		A_blood = a_blood;
		A_idcate = a_idcate;
		A_marital = a_marital;
		A_politics = a_politics;
		A_maxeducation = a_maxeducation;
		A_maxdegree = a_maxdegree;
		A_Email = a_Email;
		A_emIP = a_emIP;
		A_Englist = a_Englist;
		A_computer = a_computer;
		A_Learning_experience = a_Learning_experience;
		A_Job_resume = a_Job_resume;
		A_state = a_state;
	}



	public ApplicationEntity() {
		super();
	}
	
	
}
