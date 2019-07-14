package com.direct.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.direct.entity.ApplicationEntity;
import com.direct.entity.AppointmentEntity;
import com.direct.entity.CustomerEntity;
import com.direct.service.IApplicationService;
import com.direct.service.IAppointmentService;
import com.direct.service.ICustomerService;
import com.direct.util.PageModel;
import com.google.gson.Gson;
@Controller
@RequestMapping(value="/appo")
public class AppointmentController {

	@Autowired
	@Qualifier("AppointmentService")
	public IAppointmentService Appointment;
	
	@Autowired
	@Qualifier("CustomerService")
	public ICustomerService Customer;
	@InitBinder
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor cde=new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, cde);
	}
	
	
	//查询显示
	@RequestMapping(value="/show")
	public void showcus(HttpServletRequest req,HttpServletResponse res) throws IOException{
		System.out.println("访问cus");
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		//分页显示:接收当前页
		int curr = req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page"));
		int size = req.getParameter("limit")==null?5:Integer.parseInt(req.getParameter("limit"));
		
		String pageNo = req.getParameter("pageNo");//页面点击翻页时传递的当前页参数
		if(pageNo!=null && !"".equals(pageNo)){
			curr = Integer.parseInt(pageNo);
		}
		System.out.println("显示curr"+curr);
		PageModel<AppointmentEntity> cus = Appointment.queryappPage(curr, size);
		List list=cus.getList();
		Gson g=new Gson();
		System.out.println("显示curr大小"+cus.getSize());
		String json=g.toJson(list);
		System.out.println("显示"+json);
		json="{\"code\":0,\"msg\":\"\",\"count\":"+cus.getSize()+",\"data\":"+json+"}";
		System.out.println("显示json"+json);
		res.getWriter().print(json);
	}
	
	
	//添加预约
	@RequestMapping(value="/add")
	public void add(HttpServletRequest req,AppointmentEntity appoi,HttpServletResponse res) throws IOException{
		int  tount=0;
		System.out.println("显示add");
		CustomerEntity app=new CustomerEntity();
		app.setC_name(appoi.C_info.C_name);
		System.out.println(appoi.C_info.C_name);
		CustomerEntity que=Customer.selectApp(app);
		
		System.out.println("查询："+que);
		if(que==null){
			app.setC_phone(appoi.C_info.C_phone);
			app.setC_Email(appoi.C_info.C_Email);
			app.setC_place(appoi.C_info.C_place);
			app.setC_Models(appoi.C_info.C_Models);
			int cus=Customer.changecus(app);
			if(cus>0){
				CustomerEntity que1=Customer.selectApp(app);
				System.out.println("查询："+que1.C_Id);
				appoi.C_info.C_Id=que1.C_Id;
				tount=Appointment.changeapp(appoi);
			}
			
		}else{
			CustomerEntity que1=Customer.selectApp(app);
			
			appoi.C_info.C_Id=que1.C_Id;
			 tount=Appointment.changeapp(appoi);
		}
		
		System.out.println("显示add"+tount);
		res.getWriter().print(tount);
	}
		
	
	
	@RequestMapping(value="/upd")
	public void updblu(HttpServletRequest req,AppointmentEntity app,HttpServletResponse res) throws IOException{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		app.setA_Id(Integer.parseInt(req.getParameter("a_Id")));
		
		System.out.println(app.a_Id);
		int tount=Appointment.updAppment(app);
		System.out.println("显示upd"+tount);
		res.getWriter().print(tount);
	}
	
	//删除
	@RequestMapping(value="/del")
	public void del(HttpServletRequest req,AppointmentEntity app,HttpServletResponse res) throws IOException{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		System.out.println("显示del");
		int tount=Appointment.removeapp(Integer.parseInt(req.getParameter("id")));
		res.getWriter().print(tount);
	}
}
