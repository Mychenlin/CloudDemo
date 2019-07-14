package com.direct.dao;

import java.util.List;

import com.direct.entity.BranchEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.StaffionEntity;

public interface IZhiYuanDao {
	//资源回收

	//部门回收
	public int updatebrete(int id);
	
	//职位回收
	public int updatepostion(int id);
	
	//员工回收
	public int updatestaff(int id);
	
	
	
	//部门查询
	public List<BranchEntity> selectbra(BranchEntity b);
	
	//职位查询
	public List<PositionEntity>  selectpos(PositionEntity b);
	
	//员工查询
	public List<StaffionEntity> selecsta(StaffionEntity b);
	
}
