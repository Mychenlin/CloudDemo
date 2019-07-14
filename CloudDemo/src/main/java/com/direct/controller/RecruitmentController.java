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
import org.springframework.web.servlet.ModelAndView;

import com.direct.entity.BranchEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.RecruitmentEntity;
import com.direct.service.IRecruitmentService;
import com.direct.service.IStaffinfoSelcise;
import com.direct.util.PageModel;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/rec")
public class RecruitmentController {
	@Autowired
	@Qualifier("RecruitmentService")
	public IRecruitmentService Recruitment;
	
	
	@Autowired
	@Qualifier("Staff")
	public IStaffinfoSelcise istaffs;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor cde=new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, cde);
	}
	
	//查询显示
	@RequestMapping(value="/show")
	public void showRec(HttpServletRequest req,HttpServletResponse res) throws IOException{
		System.out.println("访问rec");
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
		PageModel<RecruitmentEntity> rec = Recruitment.queryrecPage(curr, size);
		List list=rec.getList();
		Gson g=new Gson();
		System.out.println("显示curr大小"+rec.getSize());
		String json=g.toJson(list);
		System.out.println("显示"+json);
		json="{\"code\":0,\"msg\":\"\",\"count\":"+rec.getSize()+",\"data\":"+json+"}";
		System.out.println("显示json"+json);
		res.getWriter().print(json);
	}
	//查询部门
	@RequestMapping(value="/showb")
	public ModelAndView showb(HttpServletRequest req){
		List<BranchEntity> br=Recruitment.queryb();
		List<PositionEntity> po=Recruitment.queryp();
		System.out.println("显示po"+po.size());
		ModelAndView mav=new ModelAndView("backGround/page/recruitment/add");
		mav.addObject("br", br);
		return mav;
	}
	//查询职位
		@RequestMapping(value="/post")
		public void post(HttpServletRequest req,HttpServletResponse res) throws IOException{
			req.setCharacterEncoding("utf-8");
			res.setCharacterEncoding("utf-8");
			System.out.println("进入po");
			int postId=req.getParameter("post_id")==null?1:Integer.parseInt(req.getParameter("post_id"));
			System.out.println("显示post_id"+postId);
			List<PositionEntity> po=Recruitment.querypost(postId);
			System.out.println("显示po"+po.size());
			Gson g=new Gson();
			String json=g.toJson(po);
			json="{\"code\":0,\"msg\":0,\"count\":1,\"data\":"+json+"}";
			res.getWriter().print(json);
		}
		
		//添加招聘
		@RequestMapping(value="/add")
		public void add(HttpServletRequest req,RecruitmentEntity rec,HttpServletResponse res) throws IOException{
		
			System.out.println("显示add");
			int tount=Recruitment.changerec(rec);
			System.out.println("显示add"+tount);
			res.getWriter().print(tount);
		}
		
		//查询部门1
		@RequestMapping(value="/showbm")
		public void showbm(HttpServletRequest req,HttpServletResponse res ) throws IOException{
			req.setCharacterEncoding("utf-8");
			res.setCharacterEncoding("utf-8");
			List<BranchEntity> br=Recruitment.queryb();
			System.out.println("显示po"+br.size());
			Gson g=new Gson();
			String json=g.toJson(br);
			json="{\"code\":0,\"msg\":0,\"count\":1,\"data\":"+json+"}";
			res.getWriter().print(json);
		}
		
		//修改招聘
		@RequestMapping(value="/upd")
		public void upd(HttpServletRequest req,RecruitmentEntity rec,HttpServletResponse res) throws IOException{
			req.setCharacterEncoding("utf-8");
			res.setCharacterEncoding("utf-8");
			System.out.println("显示upd");
			int tount=Recruitment.upd(rec);
			System.out.println("显示upd"+tount);
			res.getWriter().print(tount);
		}
		
		//删除招聘
		@RequestMapping(value="/del")
		public void del(HttpServletRequest req,RecruitmentEntity rec,HttpServletResponse res) throws IOException{
			req.setCharacterEncoding("utf-8");
			res.setCharacterEncoding("utf-8");
			System.out.println("显示upd");
			int tount=Recruitment.removerec(Integer.parseInt(req.getParameter("id")));
			System.out.println("显示upd"+tount);
			res.getWriter().print(tount);
		}
}
