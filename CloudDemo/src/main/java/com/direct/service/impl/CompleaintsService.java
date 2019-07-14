package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.ICompleaintsDao;
import com.direct.entity.BranchEntity;
import com.direct.entity.CompleaintsEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.service.ICompleaintsService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service(value="CompleaintsService")
public class CompleaintsService implements ICompleaintsService {

	@Autowired
	public ICompleaintsDao icompleaindao;
	
	//添加意见
	@Override
	public int insetComplea(CompleaintsEntity co) {
		// TODO Auto-generated method stub
		return icompleaindao.insetComplea(co);
	}

	@Override
	public PageInfoEntity<CompleaintsEntity> selectCompleain(int curr,int size) {
		// TODO Auto-generated method stub
		
		Page page=PageHelper.startPage(curr, size,true);
		List<CompleaintsEntity> list=icompleaindao.selectCompleain();
		int sumCurr=(int)page.getTotal();
		
		PageInfoEntity<CompleaintsEntity> p=new PageInfoEntity<CompleaintsEntity>();
		p.setList(list);
		p.setCurrePage(curr);
		p.setSize(size);
		p.setSumCount(sumCurr);
		
		return p;
	}

	@Override
	public int deleteComplea(int id) {
		// TODO Auto-generated method stub
		return icompleaindao.deleteComplea(id);
	}

	@Override
	public int insertcom(CompleaintsEntity co) {
		// TODO Auto-generated method stub
		return icompleaindao.insertcom(co);
	}

}
