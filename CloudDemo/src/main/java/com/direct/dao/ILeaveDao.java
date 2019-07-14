
package com.direct.dao;

import java.util.List;


import com.direct.entity.LeaveRosterEntity;
import com.direct.entity.StaffionEntity;

public interface ILeaveDao {
	public int insertLeave(LeaveRosterEntity leave);
	public List<LeaveRosterEntity> selectLeave();//查询所有未审核的请假表信息
	public List<LeaveRosterEntity> selectLeaveByCheck();//查询所有已经审核过的请假表信息
	public int updateStatus(int status,int id);//修改请假表状态
	//分页请假表
	
}

