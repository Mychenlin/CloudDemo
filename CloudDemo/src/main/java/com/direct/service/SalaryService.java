package com.direct.service;

import java.util.List;

import com.direct.entity.AttendanceEnity;
import com.direct.entity.SalaryEnity;
import com.direct.entity.StaffionEntity;
import com.direct.util.PageModel;

public interface SalaryService {
	//查询
	public PageModel<SalaryEnity> selectSalary(int curr,int size);//业务方法(不只是返回数据集合)
	
	public SalaryEnity queryByid(int sId);
	//薪资发放
	public int addSalary(SalaryEnity sa);
	
}
