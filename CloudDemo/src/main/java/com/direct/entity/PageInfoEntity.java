package com.direct.entity;

import java.util.List;

public class PageInfoEntity<T> {
	public int currePage;//当前页
	public int size;//当前条
	public int sumCount;//总条数
	public int sumPage;//总页数
	public List<T> list;
	
	public int firstPage=1;//首页
	public int upPage;//上一页
	public int nextPage;//下一页
	public int lastPage;//尾页
	public int getCurrePage() {
		return currePage;
	}
	public void setCurrePage(int currePage) {
		this.currePage = currePage;
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
		//获取到总条数时计算以下
		
		//计算总页数
		this.sumPage=this.sumCount/this.size;
		if(this.sumCount%this.size!=0){
			this.sumPage++;
		}
		
		//计算上一页
		this.upPage=this.currePage==1?1:this.currePage-1;
		
		//计算下一页
		this.nextPage=this.currePage==this.sumPage?this.sumPage:this.currePage+1;
		
		//尾页
		this.lastPage=this.sumPage;
		
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
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	

}
