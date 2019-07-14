package com.direct.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletResponse;
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



import com.direct.entity.AttendanceEnity;
import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.SalaryEnity;
import com.direct.entity.StaffionEntity;
import com.direct.service.AttendanceService;
import com.direct.service.IBranchSelcise;
import com.direct.service.IPositionSelcise;
import com.direct.service.IStaffinfoSelcise;
import com.direct.util.PageModel;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/Staffinfo")
public class StaffinfoController {
	
	@Autowired
	@Qualifier("positions")
	public IPositionSelcise iposs;
	
	@Autowired
	@Qualifier("branchs")
	public IBranchSelcise ibranch;

	@Autowired
	@Qualifier("Staff")
	public IStaffinfoSelcise istaffs;
	
	@Autowired
	@Qualifier("AttService")
	public AttendanceService atdao;
	
	
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
	//查询所有员工
	@RequestMapping(value="/selUser")
	public void selUser(HttpServletResponse res) throws IOException{
		res.setCharacterEncoding("utf-8");
		 List<StaffionEntity> list = istaffs.selstaffinfo();
		for(StaffionEntity b:list){
			System.out.println(b.getsId()+"\t"+b.getsName());
		}
		Gson g=new Gson();
		String jsons=g.toJson(list);
		res.getWriter().print(jsons);
	}
	//根据职位Id查询职位
	@RequestMapping(value="/querUserById")
	public void querryUser(HttpServletResponse res,int Id) throws IOException{
		res.setCharacterEncoding("utf-8");
		List<PositionEntity> list = iposs.selByIdposition(Id);
		Gson g=new Gson();
		String jsons=g.toJson(list);
		res.getWriter().print(jsons);
		System.out.println(jsons);
	}
	
	//员工查询
	@RequestMapping(value="/seleStaffinfo")
	public void seleStaffinfo(HttpServletResponse res,int page,int limit,String key) throws IOException{
		res.setCharacterEncoding("utf-8");
		StaffionEntity s=new StaffionEntity();
		s.setsName(key);;
		PageInfoEntity<StaffionEntity> pages=istaffs.querpageStaffinfo(page, limit, s);
		List<StaffionEntity> list = pages.getList();
		for(StaffionEntity sta:list){
			 Date da=new Date();
			 int dq=Integer.parseInt(this.datetime(da).substring(0, 4));
			 int btt=Integer.parseInt(sta.getsBirthdate().substring(0, 4));
			int num=dq-btt;
			String a=""+num;
			System.out.println(btt+"\t"+dq);
			sta.setsBirthdate(a);
			sta.setsEntrytime(sta.getsEntrytime().substring(0, 10));
		}
		
		
		int sumcount=pages.getSumCount();
		
		Gson g=new Gson();
		String jsons=g.toJson(list);
		jsons="{\"code\":0,\"msg\":\"\",\"count\":"+sumcount+",\"data\":"+jsons+"}";
		res.getWriter().print(jsons);
		
	    }
	
	//查询所有部门
	@RequestMapping(value="/querbum")
	public void selbranch(HttpServletResponse res) throws IOException{
		
		res.setCharacterEncoding("utf-8");
		List<BranchEntity> list=ibranch.selbranch();
		
		Gson g=new Gson();
		String jsons=g.toJson(list);
		res.getWriter().print(jsons);
	}
	
	//查询所有职位
	@RequestMapping(value="/querpost")
	public void seleposit(HttpServletResponse res) throws IOException{
		
		res.setCharacterEncoding("utf-8");
		List<PositionEntity> list=iposs.selposition();
		
		Gson g=new Gson();
		String jsons=g.toJson(list);
		res.getWriter().print(jsons);
	}
	
	//通过部门Id查询职位
	@RequestMapping(value="/querpostById")
	public void querpostById(HttpServletResponse res,int Id) throws IOException{
		
		res.setCharacterEncoding("utf-8");
		List<PositionEntity> list=iposs.selByIdposition(Id);
		
		Gson g=new Gson();
		String jsons=g.toJson(list);
		res.getWriter().print(jsons);
	}
	
	//添加员工
		@RequestMapping(value="/addStaffinfo")
		public void addStaffinfo(StaffionEntity s,HttpServletResponse res) throws IOException{
			System.out.println(s.getsName()+"\t"+s.getsBasepay()+"\t"+s.getsBirthdate()+"\t"+s.getsSocial()+"\t"+s.getsIP()+"\t"+s.getsSex()+"\t"+s.getsEntrytime()+"\t"+s.getsPassword()+"\t"+s.getsPosId().getpId());
			int a = istaffs.addstaffinfo(s);
			 res.getWriter().print(a);
		}
		
		
		//修改职位
		@RequestMapping(value="/uptadeStaffinfo")
		public void uptadeStaffinfo(StaffionEntity s,HttpServletResponse res) throws IOException{
			//System.out.println(p.getPId()+"\t"+p.getPName()+"\t"+p.getPRemark()+"\t"+p.getPBId().getBId());
			int a = istaffs.updstaffinfo(s);
			res.getWriter().print(a);
		}
		
		
		//删除职位
		@RequestMapping(value="/deleteStaffinfo")
		public void deleteStaffinfo(StaffionEntity id,HttpServletResponse res) throws IOException{
			System.out.println("nihao"+id);
			 int a =istaffs.delposition(id) ;
			 res.getWriter().print(a);
		}
		
		
		//单个员工查询
		@RequestMapping(value="/staffbyid")
		public void querStaffinfoById(int id,HttpServletResponse res) throws IOException{
			res.setCharacterEncoding("utf-8");
			StaffionEntity sta=istaffs.selByIdstaffinfo(id);
			System.out.println(sta.getsPosId().getpBId().getbName());
			Gson g=new Gson();
			String jsons=g.toJson(sta);
			res.getWriter().print(jsons);	
		};
		
	//查找员工
		@RequestMapping(value="/querByPIdStaffinfoById")
		public void querByPIdStaffinfo(HttpServletResponse res,HttpServletRequest request,int pId) throws IOException{
			res.setCharacterEncoding("utf-8");
			List<StaffionEntity> co = istaffs.querByPIdStaffinfo(pId);
			Gson g=new Gson();
			String jsons=g.toJson(co);
			res.getWriter().print(jsons);
			request.setAttribute("re", co);
			System.out.println(jsons);
		}

		//查询所有员工薪资
		@RequestMapping(value="/querySal")
		public void query(HttpServletRequest request,HttpServletResponse response) throws IOException{
			response.setCharacterEncoding("utf-8");
			Gson gs=new Gson();
			List<StaffionEntity> cp = istaffs.querysMony();			
			String g=gs.toJson(cp);
			g="{\"code\":0,\"msg\":\"\",\"count\":"+0+",\"data\":"+g+"}";
			System.out.println(g);
			response.getWriter().print(g);	
		}

		//根据员工Id查找信息
		public void querByPIdStaffinfo2(HttpServletResponse res,HttpServletRequest request,int sId) throws IOException{
			res.setCharacterEncoding("utf-8");
			List<StaffionEntity> co = istaffs.selstaffinfo2(sId);
			Gson g=new Gson();
			String jsons=g.toJson(co);
			res.getWriter().print(jsons);
		}
		
		//查询出纳人
		@RequestMapping(value="/querysa")
		public void querysa(HttpServletRequest request,HttpServletResponse response) throws IOException{
			response.setCharacterEncoding("utf-8");
			Gson gs=new Gson();
			List<StaffionEntity> cp = istaffs.selstaffinfo3();		
			String g=gs.toJson(cp);
			System.out.println(g);
			response.getWriter().print(g);	
		}
		
		//根据员工Id查找薪资
		@RequestMapping(value="/querysa2")
		public ModelAndView querByPIdStaffinfo3(HttpServletResponse res,HttpServletRequest request,int sId) throws IOException{
			ModelAndView mav = new ModelAndView("backGround/page/Money/addMoney");
			 res.setCharacterEncoding("utf-8");
			 //查询考勤
			 System.out.println("查询考勤");
			 System.out.println(sId);
			List<AttendanceEnity> at = atdao.query(sId);
			 
			 System.out.println("查询考勤2");
			 SalaryEnity co = istaffs.selstaffinfo4(sId,at);
			 
			 System.out.println(co.getActualMOney()+"实发工资");
			 mav.addObject("se", co);
			return mav;
		}
		//查询员工薪资状况
		
		
}
