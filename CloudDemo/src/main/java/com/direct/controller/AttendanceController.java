package com.direct.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.jsqlparser.expression.DateTimeLiteralExpression.DateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.direct.entity.AttendanceEnity;
import com.direct.entity.StaffionEntity;
import com.direct.service.impl.AttendanceService;
import com.direct.service.impl.StaffinfoSelcisse;
import com.direct.util.PageModel;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/attC")
public class AttendanceController {
	@Autowired
	@Qualifier("attendance")
	public AttendanceService attend;
	
	@Autowired
	@Qualifier("Staff")
	public StaffinfoSelcisse  staffinfo;//调用员工查询的方法
	
	@RequestMapping(value="showAtt")//显示考勤信息 注意 有分页
	public void showAtt(HttpServletResponse res,int page,int limit) throws IOException{
		// page当前页数  limit当前页数显示条数
		res.setCharacterEncoding("utf-8");
		PageModel<AttendanceEnity> model = attend.queryAll(page, limit);
		Gson gson = new Gson();
		List<AttendanceEnity>list=  model.getList();
		int sumcount = model.getSumCount();
		System.out.println("总条数:"+model.getSumCount());
		for(AttendanceEnity s:list){
			System.out.println("员工姓名："+s.getStaffId().getsName());
		}
		String jsonStr = gson.toJson(list); //将list转换为json
		// layui分页的json格式
		jsonStr="{\"code\":0,\"msg\":\"\",\"count\":"+sumcount+",\"data\":"+jsonStr+"}";
		res.getWriter().print(jsonStr);
	}
	
	@RequestMapping(value="/showStaffinfo") //显示员工信息
	public void showStaffinfo(HttpServletResponse res) throws IOException{
		res.setCharacterEncoding("utf-8");//处理响应乱码
		List<StaffionEntity> staffinfolist = staffinfo.selstaffinfo();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(staffinfolist);
		jsonStr="{\"code\":0,\"msg\":\"\",\"count\":"+0+",\"data\":"+jsonStr+"}";
		
		res.getWriter().println(jsonStr); //响应数据
		
	}
	
	//获取当前日期
	public String getTime(){
		  Date date=new Date(); 
		  SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd"); 
		  String time=formatter.format(date); 
		  System.out.println(time);
		  return time;
	}
	//获取当前日式时分秒
	public String getTime1(){
		  Date date=new Date(); 
		  SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		  String time=formatter.format(date); 
		  System.out.println(time);
		  return time;
	}
	
	@RequestMapping(value="daKa")//显示考勤信息 注意 有分页
	public void daKa(HttpServletResponse res,int id) throws IOException, ParseException{
		// page当前页数  limit当前页数显示条数
		System.out.println("员工：id"+id);
		String sid =String.valueOf(id);
		String time = "2019-06-12";//考勤日期
		String time1 = time+" "+"08:00:00";//当前上班打卡
		String time2 = time+" "+"17:00:00";//当前下班打卡
		String time3 = this.getTime1();//当前时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateTime1 = sdf.parse(time1);//下班时间
		Date dateTime2 = sdf.parse(time2);//下班时间
		Date dateTime3 = sdf.parse(time3);//当前时间
		
		
		System.out.println("sid:"+sid+"time:"+time);
		List<AttendanceEnity> list =  attend.queryById(sid, time);
		Gson gson = new Gson();
		
		String jsonStr = gson.toJson(list);
		System.out.println("查询出来的值为"+jsonStr);
	}
	
	
	@RequestMapping(value="daKa1")//打上班卡
	public void daKa1(HttpServletResponse res,int id) throws IOException, ParseException{
		// page当前页数  limit当前页数显示条数
		String time = this.getTime();//考勤日期
		String time1 = time+" "+"08:00:00";//当前上班打卡时间
		String time2 = time+" "+"17:00:00";//下班打卡时间
		//如何把String转为Date Stirng格式yyyy-MM-dd HH:mm:ss
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateTime = sdf.parse(time1);//上班时间
		//获取系统当前时间
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		 Date date = df.parse(df.format(new Date())); //获取当前时间
		 if(dateTime.after(date)){
			 res.getWriter().print(1);
		 }else{
			 res.getWriter().print(0);
		 }
			 
	}

	
	@RequestMapping(value="daKa2")//打上班卡
	public void daKa2(HttpServletResponse res,int id) throws IOException, ParseException{
		// page当前页数  limit当前页数显示条数
		String time = this.getTime();//考勤日期
		String time1 = time+" "+"08:00:00";//当前上班打卡时间
		String time2 = time+" "+"17:00:00";//下班打卡时间
		//如何把String转为Date Stirng格式yyyy-MM-dd HH:mm:ss
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateTime = sdf.parse(time2);//下班时间
		//获取系统当前时间
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		 Date date = df.parse(df.format(new Date())); //获取当前时间
		 if(dateTime.after(date)){
			 res.getWriter().print(0);//下班相反
		 }else{
			 res.getWriter().print(1);
		 }
			 
	}
}
