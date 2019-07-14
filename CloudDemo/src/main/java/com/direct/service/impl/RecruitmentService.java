package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.IRecruitmentDao;
import com.direct.entity.BranchEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.RecruitmentEntity;
import com.direct.service.IRecruitmentService;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
@Service("RecruitmentService")
public class RecruitmentService implements IRecruitmentService {

	@Autowired
	public IRecruitmentDao recdao;
	public int changerec(RecruitmentEntity rec) {
		// TODO Auto-generated method stub
		return recdao.addrec(rec);
	}
	
	//修改
	public int upd(RecruitmentEntity rec) {
		// TODO Auto-generated method stub
		return recdao.updrec(rec);
	}

	@Override
	public int removerec(int eid) {
		// TODO Auto-generated method stub
		return recdao.delrec(eid);
	}

	@Override
	public RecruitmentEntity queryrecById(int eid) {
		// TODO Auto-generated method stub
		return recdao.selectrecById(eid);
	}
	
	@Override
	public List<PositionEntity> querypost(int id) {
		// TODO Auto-generated method stub
		return recdao.selectpostById(id);
	}
	@Override
	public List<BranchEntity> queryb() {
		// TODO Auto-generated method stubPositionEntity
		return recdao.select();
	}
	@Override
	public List<PositionEntity> queryp() {
		// TODO Auto-generated method stub
		return recdao.selectp();
	}
	@Override
	public PageModel<RecruitmentEntity> queryrecPage(int curr, int size) {
		Page page = PageHelper.startPage(curr, size, true);
		//得到数据集合
		List<RecruitmentEntity> elist = recdao.selectrecPage();
		//得到总条数
		int count = (int)page.getTotal();
		
		//封装app
		PageModel<RecruitmentEntity> rec=new PageModel<RecruitmentEntity>();
		rec.setCurrentPage(curr);
		rec.setSize(size);
		rec.setSumCount(count);
		rec.setList(elist);
		return  rec;
	}

}
