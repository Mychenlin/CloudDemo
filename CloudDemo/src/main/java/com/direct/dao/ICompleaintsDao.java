package com.direct.dao;

import java.util.List;

import com.direct.entity.CompleaintsEntity;

public interface ICompleaintsDao {
	//添加意见投诉
	public int insetComplea(CompleaintsEntity co);
	
	//查看投诉意见
	public List<CompleaintsEntity> selectCompleain();
	
	//删除投诉意见
	public int deleteComplea(int id);
	
	//后台添加意见投诉
	public int insertcom(CompleaintsEntity co);
	
	
}
