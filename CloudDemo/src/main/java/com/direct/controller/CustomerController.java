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
import com.direct.entity.CustomerEntity;
import com.direct.entity.RecruitmentEntity;
import com.direct.service.ICustomerService;
import com.direct.util.PageModel;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/cust")
public class CustomerController {
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
		PageModel<CustomerEntity> cus = Customer.querycusPage(curr, size);
		List list=cus.getList();
		Gson g=new Gson();
		System.out.println("显示curr大小"+cus.getSize());
		String json=g.toJson(list);
		System.out.println("显示"+json);
		json="{\"code\":0,\"msg\":\"\",\"count\":"+cus.getSize()+",\"data\":"+json+"}";
		System.out.println("显示json"+json);
		res.getWriter().print(json);
	}
	
	
	//添加客户
	@RequestMapping(value="/add")
	public void add(HttpServletRequest req,CustomerEntity cus,HttpServletResponse res) throws IOException{
	
		System.out.println("显示add");
		int tount=Customer.changecus(cus);
		System.out.println("显示add"+tount);
		res.getWriter().print(tount);
	}
		
	// 修改客户
	@RequestMapping(value="/upd")
	public void updblu(HttpServletRequest req,CustomerEntity cus,HttpServletResponse res) throws IOException{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		System.out.println("显示upd");
		int tount=Customer.updcus(cus);
		System.out.println("显示upd"+tount);
		res.getWriter().print(tount);
	}
	
	
	//删除客户
	@RequestMapping(value="/del")
	public void del(HttpServletRequest req,CustomerEntity cus,HttpServletResponse res) throws IOException{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		System.out.println("显示del");
		int tount=Customer.removecus(Integer.parseInt(req.getParameter("id")));
		res.getWriter().print(tount);
	}
	
}
