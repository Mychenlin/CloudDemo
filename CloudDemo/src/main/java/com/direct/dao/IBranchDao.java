package com.direct.dao;

import java.util.List;

import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;

public interface IBranchDao {
	
	//部门添加
	public int insertbranch(BranchEntity b);
	
	//部门修改
	public int updatebranch(BranchEntity b);
	
	//部门删除
	public int deletebranch(int id);
	
	//部门查询
	public List<BranchEntity> querbranch();
	
	//通过部门Id
	public BranchEntity querByIdbranch(int id);
	
	//分页部门
	public List<BranchEntity> querpagebranch(BranchEntity bz);
	
}
