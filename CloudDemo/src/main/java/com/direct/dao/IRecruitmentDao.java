package com.direct.dao;

import java.util.List;

import com.direct.entity.BranchEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.RecruitmentEntity;

public interface IRecruitmentDao {
	public int addrec(RecruitmentEntity rec);
	
	public int updrec(RecruitmentEntity rec);
	
	
	public int delrec(int eid);
	
	public RecruitmentEntity selectrecById(int eid);
	
	public List<RecruitmentEntity> selectrecPage();
	//查询部门
	public List<BranchEntity> select();
	//查询职位
	public List<PositionEntity> selectp();
	//查询职位
	public List<PositionEntity> selectpostById(int eid);
}
