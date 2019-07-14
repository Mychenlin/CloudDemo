package com.direct.dao;

import java.util.List;

import javax.enterprise.inject.New;

import com.direct.entity.News;


public interface NewsDao {
	//新闻查询
	public List<News> queryNews();
	//新闻添加
	public int insertNews(News ni);
	
	//通过Id查找
	public News queryById(int id);
	//新闻修改
	public int updateNews(News ni);
		
		
	//新闻删除
	public int deleteNews(int id);
		
		
	
	
	
}
