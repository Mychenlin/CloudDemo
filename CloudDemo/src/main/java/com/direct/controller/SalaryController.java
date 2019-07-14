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
import org.springframework.stereotype.Service;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.direct.entity.AttendanceEnity;
import com.direct.entity.SalaryEnity;
import com.direct.entity.StaffionEntity;
import com.direct.service.AttendanceService;
import com.direct.service.IStaffinfoSelcise;
import com.direct.service.SalaryService;
import com.direct.util.PageModel;
@Controller
@RequestMapping(value="/SalaryC")
public class SalaryController {
	@Autowired
	@Qualifier("salaryService")
	private SalaryService sdao;
	
	@Autowired
	@Qualifier("Staff")
	public IStaffinfoSelcise istaffs;
	
	
	//处理日期类型参数
		@InitBinder
		public void initBinder(WebDataBinder binder){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			CustomDateEditor cde=new CustomDateEditor(sdf, true);
			binder.registerCustomEditor(Date.class, cde);
		}
		
		//查询显示
		@RequestMapping(value="/ShowSal")
		public ModelAndView ShowEmp(HttpServletRequest request){
			//分页显示:接收当前页
			int curr=1;
			//页面点击翻页时传递的当前页参数
			String pageNo=request.getParameter("pageNo");
			System.out.println(pageNo);
			if(pageNo!=null && !"".equals(pageNo)){
				curr=Integer.parseInt(pageNo);	
			}
			System.out.println("这是查询员工薪资状况");
			PageModel<SalaryEnity> sal = sdao.selectSalary(curr, 5);
			
			ModelAndView mod=new ModelAndView("backGround/page/Money/queryMoney");
			mod.addObject("sa", sal);
			return mod;	
		}
	
		//添加薪资
		@RequestMapping(value="/addMoney")
		public void addMoney(HttpServletRequest request,HttpServletResponse res,StaffionEntity staId,StaffionEntity cashierId,String methodMoney,SalaryEnity sa) throws IOException{
			System.out.println(cashierId);
			SalaryEnity s=new SalaryEnity( sa.getMerits(), sa.getSubsidy(), sa.getAskingLeave(), 
					sa.getAskingLate(), sa.getAskingAbsenteeism(),sa.getAskingRetirement(),
					sa.getAskingAbsenteeism(),sa.getAskingIndividual(),
				sa.getAmountMoney(),sa.getActualMOney(),sa.getTotalCompany(),methodMoney,
				new Date(),staId, cashierId);
			
				int count=sdao.addSalary(s);
				res.getWriter().print(count);	
		}
		
		//修改查看
		@RequestMapping(value="/queryById")
		public ModelAndView queryById(int sId){
			SalaryEnity si = sdao.queryByid(sId);
			ModelAndView mod=new ModelAndView("backGround/page/Money/addMoney");
			mod.addObject("so", si);
			return mod;
		}
		
		
}
