package com.direct.service.impl;

import java.util.List;

import javax.enterprise.inject.New;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.NewsDao;
import com.direct.entity.News;
import com.direct.entity.OtherMoney;
import com.direct.entity.StaffionEntity;
import com.direct.service.INewsService;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
@Service("NewManagementService")
public class NewsServiceimpl implements INewsService {
	@Autowired
	private NewsDao dao;
		
		//分页查看新闻
	@Override
	public PageModel<News> selectNews(int curr,int size) {
		//初始化分页的当前页数和显示条数
		Page page = PageHelper.startPage(curr, size, true);
		//得到数据集合
		List<News> slist = dao.queryNews();
		//得到总条数
		int count=(int)page.getTotal();
		//封装
		PageModel<News> mod=new PageModel<News>();
		mod.setCurrentPage(curr);//当前页
		mod.setSize(size);//显示条数
		mod.setSumCount(count);//总条数
		mod.setList(slist);
		return mod;
	}

	@Override
	public int addNews(News ni) {
		// TODO Auto-generated method stub
		return dao.insertNews(ni);
	}

	@Override
	public News selById(int id) {
		// TODO Auto-generated method stub
		return dao.queryById(id);
	}

	@Override
	public int manchNews(News ni) {
		// TODO Auto-generated method stub
		return dao.updateNews(ni);
	}

	@Override
	public int removeNews(int id) {
		// TODO Auto-generated method stub
		return dao.deleteNews(id);
	}

}
