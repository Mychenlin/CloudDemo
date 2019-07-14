package com.direct.dao;

import java.util.List;

import com.direct.entity.ApplicationEntity;

public interface IApplicationDao {
	public int addapp(ApplicationEntity app);
	
	public int updapp(ApplicationEntity app);
	
	
	public int delapp(int eid);
	
	public ApplicationEntity selectappById(int eid);
	
	
	
	public List<ApplicationEntity> selectappPage();
}
