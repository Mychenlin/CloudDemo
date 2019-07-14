package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.AttendanceDao;
import com.direct.entity.AttendanceEnity;
import com.direct.service.AttendanceService;
@Service("AttService")
public class AttendanceServiceImpl implements AttendanceService {
	@Autowired
	private AttendanceDao dao;
	
	//查询员工考勤信息
	@Override
	public List<AttendanceEnity> query(int sId) {
		System.out.println("你好"+sId);
		return dao.query(sId);
	}

}
