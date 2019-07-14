package com.direct.util;

import java.util.List;

public class PageModel<T> {
	private int currentPage=1;//当前页
	private int size=5;//显示条数
	private int sumCount;//总条数(查询统计)
	private int sumPage;//总页数(计算得到)
	private List<T> list;//当前页数据集合
	
	private int firstPage=1;
	private int upPage;//(计算得到)
	private int nextPage;//(计算得到)
	private int lastPage;//(计算得到)
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getSumCount() {
		return sumCount;
	}
	public void setSumCount(int sumCount) {
		this.sumCount = sumCount;
		
		//计算
		this.sumPage=this.sumCount/this.size;
		if(this.sumCount%this.size!=0){
			this.sumPage++;
		}
		
		this.upPage=this.currentPage==1?1:this.currentPage-1;
		this.nextPage=this.currentPage==this.sumPage?this.sumPage:this.currentPage+1;
		this.lastPage=this.sumPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getSumPage() {
		return sumPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public int getUpPage() {
		return upPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	
}
