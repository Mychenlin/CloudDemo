package com.direct.service;

import java.util.List;

import com.direct.entity.News;
import com.direct.entity.StaffionEntity;
import com.direct.util.PageModel;

public interface INewsService {
	//新闻查询
	public PageModel<News> selectNews(int curr,int size);
	//新闻添加
	public int addNews(News ni);
	
	//通过Id查找
	public News selById(int id);
	//新闻修改
	public int manchNews(News ni);
		
		
	//新闻删除
	public int removeNews(int id);
}
