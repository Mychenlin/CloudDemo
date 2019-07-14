package com.direct.service;

import java.util.List;

import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;

public interface IBranchSelcise {
	//添加部门
	public int addbranch(BranchEntity b);
	
	//修改部门
	public int updbranch(BranchEntity b);
	
	//删除部门
	public int delbranch(int id);
	
	//查询部门
	public List<BranchEntity>  selbranch();
	
	//通过Id查询部门
	public BranchEntity selByIdbranch(int id);
	
	//分页部门
	public PageInfoEntity<BranchEntity> selpageBach(int curr,int size,BranchEntity b);
	
}
