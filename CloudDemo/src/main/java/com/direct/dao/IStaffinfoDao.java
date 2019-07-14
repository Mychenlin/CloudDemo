package com.direct.dao;

import java.util.List;

import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.SalaryEnity;
import com.direct.entity.StaffionEntity;

public interface IStaffinfoDao {
	public StaffionEntity query(int sId);
	
	//员工添加
	public int insertStaff(StaffionEntity s);
	
	//员工修改
	public int updateStaff(StaffionEntity s);
	
	//员工删除
	public int deleteStaff(StaffionEntity s);
	
	//员工查询
	public List<StaffionEntity> querStaff();
	//员工查询
	public List<StaffionEntity> querStaff2(int sId);
	//出纳人
	public List<StaffionEntity> querStaff3();
	//通过员工Id
	public StaffionEntity querByIdStaff(int id);
	
	//通过职位查询员工
	public List<StaffionEntity> querByPIdStaffinfo(int pId);
	
	//分页员工
	public List<StaffionEntity> querpagStaff(StaffionEntity s);
	
	
	//调岗
	public int updatestaffbyid(StaffionEntity s);
	
	
	//查询所有员工薪资发放
	public List<StaffionEntity> queryMony();
}
