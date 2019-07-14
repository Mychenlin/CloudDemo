package com.direct.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.AttendanceDao;
import com.direct.dao.IStaffinfoDao;
import com.direct.entity.AttendanceEnity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.SalaryEnity;
import com.direct.entity.StaffionEntity;
import com.direct.service.AttendanceService;
import com.direct.service.IStaffinfoSelcise;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service("Staff")
public class StaffinfoSelcisse implements IStaffinfoSelcise{

	@Autowired
	public IStaffinfoDao istaffiondao;
	
	
	
	//添加
	@Override
	public int addstaffinfo(StaffionEntity s) {
		// TODO Auto-generated method stub
		return istaffiondao.insertStaff(s);
	}

	@Override
	public int updstaffinfo(StaffionEntity s) {
		// TODO Auto-generated method stub
		return istaffiondao.updateStaff(s);
	}
	


	@Override
	public int delposition(StaffionEntity s) {
		// TODO Auto-generated method stub
		return istaffiondao.deleteStaff(s);
	}



	@Override
	public StaffionEntity selByIdstaffinfo(int id) {
		// TODO Auto-generated method stub
		return istaffiondao.querByIdStaff(id);
	}
	//查询所有员工
		@Override
		public List<StaffionEntity> selstaffinfo() {
			// TODO Auto-generated method stub
			return istaffiondao.querStaff();
		}


	@Override
	public List<StaffionEntity> selByPIdstaffinfo(int id) {
		
		return istaffiondao.querByPIdStaffinfo(id);
	}

	//调岗
	@Override
	public int updStaffionByID(StaffionEntity s) {
		// TODO Auto-generated method stub
		return istaffiondao.updatestaffbyid(s);
	}



	//分页
	@Override
	public PageInfoEntity<StaffionEntity> querpageStaffinfo(int curr,int size,StaffionEntity s) {

		Page page=PageHelper.startPage(curr, size, true);
		List<StaffionEntity> list=istaffiondao.querpagStaff(s);
		int sumcur=(int)page.getTotal();

		PageInfoEntity<StaffionEntity> pa=new PageInfoEntity<StaffionEntity>();
		pa.setCurrePage(curr);
		pa.setList(list);
		pa.setSize(size);
		pa.setSumCount(sumcur);
		
		return pa;
	}

	@Override
	public List<StaffionEntity> querByPIdStaffinfo(int pId) {
		// TODO Auto-generated method stub
		return istaffiondao.querByPIdStaffinfo(pId);
	}

	@Override
	public StaffionEntity query(int sId) {
		// TODO Auto-generated method stub
		return istaffiondao.query(sId);
	}

	@Override
	public List<StaffionEntity> querysMony() {
		System.out.println("hello");
		return istaffiondao.queryMony();	
	}

	@Override
	public SalaryEnity selstaffinfo4(int sId, List<AttendanceEnity> at) {
		double merits=0;//绩效
		double subsidy=100;//补贴
		double askingLeave=0; //请假扣款
		double askingLate=0; //迟到扣款
		double askingUnpunched=0; //未打卡扣款
		double askingRetirement=0; //早退扣款
		double askingAbsenteeism=0; //旷工扣款
		double askingIndividual=0; //个税扣款
		double amountMoney=0; //应发金额
		double actualMOney=0;//实发金额
		double totalCompany=0;//公司总成本（五险一金)
		//考勤
		for(AttendanceEnity a:at){
				//员工Id
				System.out.println(sId+"sssssssss");
				System.out.println("员工Id:"+a.getStaffId().getsId()+"hhhhhhhh");
				//考勤Id
				System.out.println("考勤Id:"+a.getStatusId()+"hhhhhhhh");
				//请假
				if(a.getStatusId()==1){
					askingLeave+=100;
				}//早退
				if(a.getStatusId()==2){
					askingRetirement+=100;
				}
			}
		 
			StaffionEntity staff1 = at.get(0).getStaffId();
			//应发金额
			amountMoney=staff1.getsBasepay()+subsidy+merits+staff1.getsSocial();
			//实发金额
			actualMOney=(staff1.getsBasepay()+subsidy+merits+staff1.getsSocial())-(askingLeave+askingLate+askingUnpunched+askingRetirement+askingAbsenteeism+askingIndividual);
			System.out.println("应发金额:"+amountMoney);
			System.out.println("实发金额:"+actualMOney);
			
			if(amountMoney>=3000){
				double b=actualMOney;
				actualMOney=actualMOney*0.95;
				//公司总成本（五险一金)
				totalCompany=b-actualMOney;
			}
			System.out.println("公司总成本（五险一金):"+totalCompany);
			StaffionEntity sta =  istaffiondao.querStaff2(sId).get(0);
			SalaryEnity s=new SalaryEnity(merits, subsidy, askingLeave, askingLate, askingUnpunched, askingRetirement, askingAbsenteeism, askingIndividual, amountMoney, actualMOney, totalCompany, null, null, sta, null);	
			
			System.out.println(s.getTotalCompany()+"\t"+s.getActualMOney()+"\t"+s.getAmountMoney());
			//s.setStaId(sta);
			
			return s;
	}

	
	
	
	@Override
	public List<StaffionEntity> selstaffinfo3() {
		return istaffiondao.querStaff3();
	}

	@Override
	public List<StaffionEntity> selstaffinfo2(int sId) {
		// TODO Auto-generated method stub
		return istaffiondao.querStaff2(sId);
	}

	
	
	
	
}
