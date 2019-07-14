package com.direct.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.IApplicationDao;
import com.direct.entity.ApplicationEntity;
import com.direct.service.IApplicationService;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
@Service("ApplicationService")
public class ApplicationService implements IApplicationService {

	@Autowired
	public IApplicationDao appdao;
	public int addApp(ApplicationEntity App) {
		
		
		String zhi="";
		String dz="";
		//拆分贯籍字符串
        String[] sourceStrArray = App.A_present.split(",");
        for (int i = 0; i < sourceStrArray.length; i++) {
            zhi=zhi+sourceStrArray[i];
        }
        String[] dzStrArray = App.A_place.split(",");
        for (int i = 0; i < dzStrArray.length; i++) {
            dz=zhi+dzStrArray[i];
        }
        App.setA_present(zhi);
        App.setA_place(dz);
        
        //创建当前时间
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH：mm：ss：SSS");
        String str=sdf.format(new Date());
        App.setA_Time(str);
		// TODO Auto-generated method stub
		return appdao.addapp(App);
	}

	@Override
	public int updApp(ApplicationEntity App) {
		// TODO Auto-generated method stub
		int id=App.A_id;
		String zt=null;
		ApplicationEntity app=appdao.selectappById(id);
		if("0".equals(app.A_state)){
			 zt="1";
			
		}
		ApplicationEntity app1=new ApplicationEntity();
		app1.A_state=zt;
		app1.A_id=id;
		return appdao.updapp(app1);
	}
	@Override
	public int updblu(ApplicationEntity App) {
		// TODO Auto-generated method stub
		int id=App.A_id;
		String zt=null;
		ApplicationEntity app=appdao.selectappById(id);
		if("0".equals(app.A_state)){
			 zt="2";
			
		}
		ApplicationEntity app1=new ApplicationEntity();
		app1.A_state=zt;
		app1.A_id=id;
		return appdao.updapp(app1);
	}

	@Override
	public int delApp(int eid) {
		// TODO Auto-generated method stub
		return appdao.delapp(eid);
	}

	@Override
	public ApplicationEntity selectAppById(int eid) {
		// TODO Auto-generated method stub
		return appdao.selectappById(eid);
	}

	

	@Override
	public PageModel<ApplicationEntity> selectAppPage(int curr,int size) {
		Page page = PageHelper.startPage(curr, size, true);
		//得到数据集合
		List<ApplicationEntity> elist = appdao.selectappPage();
		//得到总条数
		int count = (int)page.getTotal();
		
		//封装app
		PageModel<ApplicationEntity> Appli=new PageModel<ApplicationEntity>();
		Appli.setCurrentPage(curr);
		Appli.setSize(size);
		Appli.setSumCount(count);
		Appli.setList(elist);
		return  Appli;
	}

}
