package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.IBranchDao;
import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.service.IBranchSelcise;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service("branchs")
public class BranchSelcise implements IBranchSelcise {

	@Autowired
	public IBranchDao ibranchdao;

	@Override
	public int addbranch(BranchEntity b) {
		// TODO Auto-generated method stub
		return ibranchdao.insertbranch(b);
	}

	@Override
	public int updbranch(BranchEntity b) {
		// TODO Auto-generated method stub
		return ibranchdao.updatebranch(b);
	}

	@Override
	public int delbranch(int id) {
		// TODO Auto-generated method stub
		return ibranchdao.deletebranch(id);
	}

	@Override
	public List<BranchEntity> selbranch() {
		// TODO Auto-generated method stub
		return ibranchdao.querbranch();
	}

	@Override
	public BranchEntity selByIdbranch(int id) {
		// TODO Auto-generated method stub
		return ibranchdao.querByIdbranch(id);
	}

	//分页
	@Override
	public PageInfoEntity<BranchEntity> selpageBach(int curr, int size,BranchEntity b) {
		
		Page page=PageHelper.startPage(curr, size,true);
		List<BranchEntity> list=ibranchdao.querpagebranch(b);
		int sumCurr=(int)page.getTotal();
		
		PageInfoEntity<BranchEntity> p=new PageInfoEntity<BranchEntity>();
		p.setList(list);
		p.setCurrePage(curr);
		p.setSize(size);
		p.setSumCount(sumCurr);
		
		return p ;
	}
	
	
}
