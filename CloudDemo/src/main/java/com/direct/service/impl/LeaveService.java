package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.ILeaveDao;
import com.direct.entity.LeaveRosterEntity;
import com.direct.service.ILeaveService;

@Service("leaveService")
public class LeaveService implements ILeaveService{
	
	@Autowired
	public ILeaveDao leaveDao;
	
	@Override
	public int addtLeave(LeaveRosterEntity leave) {
		// TODO Auto-generated method stub
		return leaveDao.insertLeave(leave);
	}

	@Override
	public List<LeaveRosterEntity> queryLeave() {
		// TODO Auto-generated method stub
		return leaveDao.selectLeave();
	}

	@Override
	public List<LeaveRosterEntity> queryByCheck() {
		// TODO Auto-generated method stub
		return leaveDao.selectLeaveByCheck();
	}

	@Override
	public int changeStatus(int status, int id) {
		// TODO Auto-generated method stub
		return leaveDao.updateStatus(status, id);
	}

}
