package com.direct.dao;

import java.util.List;

import com.direct.entity.OtherMoney;


public interface OthermoneyDao {
	//查询
	public List<OtherMoney> queryMoney();
	//其他薪资发放
	public int insertSalary(OtherMoney oth);
	
	
	
	
}
