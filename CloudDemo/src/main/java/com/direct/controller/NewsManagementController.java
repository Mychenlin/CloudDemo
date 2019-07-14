package com.direct.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.servlet.ModelAndView;

import com.direct.entity.ApplicationEntity;
import com.direct.entity.News;
import com.direct.entity.OtherMoney;
import com.direct.entity.RecruitmentEntity;
import com.direct.entity.SalaryEnity;
import com.direct.entity.StaffionEntity;
import com.direct.service.IStaffinfoSelcise;
import com.direct.service.impl.NewsServiceimpl;
import com.direct.util.PageModel;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/NewsManagement")
public class NewsManagementController {
	@Autowired
	@Qualifier("NewManagementService")
	private NewsServiceimpl ndao;
	
	@Autowired
	@Qualifier("Staff")
	public IStaffinfoSelcise Istaffs;
	
	//处理日期类型参数
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
	@RequestMapping(value="/ShowNew")
	public void ShowNew(HttpServletRequest request,HttpServletResponse res) throws IOException{
		//分页显示:接收当前页
		//页面点击翻页时传递的当前页参数
		request.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		//分页显示:接收当前页
		int curr = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int size = request.getParameter("limit")==null?5:Integer.parseInt(request.getParameter("limit"));
		
		String pageNo=request.getParameter("pageNo");
		System.out.println(pageNo);
		if(pageNo!=null && !"".equals(pageNo)){
			curr=Integer.parseInt(pageNo);	
		}
		PageModel<News> sal = ndao.selectNews(curr,size);
		System.out.println(sal.getSize());
		System.out.println(sal.getList());
		List list=sal.getList();
		Gson g=new Gson();
		String json=g.toJson(list);
		System.out.println("显示"+json);
		json="{\"code\":0,\"msg\":\"\",\"count\":"+sal.getSize()+",\"data\":"+json+"}";
		System.out.println("显示json"+json);
		res.getWriter().print(json);
	}
	
	//查询员工
	@RequestMapping(value="/selst")
	public void selst(HttpServletRequest req,HttpServletResponse res) throws IOException{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		List<StaffionEntity> list = Istaffs.selstaffinfo();	
		Gson g=new Gson();
		String json=g.toJson(list);
		System.out.println("显示"+json);
		json="{\"code\":0,\"msg\":\"\",\"count\":"+list.size()+",\"data\":"+json+"}";
		System.out.println("显示json"+json);
		res.getWriter().print(json);
	}
	 
	//添加新闻
	@RequestMapping(value="/add")
	public void add(HttpServletRequest req,News news,HttpServletResponse res) throws IOException{
	
		System.out.println("显示add");
		Date str=new Date();
		news.setNewtime(str);
		int tount=ndao.addNews(news);
		System.out.println("显示add"+tount);
		res.getWriter().print(tount);
	}
	
	//修改新闻
	@RequestMapping(value="/upd")
	public void upd(HttpServletRequest req,News news,HttpServletResponse res) throws IOException{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		Date str=new Date();
		news.setNewtime(str);
		int tount=ndao.manchNews(news);
		res.getWriter().print(tount);
	}
	
	//删除新闻
	@RequestMapping(value="/del")
	public void del(HttpServletRequest req,News news,HttpServletResponse res) throws IOException{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		System.out.println("显示upd");
		int tount=ndao.removeNews(Integer.parseInt(req.getParameter("id")));
		System.out.println("显示upd"+tount);
		res.getWriter().print(tount);
	}
	
	
	@RequestMapping(value="/QueryShowNew")
	public ModelAndView query(HttpServletRequest request,HttpServletResponse res) throws UnsupportedEncodingException{
		//页面点击翻页时传递的当前页参数
		request.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		//分页显示:接收当前页
		int curr = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int size = request.getParameter("limit")==null?5:Integer.parseInt(request.getParameter("limit"));
		
		String pageNo=request.getParameter("pageNo");
		System.out.println(pageNo);
		if(pageNo!=null && !"".equals(pageNo)){
			curr=Integer.parseInt(pageNo);	
		}
		PageModel<News> sal = ndao.selectNews(curr,size);
		ModelAndView mod=new ModelAndView("YuDuans/xinwen");
		mod.addObject("so",sal);
		return mod;
	}
}
