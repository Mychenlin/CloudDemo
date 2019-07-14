package com.direct.service;

import java.util.List;

import com.direct.entity.LeaveRosterEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.StaffionEntity;

public interface ILeaveService {
	public int addtLeave(LeaveRosterEntity leave);//添加申请表
	public List<LeaveRosterEntity> queryLeave();//查询所有未审核的请假表信息
	public List<LeaveRosterEntity> queryByCheck();//查询所有已经审核过的请假表信息
	public int changeStatus(int status,int id);//修改请假表状态
}
