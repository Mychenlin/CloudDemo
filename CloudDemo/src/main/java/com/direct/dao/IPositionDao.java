package com.direct.dao;

import java.util.List;

import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;

public interface IPositionDao {
	
	//职位添加
	public int insertposition(PositionEntity p);
	
	//职位修改
	public int updateposition(PositionEntity p);
	
	//职位删除
	public int deleteposition(int Id);
	
	//职位查询
	public List<PositionEntity> querposition();
	
	//通过职位Id
	public List<PositionEntity> querByIdposition(int id);
	
	
	
	//分页职位
	public List<PositionEntity> querpagposition(PositionEntity p);
	
}
