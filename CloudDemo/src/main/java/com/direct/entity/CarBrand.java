package com.direct.entity;

public class CarBrand {
	//汽车品牌
	private int id;
	private int uniacid;
	private int parent_id;
	private String initials;//首字母
	private String name;//品牌名称
	private String pic_url;//图片地址
	private int status;//现状
	private int sort;//种类
	private int is_hot;//是否热门
	private int create_time;//生产时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUniacid() {
		return uniacid;
	}
	public void setUniacid(int uniacid) {
		this.uniacid = uniacid;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public String getInitials() {
		return initials;
	}
	public void setInitials(String initials) {
		this.initials = initials;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPic_url() {
		return pic_url;
	}
	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(int is_hot) {
		this.is_hot = is_hot;
	}
	public int getCreate_time() {
		return create_time;
	}
	public void setCreate_time(int create_time) {
		this.create_time = create_time;
	}
	public CarBrand(int id, int uniacid, int parent_id, String initials,
			String name, String pic_url, int status, int sort, int is_hot,
			int create_time) {
		super();
		this.id = id;
		this.uniacid = uniacid;
		this.parent_id = parent_id;
		this.initials = initials;
		this.name = name;
		this.pic_url = pic_url;
		this.status = status;
		this.sort = sort;
		this.is_hot = is_hot;
		this.create_time = create_time;
	}
	public CarBrand(int uniacid, int parent_id, String initials, String name,
			String pic_url, int status, int sort, int is_hot, int create_time) {
		super();
		this.uniacid = uniacid;
		this.parent_id = parent_id;
		this.initials = initials;
		this.name = name;
		this.pic_url = pic_url;
		this.status = status;
		this.sort = sort;
		this.is_hot = is_hot;
		this.create_time = create_time;
	}
	public CarBrand() {
		super();
	}
	
	
}
