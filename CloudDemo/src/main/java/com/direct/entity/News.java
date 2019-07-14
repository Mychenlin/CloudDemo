package com.direct.entity;

import java.util.Date;

public class News {
	private int id;
	private StaffionEntity sId;
	private String type;
	private String title;
	private Date newtime;
	private String content;
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public StaffionEntity getsId() {
		return sId;
	}
	public void setsId(StaffionEntity sId) {
		this.sId = sId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getNewtime() {
		return newtime;
	}
	public void setNewtime(Date newtime) {
		this.newtime = newtime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public News(int id, StaffionEntity sId, String type, String title, Date newtime, String content, String remark) {
		super();
		this.id = id;
		this.sId = sId;
		this.type = type;
		this.title = title;
		this.newtime = newtime;
		this.content = content;
		this.remark = remark;
	}
	public News(StaffionEntity sId, String type, String title, Date newtime, String content, String remark) {
		super();
		this.sId = sId;
		this.type = type;
		this.title = title;
		this.newtime = newtime;
		this.content = content;
		this.remark = remark;
	}
	public News() {
		super();
	}
	
	
	
}
