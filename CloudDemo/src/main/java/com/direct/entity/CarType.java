package com.direct.entity;

public class CarType {
	//汽车类型
	private int id;
	private int uniacid;
	private CarBrand brand_id;//品牌ID
	private String name;//类型名称
	private String pic_url;//图片地址
	private int  status;//现状
	private int sort;//种类
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
	public CarBrand getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(CarBrand brand_id) {
		this.brand_id = brand_id;
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
	public int getCreate_time() {
		return create_time;
	}
	public void setCreate_time(int create_time) {
		this.create_time = create_time;
	}
	
}
