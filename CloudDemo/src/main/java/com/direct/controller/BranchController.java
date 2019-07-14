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
import com.direct.service.IBranchSelcise;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/Branch")
public class BranchController {

	@Autowired
	@Qualifier("branchs")
	public IBranchSelcise ibranch;
	
	//查询部门
	@RequestMapping(value="/selectAllBranch")
	public void selectBranch(HttpServletResponse res,int page,int limit,String key) throws IOException{
		res.setCharacterEncoding("utf-8");
		BranchEntity b=new BranchEntity();
		b.setbName(key); 
		
		PageInfoEntity<BranchEntity> pa = ibranch.selpageBach(page, limit,b);
		List<BranchEntity> list=pa.getList();
		int sumcount=pa.getSumCount();
		Gson g=new Gson();
		String jsons=g.toJson(list);
		jsons="{\"code\":0,\"msg\":\"\",\"count\":"+sumcount+",\"data\":"+jsons+"}";
		res.getWriter().print(jsons);
	}
	
	
	//添加部门
	@RequestMapping(value="/addBranch")
	public void addBranch(BranchEntity br,HttpServletResponse res) throws IOException{
		 int a = ibranch.addbranch(br);
		 System.out.println(a);
		 res.getWriter().print(a);
	}
	
	
	//修改部门
	@RequestMapping(value="/uptadeBranch")
	public void uptadeBranch(BranchEntity br,HttpServletResponse res) throws IOException{
		 int a = ibranch.updbranch(br);
		 res.getWriter().print(a);
	}
	
	
	//删除部门
	@RequestMapping(value="/deleteBranch")
	public void deleteBranch(int id,HttpServletResponse res) throws IOException{
		 int a = ibranch.delbranch(id);
		 res.getWriter().print(a);
	}
	
	
	
	
}
