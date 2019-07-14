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
import com.direct.entity.StaffionEntity;
import com.direct.service.IZhiYuanService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/ZhiYuanController")
public class ZhiYuanController {
	
	@Autowired
	@Qualifier("ZhiYuanService")
	public IZhiYuanService izhiyuan;

	
	//部门
	@RequestMapping(value="/selectBranch")
	public void selectBranch(HttpServletResponse res,int page,int limit,String key) throws IOException{
		res.setCharacterEncoding("utf-8");
		
		BranchEntity b=new BranchEntity();
		b.setbName(key); 
		
		PageInfoEntity<BranchEntity> pa = izhiyuan.selectbra(page, limit, b);
		List<BranchEntity> list=pa.getList();
		int sumcount=pa.getSumCount();
		Gson g=new Gson();
		String jsons=g.toJson(list);
		jsons="{\"code\":0,\"msg\":\"\",\"count\":"+sumcount+",\"data\":"+jsons+"}";
		res.getWriter().print(jsons);
	}
	
	@RequestMapping(value="/upbreanch")
	public void upbreanch(HttpServletResponse res,int id) throws IOException{
		int a=izhiyuan.updatebrete(id);
		res.getWriter().print(a);
	}
	
	//职位
	@RequestMapping(value="/selectposit")
	public void selectposit(HttpServletResponse res,int page,int limit,String key) throws IOException{
		res.setCharacterEncoding("utf-8");
		
		PositionEntity b=new PositionEntity();
		b.setpName(key); 
		
		PageInfoEntity<PositionEntity> pa = izhiyuan.selectpos(page, limit, b);
		List<PositionEntity> list=pa.getList();
		int sumcount=pa.getSumCount();
		Gson g=new Gson();
		String jsons=g.toJson(list);
		jsons="{\"code\":0,\"msg\":\"\",\"count\":"+sumcount+",\"data\":"+jsons+"}";
		res.getWriter().print(jsons);
	}
	
	@RequestMapping(value="/upposit")
	public void upposit(HttpServletResponse res,int id) throws IOException{
		int a=izhiyuan.updatepostion(id);
		res.getWriter().print(a);
	}
	
	//员工
		@RequestMapping(value="/selectsta")
		public void selectsta(HttpServletResponse res,int page,int limit,String key) throws IOException{
			res.setCharacterEncoding("utf-8");
			
			StaffionEntity b=new StaffionEntity();
			b.setsName(key); 
			
			PageInfoEntity<StaffionEntity> pa = izhiyuan.selecsta(page, limit, b);
			List<StaffionEntity> list=pa.getList();
			for(StaffionEntity s:list){
				int a=s.getsZT();
				if(a==1){
					s.setsPassword("员工游离");
				}else if(a==0){
					s.setsPassword("员工离职");
				}
				
			}
			int sumcount=pa.getSumCount();
			Gson g=new Gson();
			String jsons=g.toJson(list);
			jsons="{\"code\":0,\"msg\":\"\",\"count\":"+sumcount+",\"data\":"+jsons+"}";
			res.getWriter().print(jsons);
		}
		
		@RequestMapping(value="/updatesta")
		public void updatesta(HttpServletResponse res,int id) throws IOException{
			int a=izhiyuan.updatestaff(id);
			res.getWriter().print(a);
		}
		
	
	
}
