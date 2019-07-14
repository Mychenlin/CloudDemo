package com.direct.service;

import java.util.List;

import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;

public interface IPositionSelcise {
	//添加职位
	public int addposition(PositionEntity p);
	
	//修改职位
	public int updposition(PositionEntity p);
	
	//删除职位
	public int delposition(int id);
	
	//查询职位
	public List<PositionEntity>  selposition();
	
	//通过Id查询职位
	public List<PositionEntity> selByIdposition(int id);
	
	
	//分页模糊查询
	public PageInfoEntity<PositionEntity> selpageposit(int curr,int size,PositionEntity p);

	
}
