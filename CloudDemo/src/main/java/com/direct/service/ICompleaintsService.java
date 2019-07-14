package com.direct.service;


import com.direct.entity.CompleaintsEntity;
import com.direct.entity.PageInfoEntity;

public interface ICompleaintsService {
	
		//添加意见投诉
		public int insetComplea(CompleaintsEntity co);
		
		//查看投诉意见
		public PageInfoEntity<CompleaintsEntity> selectCompleain(int curr,int size);
		
		//删除投诉意见
		public int deleteComplea(int id);
		
		//后台添加意见投诉
		public int insertcom(CompleaintsEntity co);
		
}
