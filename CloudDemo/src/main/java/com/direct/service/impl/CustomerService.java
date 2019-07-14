package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.ICustomerDao;
import com.direct.entity.ApplicationEntity;
import com.direct.entity.CustomerEntity;
import com.direct.service.ICustomerService;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
@Service("CustomerService")
public class CustomerService implements ICustomerService {
	
	@Autowired
	public ICustomerDao cudao;

	@Override
	public int changecus(CustomerEntity cus) {
		// TODO Auto-generated method stub
		String dz="";
		//拆分贯籍字符串
        String[] cusStrArray = cus.C_place.split(",");
        for (int i = 0; i < cusStrArray.length; i++) {
        	dz=dz+cusStrArray[i];
        }
        cus.setC_place(dz);
		return cudao.addcus(cus);
	}

	@Override
	public int removecus(int eid) {
		// TODO Auto-generated method stub
		return cudao.delcus(eid);
	}

	@Override
	public CustomerEntity querycusById(int eid) {
		// TODO Auto-generated method stub
		return cudao.selectcusById(eid);
	}
	

	public CustomerEntity selectApp(CustomerEntity app) {
		// TODO Auto-generated method stub
		return cudao.select(app);
	}
	
	
//x修改
	
	@Override
	public int updcus(CustomerEntity cus) {
		// TODO Auto-generated method stub
		
		return cudao.updcust(cus);
	}
	@Override
	public PageModel<CustomerEntity> querycusPage(int curr, int size) {
		Page page = PageHelper.startPage(curr, size, true);
		//得到数据集合
		List<CustomerEntity> elist = cudao.selectcusPage();
		//得到总条数
		int count = (int)page.getTotal();
		
		//封装cus
		PageModel<CustomerEntity> cus=new PageModel<CustomerEntity>();
		cus.setCurrentPage(curr);
		cus.setSize(size);
		cus.setSumCount(count);
		cus.setList(elist);
		return cus;
	}

}
