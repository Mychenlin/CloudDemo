package com.direct.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;
import com.direct.service.IBranchSelcise;
import com.direct.service.IPositionSelcise;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/position")
public class PositionController {
	
	@Autowired
	@Qualifier("positions")
	public IPositionSelcise iposs;
	
	@Autowired
	@Qualifier("branchs")
	public IBranchSelcise ibranch;

	//职位查询
	@RequestMapping(value="seleposition")
	public void seleposition(HttpServletResponse res,int page,int limit,String key) throws IOException{
		res.setCharacterEncoding("utf-8");
		
		PositionEntity p=new PositionEntity();
		p.setpName(key);
		System.out.println("pam:11"+key);
		
		PageInfoEntity<PositionEntity> pages=iposs.selpageposit(page, limit,p);
		List<PositionEntity> list = pages.getList();
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
		for(BranchEntity b:list){
			System.out.println(b.getbName()+"静茹"+b.bRemark);
		}
		
		Gson g=new Gson();
		String jsons=g.toJson(list);
		res.getWriter().print(jsons);
	}
	
	
	//添加职位
		@RequestMapping(value="/addPosition")
		public void addPosition(PositionEntity p,HttpServletResponse res) throws IOException{
			 int a = iposs.addposition(p);
			 System.out.println(a);
			 res.getWriter().print(a);
		}
		
		
		//修改职位
		@RequestMapping(value="/uptadePosition")
		public void uptadePosition(PositionEntity p,HttpServletResponse res) throws IOException{
			//System.out.println(p.getPId()+"\t"+p.getPName()+"\t"+p.getPRemark()+"\t"+p.getPBId().getBId());
			int a = iposs.updposition(p);
			res.getWriter().print(a);
		}
		
		
		//删除职位
		@RequestMapping(value="/deletePosition")
		public void deletePosition(int id,HttpServletResponse res) throws IOException{
			System.out.println("nihao"+id);
			 int a = iposs.delposition(id);
			 res.getWriter().print(a);
		}
		
	
	
	
}
