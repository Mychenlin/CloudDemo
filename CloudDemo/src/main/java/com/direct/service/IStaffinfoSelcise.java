package com.direct.service;

import java.util.List;

import com.direct.entity.AttendanceEnity;
import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.SalaryEnity;
import com.direct.entity.StaffionEntity;
import com.direct.util.PageModel;

public interface IStaffinfoSelcise {
	public StaffionEntity query(int sId);
	//添加员工
	public int addstaffinfo(StaffionEntity s);
	
	//修改员工
	public int updstaffinfo(StaffionEntity s);
	
	//删除员工
	public int delposition(StaffionEntity s);
	
	//查询员工
	public List<StaffionEntity>  selstaffinfo();
	
	//查询员工2
	public List<StaffionEntity>  selstaffinfo2(int sId);
	
	public SalaryEnity  selstaffinfo4(int sId,List<AttendanceEnity> at);
	
	//查询员工3
	public List<StaffionEntity>  selstaffinfo3();
	//通过Id查询员工
	public StaffionEntity selByIdstaffinfo(int id);
	
	//通过职位Id查询员工
	public List<StaffionEntity> selByPIdstaffinfo(int pId);
	
	//调岗
	public int updStaffionByID(StaffionEntity s);
	
	
	//分页员工
	public PageInfoEntity<StaffionEntity> querpageStaffinfo(int curr,int size,StaffionEntity s);


	//通过职位查询员工
	public List<StaffionEntity> querByPIdStaffinfo(int pId);
		
	//查询所有员工薪资发放
	public List<StaffionEntity> querysMony();
	
	
	
		
	
}
