package com.direct.dao;

import java.util.List;

import com.direct.entity.AppointmentEntity;


public interface IAppointmentDao {
	public int addment(AppointmentEntity ment);
	
	public int updment(AppointmentEntity ment);
	
	
	public int delment(int eid);
	
	public AppointmentEntity selectmentById(int eid);
	
	public List<AppointmentEntity> selectmentPage();
}
