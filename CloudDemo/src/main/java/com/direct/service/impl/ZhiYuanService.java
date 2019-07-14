package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.IZhiYuanDao;
import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.StaffionEntity;
import com.direct.service.IZhiYuanService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service("ZhiYuanService")
public class ZhiYuanService implements IZhiYuanService{

	@Autowired
	public IZhiYuanDao izhiyuan;
	
	@Override
	public int updatebrete(int id) {
		// TODO Auto-generated method stub
		return izhiyuan.updatebrete(id);
	}

	@Override
	public int updatepostion(int id) {
		// TODO Auto-generated method stub
		return izhiyuan.updatepostion(id);
	}

	@Override
	public int updatestaff(int id) {
		// TODO Auto-generated method stub
		return izhiyuan.updatestaff(id);
	}

	@Override
	public PageInfoEntity<BranchEntity> selectbra(int curr, int size,BranchEntity b) {
		
		Page page=PageHelper.startPage(curr, size,true);
		List<BranchEntity> list=izhiyuan.selectbra(b);
		int sumCurr=(int)page.getTotal();
		
		PageInfoEntity<BranchEntity> p=new PageInfoEntity<BranchEntity>();
		p.setList(list);
		p.setCurrePage(curr);
		p.setSize(size);
		p.setSumCount(sumCurr);
		
		return p ;
	}

	@Override
	public PageInfoEntity<PositionEntity> selectpos(int curr, int size,PositionEntity b) {

		Page page=PageHelper.startPage(curr, size,true);
		List<PositionEntity> list=izhiyuan.selectpos(b);
		int sumCurr=(int)page.getTotal();
		
		PageInfoEntity<PositionEntity> p=new PageInfoEntity<PositionEntity>();
		p.setList(list);
		p.setCurrePage(curr);
		p.setSize(size);
		p.setSumCount(sumCurr);
		
		return p ;
	}

	@Override
	public PageInfoEntity<StaffionEntity> selecsta(int curr, int size,StaffionEntity b) {

		Page page=PageHelper.startPage(curr, size,true);
		List<StaffionEntity> list=izhiyuan.selecsta(b);
		int sumCurr=(int)page.getTotal();
		
		PageInfoEntity<StaffionEntity> p=new PageInfoEntity<StaffionEntity>();
		p.setList(list);
		p.setCurrePage(curr);
		p.setSize(size);
		p.setSumCount(sumCurr);
		
		return p ;
		
	}


}
