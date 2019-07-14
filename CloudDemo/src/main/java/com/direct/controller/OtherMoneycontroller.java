package com.direct.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

import com.direct.entity.OtherMoney;
import com.direct.entity.SalaryEnity;
import com.direct.service.OthermoneyService;
import com.direct.service.SalaryService;
import com.direct.util.PageModel;

@Controller
@RequestMapping(value="/OtherC")
public class OtherMoneycontroller {
	@Autowired
	@Qualifier("otherService")
	private OthermoneyService odao;
	
	//处理日期类型参数
	@InitBinder
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor cde=new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, cde);
	}
	
	//查询显示
	@RequestMapping(value="/ShowOth")
	public ModelAndView ShowEmp(HttpServletRequest request){
		//分页显示:接收当前页
		int curr=1;
		//页面点击翻页时传递的当前页参数
		String pageNo=request.getParameter("pageNo");
		System.out.println(pageNo);
		if(pageNo!=null && !"".equals(pageNo)){
			curr=Integer.parseInt(pageNo);	
		}
		PageModel<OtherMoney> sal = odao.selectSalary(curr, 5);

		ModelAndView mod=new ModelAndView("backGround/page/Money/queryOther");
		mod.addObject("sa", sal);
		return mod;	
	}
	
	//添加其它薪资
	@RequestMapping(value="/addOth")
	public void addMoney(OtherMoney on,HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println(on.getOtherType()+on.getOthName());
		int oi = odao.addSalary(on);
		response.getWriter().print(oi);
	}
	
	
	
}
