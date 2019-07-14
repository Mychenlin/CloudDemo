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

import com.direct.entity.PageInfoEntity;
import com.direct.entity.RepyEntity;
import com.direct.entity.ReservationSMSEntiry;
import com.direct.service.IRepySMSService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value=("/RepySMSController"))
public class RepySMSController {
	
	@Autowired
	@Qualifier("RepySMSService")
	public IRepySMSService iresms;
	
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
	
	//查询预约信息
	@RequestMapping(value="/seleRepysms")
	public void seleRepysms(HttpServletResponse res,int page,int limit) throws IOException{
		
		res.setCharacterEncoding("utf-8");
		PageInfoEntity<ReservationSMSEntiry> pages = iresms.selesreservation(page, limit);
		List<ReservationSMSEntiry> list=pages.getList();
		int s=pages.getSumCount();
		
		Gson g=new Gson();
		String jsons=g.toJson(list);
		jsons="{\"code\":0,\"msg\":\"\",\"count\":"+s+",\"data\":"+jsons+"}";
		res.getWriter().print(jsons);
		
	}
	
	//添加预约信息
	@RequestMapping(value="/interestrepu")
	public void interestrepu(HttpServletResponse res,ReservationSMSEntiry r) throws IOException{
		
		int a=iresms.insertrepysms(r);
		res.getWriter().print(a);
	}
	
	//删除预约信息
	@RequestMapping(value="/deleterepu")
	public void deleterepu(HttpServletResponse res,int id) throws IOException{
		
		int a=iresms.deleterepusms(id);
		res.getWriter().print(a);
	}
	
	
	//查询回访信息
	@RequestMapping(value="/seleRepy")
	public void seleRepy(HttpServletResponse res,int id,int page,int limit) throws IOException{
		
		res.setCharacterEncoding("utf-8");
		List<RepyEntity> list=iresms.selectrepy(id);
	
		Gson g=new Gson();
		String jsons=g.toJson(list);
		jsons="{\"code\":0,\"msg\":\"\",\"count\":"+0+",\"data\":"+jsons+"}";
		res.getWriter().print(jsons);
		
	}
	
	//添加回访信息
	@RequestMapping(value="/intre")
	public void intre(HttpServletResponse res,RepyEntity r) throws IOException{
		r.setRsId(1);
		String d=this.datetime(new Date());
		r.setRhtime(d);
		int a=iresms.inserterpy(r);
		res.getWriter().print(a);
	}
	
	//删除回访信息
	@RequestMapping(value="/delrepy")
	public void delrepy(HttpServletResponse res,int id) throws IOException{
		
		int a=iresms.deleteerpy(id);
		res.getWriter().print(a);
	}
	
	
	

}
