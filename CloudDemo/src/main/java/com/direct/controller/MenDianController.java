package com.direct.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.direct.entity.MenDianEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.service.IMenDianService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/MenDianController")
public class MenDianController {

	@Autowired
	@Qualifier("MenDianService")
	public IMenDianService imendianservice; 
	
	public String datetime(Date d){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(d);
		System.out.println(dateString);
				   return dateString;
	}
	

	@RequestMapping(value="/seleMedian")
	public void seleMedian(HttpServletResponse res,int page,int limit,String key) throws IOException{
		res.setCharacterEncoding("utf-8");
		MenDianEntity mss=new MenDianEntity();
		mss.setmName(key);
		PageInfoEntity<MenDianEntity> pages = imendianservice.seleMend(page, limit,mss);
		List<MenDianEntity> list = pages.getList();
		for(MenDianEntity sta:list){
			if(sta.getmZT()==1){
				 sta.setrRemark("营业中");
			}else if(sta.getmZT()==2){
				 sta.setrRemark("装修中");
			}else if(sta.getmZT()==3){
				 sta.setrRemark("停业");
			}else if(sta.getmZT()==4){
				 sta.setrRemark("停止合作");
			}
			
		}
		int i=pages.getSumCount();
		
		Gson g=new Gson();
		String jsons=g.toJson(list);
		jsons="{\"code\":0,\"msg\":\"\",\"count\":"+i+",\"data\":"+jsons+"}";
		res.getWriter().print(jsons);
		
	}
	
	@RequestMapping(value="/addMedian")
	public void addMedian(HttpServletResponse res,MenDianEntity men) throws IOException{
		
		String s=this.datetime(new Date());
		men.setMhtime(s);
		int i=imendianservice.interMenDian(men);
		
		res.getWriter().print(i);
	}
	
	
	@RequestMapping(value="/updateMedian")
	public void updateMedian(HttpServletResponse res,MenDianEntity men) throws IOException{
		
		int i=imendianservice.updateMenDian(men);
		res.getWriter().print(i);
	}
	
	@RequestMapping(value="/deleteMedian")
	public void deleteMedian(HttpServletResponse res,int id) throws IOException{
		
		int i=imendianservice.deleteMenDian(id);
		res.getWriter().print(i);
	}
	
	@RequestMapping(value="/selemodianqian")
	public ModelAndView selemodianqian(){
		ModelAndView mv=new ModelAndView("YuDuans/MenDiane");
		List<MenDianEntity> list = imendianservice.seleMendss();
		for(MenDianEntity sta:list){
			if(sta.getmZT()==1){
				 sta.setrRemark("营业中");
			}else if(sta.getmZT()==2){
				 sta.setrRemark("装修中");
			}else if(sta.getmZT()==3){
				 sta.setrRemark("停业");
			}else if(sta.getmZT()==4){
				 sta.setrRemark("停止合作");
			}
			
		}
		
		
		mv.addObject("list", list);
		return mv;
	}
	
}
