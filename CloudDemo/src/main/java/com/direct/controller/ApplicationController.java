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
import com.direct.entity.PositionEntity;
import com.direct.entity.RecruitmentEntity;
import com.direct.entity.StaffionEntity;
import com.direct.service.IApplicationService;
import com.direct.service.IStaffinfoSelcise;
import com.direct.util.PageModel;
import com.google.gson.Gson;
@Controller
@RequestMapping(value="/appli")
public class ApplicationController {
	@Autowired
	@Qualifier("ApplicationService")
	public IApplicationService Application;
	
	@Autowired
	@Qualifier("Staff")
	public IStaffinfoSelcise Istaffs;
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor cde=new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, cde);
	}
	
	public String datetime(Date d){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(d);
		System.out.println(dateString);
		
		   return dateString;
	}
	
	//查询显示
		@RequestMapping(value="/show")
		public void showapp(HttpServletRequest req,HttpServletResponse res) throws IOException{
			System.out.println("访问app");
			req.setCharacterEncoding("utf-8");
			res.setCharacterEncoding("utf-8");
			//分页显示:接收当前页
			int curr = req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page"));
			int size = req.getParameter("limit")==null?5:Integer.parseInt(req.getParameter("limit"));
			
			String pageNo = req.getParameter("pageNo");//页面点击翻页时传递的当前页参数
			if(pageNo!=null && !"".equals(pageNo)){
				curr = Integer.parseInt(pageNo);
			}
			PageModel<ApplicationEntity> app = Application.selectAppPage(curr, size);
			List list=app.getList();
			Gson g=new Gson();
			String json=g.toJson(list);
			json="{\"code\":0,\"msg\":\"\",\"count\":"+app.getList().size()+",\"data\":"+json+"}";
			res.getWriter().print(json);
		}
		
		//修改应聘状态
		@RequestMapping(value="/updapp")
		public void upd(HttpServletRequest req,ApplicationEntity app,HttpServletResponse res) throws IOException{
			req.setCharacterEncoding("utf-8");
			res.setCharacterEncoding("utf-8");
			int tount=Application.updApp(app);
			
			//添加到员工中去
			
			StaffionEntity sta=new StaffionEntity();
			sta.setsName(app.getA_name());
			sta.setsIP(app.getA_phone());
			sta.setsPassword("123456");
			sta.setsSex(app.getA_sex());
			sta.setsBirthdate(app.getA_birthday());
			sta.setsPosId(app.getA_postss());
			sta.setsBasepay(3000);
			sta.setsSocial(0);
			String dat=this.datetime(new Date());
			sta.setsEntrytime(dat);
			int b=Istaffs.addstaffinfo(sta);
			res.getWriter().print(tount);
		}
		@RequestMapping(value="/updblu")
		public void updblu(HttpServletRequest req,ApplicationEntity app,HttpServletResponse res) throws IOException{
			req.setCharacterEncoding("utf-8");
			res.setCharacterEncoding("utf-8");
			int tount=Application.updblu(app);
			res.getWriter().print(tount);
		}
		
		
		//添加应聘
		@RequestMapping(value="/add")
		public void add(HttpServletRequest req,ApplicationEntity app,HttpServletResponse res) throws IOException{
		
			int tount=Application.addApp(app);
			res.getWriter().print(tount);
		}
		
		
}
