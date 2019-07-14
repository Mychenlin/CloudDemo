package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.OthermoneyDao;
import com.direct.entity.OtherMoney;
import com.direct.service.OthermoneyService;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
@Service("otherService")
public class OthermoneyServiceimple implements OthermoneyService {
	@Autowired
	private OthermoneyDao dao;
	
	//查询其它薪资
	//分页查看
	public PageModel<OtherMoney> selectSalary(int curr,int size) {
		//初始化分页的当前页数和显示条数
		Page page = PageHelper.startPage(curr, size, true);
		//得到数据集合
		List<OtherMoney> slist = dao.queryMoney();
		//得到总条数
		int count=(int)page.getTotal();
		//封装
		PageModel<OtherMoney> mod=new PageModel<OtherMoney>();
		mod.setCurrentPage(curr);//当前页
		mod.setSize(size);//显示条数
		mod.setSumCount(count);//总条数
		mod.setList(slist);
		return mod;
	}

	//薪资发放
	public int addSalary(OtherMoney oth) {
		return dao.insertSalary(oth);
	}

}
