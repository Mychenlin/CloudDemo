package com.direct.service;

import com.direct.entity.ApplicationEntity;
import com.direct.entity.CustomerEntity;
import com.direct.util.PageModel;

public interface ICustomerService {
	public int changecus(CustomerEntity cus);//添加
	
	public int removecus(int eid);//删除
	
	public CustomerEntity querycusById(int eid);//根据id查询
	
	public int updcus(CustomerEntity cus);
	
	public CustomerEntity selectApp(CustomerEntity cus);
	
	public PageModel<CustomerEntity> querycusPage(int curr,int size);//查询分页
}
