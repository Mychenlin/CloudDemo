package com.direct.dao;

import java.util.List;

import com.direct.entity.ApplicationEntity;
import com.direct.entity.CustomerEntity;


public interface ICustomerDao {
	public int addcus(CustomerEntity cus);
	
	public int updcust(CustomerEntity cus);
	
	
	public int delcus(int eid);
	
	public CustomerEntity selectcusById(int eid);
	
	
	public CustomerEntity select(CustomerEntity app);
	
	public List<CustomerEntity> selectcusPage();
}
