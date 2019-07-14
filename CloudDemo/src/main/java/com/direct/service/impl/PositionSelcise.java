package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.IPositionDao;
import com.direct.dao.IStaffinfoDao;
import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;
import com.direct.service.IPositionSelcise;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service("positions")
public class PositionSelcise implements IPositionSelcise {

	@Autowired
	public IPositionDao ipositiondao ;

	@Override
	public int addposition(PositionEntity p) {
		// TODO Auto-generated method stub
		return ipositiondao.insertposition(p);
	}

	@Override
	public int updposition(PositionEntity p) {
		// TODO Auto-generated method stub
		return ipositiondao.updateposition(p);
	}

	@Override
	public int delposition(int id) {
		// TODO Auto-generated method stub
		return ipositiondao.deleteposition(id);
	}

	@Override
	public List<PositionEntity> selposition() {
		// TODO Auto-generated method stub
		return ipositiondao.querposition();
	}

	@Override
	public List<PositionEntity> selByIdposition(int id) {
		// TODO Auto-generated method stub
		return ipositiondao.querByIdposition(id);
	}

	@Override
	public PageInfoEntity<PositionEntity> selpageposit(int curr, int size,
			PositionEntity p) {
		Page page=PageHelper.startPage(curr, size, true);
		  List<PositionEntity> list=ipositiondao.querpagposition(p);
		  int sumcur=(int)page.getTotal();
		  
		PageInfoEntity<PositionEntity> pa=new PageInfoEntity<PositionEntity>();
		pa.setCurrePage(curr);
		pa.setList(list);
		pa.setSize(size);
		pa.setSumCount(sumcur);
		  
		return pa;
	}

	
	

}
