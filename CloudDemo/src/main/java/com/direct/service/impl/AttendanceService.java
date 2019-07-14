package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.AttendanceDao;
import com.direct.entity.AttendanceEnity;
import com.direct.service.IAttendanceService;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
@Service("attendance")
public class AttendanceService implements IAttendanceService{
	@Autowired
	public AttendanceDao attendanceDao;
	@Autowired
	public AttendanceDao iAttendanceDao;

	

	@Override
	public PageModel<AttendanceEnity> queryAll(int curr, int size) {
		// TODO Auto-generated method stub
		//初始化分页的当前页数和显示条数
		Page page = PageHelper.startPage(curr, size, true);
		List<AttendanceEnity> list = attendanceDao.selectAll();//获取list
		//得到总条数
		int count = (int) page.getTotal(); 
		//封装pagemodel
		PageModel<AttendanceEnity> model =  new PageModel<>();
		model.setCurrentPage(count);//设置总页数
		model.setSize(size);//显示条数
		model.setSumCount(count);//设置总条数
		model.setList(list);//给他一个list
		return model;
	}


	@Override
	public List<AttendanceEnity> queryById(String sid, String time) {
		// TODO Auto-generated method stub
		return attendanceDao.selectById(sid, time);
	}


	

}
