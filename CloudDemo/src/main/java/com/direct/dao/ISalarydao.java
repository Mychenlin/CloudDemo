package com.direct.dao;

import java.util.List;

import com.direct.entity.SalaryEnity;
import com.direct.entity.StaffionEntity;

public interface ISalarydao {
	
	//查询
	public List<SalaryEnity> queryMoney();
	//薪资发放
	public int insertSalary(SalaryEnity sa);
	
	//查询
	public SalaryEnity queryMoneyByid(int sId);
	
}
