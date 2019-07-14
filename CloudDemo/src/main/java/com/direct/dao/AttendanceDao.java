package com.direct.dao;

import java.util.List;

import com.direct.entity.AttendanceEnity;

public interface AttendanceDao {
	public List<AttendanceEnity> query(int sId);
	public List<AttendanceEnity> selectAll();
	
	// 查询考勤表
	public List<AttendanceEnity> selectById(String sid,String time);
}
