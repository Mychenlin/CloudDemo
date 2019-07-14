package com.direct.service;

import java.util.List;

import com.direct.entity.OtherMoney;
import com.direct.util.PageModel;

public interface OthermoneyService {
	//查询
	public PageModel<OtherMoney> selectSalary(int curr,int size);//业务方法(不只是返回数据集合)
	//薪资发放
	public int addSalary(OtherMoney oth);
}
