package com.direct.service;

import java.util.List;

import com.direct.entity.AttendanceEnity;
import com.direct.util.PageModel;

public interface IAttendanceService {
	//有分页
	public PageModel<AttendanceEnity> queryAll(int curr,int size);//查询所有的考勤打卡表
	
	//查询考勤信息 打卡
	public List<AttendanceEnity> queryById(String sid,String time);
}
