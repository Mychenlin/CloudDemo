package com.direct.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.direct.entity.CompleaintsEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.service.ICompleaintsService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="Compleaints")
public class CompleaintsController {
	
	@Autowired
	@Qualifier("CompleaintsService")
	public ICompleaintsService icomps;
	
	//查询意见
	@RequestMapping(value="seleCompleaints")
	public void seleCompleaints(HttpServletResponse res,int page,int limit) throws IOException{
		res.setCharacterEncoding("utf-8");
		PageInfoEntity<CompleaintsEntity> pa=icomps.selectCompleain(page,limit);
		List<CompleaintsEntity> list = pa.getList();
		int sumcuu=pa.getSumCount();
		
		
		Gson g=new Gson();
		String jsons=g.toJson(list);
		jsons="{\"code\":0,\"msg\":\"\",\"count\":"+sumcuu+",\"data\":"+jsons+"}";
		res.getWriter().print(jsons);
	}
	
	//添加意见
	@RequestMapping("/insertCompl")
	public ModelAndView insertCompl(CompleaintsEntity co){
		ModelAndView mv =new ModelAndView("index");
		int c=icomps.insetComplea(co);
		if(c>0){
			System.out.println("添加成功");
		}
		return mv;
	}
	
	//删除意见
	@RequestMapping("/deleteCompl")
	public void deleteCompl(HttpServletResponse res,int id) throws IOException{
		System.out.println("进入");
		int a=icomps.deleteComplea(id);
		res.getWriter().print(a);
	}

	//修改意见
		@RequestMapping("/updateCompl")
		public void updateCompl(HttpServletResponse res,int id) throws IOException{
			System.out.println("进入");
			int a=icomps.deleteComplea(id);
			res.getWriter().print(a);
		}

	//后台人员添加意见
		@RequestMapping("/insertComplsA")
		public void insertComplsA(HttpServletResponse res,CompleaintsEntity co) throws IOException{
			System.out.println(co.getcName());
			int c=icomps.insertcom(co);
			res.getWriter().print(c);
			
		}	
		
}
