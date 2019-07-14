package com.direct.service;

import com.direct.entity.ApplicationEntity;
import com.direct.entity.AppointmentEntity;
import com.direct.util.PageModel;


public interface IAppointmentService {
	public int changeapp(AppointmentEntity app);
	
	public int removeapp(int eid);
	
	public AppointmentEntity queryappById(int eid);
	
	public int updAppment(AppointmentEntity ment);
	
	
	public PageModel<AppointmentEntity> queryappPage(int curr,int size);
}
