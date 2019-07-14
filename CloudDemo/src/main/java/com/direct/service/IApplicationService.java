package com.direct.service;

import java.util.List;

import com.direct.entity.ApplicationEntity;
import com.direct.util.PageModel;
public interface IApplicationService {
	public int addApp(ApplicationEntity App);
	
	public int updApp(ApplicationEntity App);
	
	public int updblu(ApplicationEntity App);
	
	public int delApp(int eid);
	
	public ApplicationEntity selectAppById(int eid);
	
	
	
	public PageModel<ApplicationEntity> selectAppPage(int curr,int size);
}
