package com.direct.service;

import java.util.List;

import com.direct.entity.BranchEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.RecruitmentEntity;
import com.direct.util.PageModel;

public interface IRecruitmentService {
	public int changerec(RecruitmentEntity rec);
	
	public int removerec(int eid);
	
	public RecruitmentEntity queryrecById(int eid);
	
	public int upd(RecruitmentEntity rec);
	public PageModel<RecruitmentEntity> queryrecPage(int curr,int size);
	//查询部门
	public List<BranchEntity> queryb();
	public List<PositionEntity> queryp();
	//根据id查询职位
	public List<PositionEntity> querypost(int id);
}
