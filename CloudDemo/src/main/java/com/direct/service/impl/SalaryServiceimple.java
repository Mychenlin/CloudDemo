package com.direct.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.direct.dao.AttendanceDao;
import com.direct.dao.ISalarydao;
import com.direct.entity.AttendanceEnity;
import com.direct.entity.SalaryEnity;
import com.direct.entity.StaffionEntity;
import com.direct.service.AttendanceService;
import com.direct.service.SalaryService;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mysql.fabric.xmlrpc.base.Data;
@Service("salaryService")
public class SalaryServiceimple implements SalaryService {
	@Autowired
	private ISalarydao dao;
	@Autowired
	private AttendanceDao adao;
	
	
	//查询薪资
	//分页查看
	public PageModel<SalaryEnity> selectSalary(int curr,int size) {
		//初始化分页的当前页数和显示条数
		Page page = PageHelper.startPage(curr, size, true);
		//得到数据集合
		
		List<SalaryEnity> slist = dao.queryMoney();
		//得到总条数
		int count=(int)page.getTotal();
		//封装
		PageModel<SalaryEnity> mod=new PageModel<SalaryEnity>();
		mod.setCurrentPage(curr);//当前页
		mod.setSize(size);//显示条数
		mod.setSumCount(count);//总条数
		mod.setList(slist);
		return mod;
	}

	
	
	
	//薪资发放
	public int addSalary(SalaryEnity sa) {
		
		System.out.println("添加薪资");
		return dao.insertSalary(sa);

	}

	
	
	
	
	
	
	
	
	
	@Override
	public SalaryEnity queryByid(int sId) {
		// TODO Auto-generated method stub
		return dao.queryMoneyByid(sId);
	}

	

}
