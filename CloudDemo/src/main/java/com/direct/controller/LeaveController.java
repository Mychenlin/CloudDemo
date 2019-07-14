package com.direct.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.direct.entity.LeaveRosterEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.StaffionEntity;
import com.direct.service.impl.LeaveService;
import com.direct.service.impl.StaffinfoSelcisse;
import com.google.gson.Gson;
import com.sun.org.apache.xpath.internal.operations.Mod;

@Controller
@RequestMapping(value="/leaveC")
public class LeaveController { 
	@Autowired
	@Qualifier("leaveService")
	public LeaveService leaveService;
	
	@Autowired
	@Qualifier("Staff")
	public StaffinfoSelcisse  staffinfo;//调用员工查询的方法
	
	@InitBinder //初始化时间类型
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		CustomDateEditor cde=new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, cde);
	}
	public String getTime(){
		  Date date=new Date(); 
		  SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		  String time=formatter.format(date); 
		  System.out.println(time);
		  return time;
	}
	
	@RequestMapping(value="/showStaffinfo") //显示员工信息
	public void showStaffinfo(HttpServletResponse res) throws IOException{
		res.setCharacterEncoding("utf-8");//处理响应乱码
		List<StaffionEntity> staffinfolist = staffinfo.selstaffinfo();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(staffinfolist);
		//jsonStr = "{\"code\":0,\"msg\":\"\",\"count\":"+0+",\"data\":"+jsonStr+"}";
		res.getWriter().println(jsonStr); //响应数据
	}

	@RequestMapping(value="/addLeave") //请假申请表添加
	public void addLeave(LeaveRosterEntity leave,HttpServletResponse res) throws IOException{
		System.out.println("进入请假单申请页面");
		String time = getTime();//获取当前时间
		leave.setTime(time);//设置申请表的时间
		System.out.println("当前时间"+time);
		leave.setLeaveStatus(0);//设置请假表申请状态 默认为0（0未审核）
		//添加
	
		if(leaveService.addtLeave(leave)>0){//添加数据
			res.getWriter().println(1);//成功 相当于返回 
			
		}else{
			res.getWriter().println(0);
		}
	
	}
	
	@RequestMapping(value="/showLeave") //显示未审核请假名单
	public void showLeave(HttpServletResponse res) throws IOException{
		List<LeaveRosterEntity> list= leaveService.queryLeave();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
//		for(LeaveRosterEntity s:list){
//			System.out.println(s.getName());
//		}
		res.setCharacterEncoding("utf-8");
		jsonStr="{\"code\":0,\"msg\":\"\",\"count\":"+0+",\"data\":"+jsonStr+"}";
		res.getWriter().println(jsonStr);//响应的事list集合
		
	}
	@RequestMapping(value="updateStatus") //修改请假状态
	public void updateStatus(int id, int status,HttpServletResponse res) throws IOException{
		 int i = leaveService.changeStatus(status, id);
		 if(i>0){
			 res.getWriter().print(1);
		 }else{
			 res.getWriter().print(0);
		 }
		System.out.println("id:"+id+"\t"+"status"+status);
	}
	
	@RequestMapping(value="/showAudit") //查询请假申请已经审核过的的人
	public void showAudit(HttpServletResponse res) throws IOException{
		List<LeaveRosterEntity> list = leaveService.queryByCheck();
		Gson gson = new Gson();
		String josnStr = gson.toJson(list);
		System.out.println("josnStr:"+josnStr);
		josnStr = "{\"code\":0,\"msg\":\"\",\"count\":"+0+",\"data\":"+josnStr+"}";
		res.setCharacterEncoding("utf-8");
		res.getWriter().print(josnStr);
	
	}
	
}
