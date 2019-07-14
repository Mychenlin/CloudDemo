package com.direct.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.IAppointmentDao;
import com.direct.entity.ApplicationEntity;
import com.direct.entity.AppointmentEntity;
import com.direct.service.IAppointmentService;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
@Service("AppointmentService")
public class AppointmentService implements IAppointmentService {

	@Autowired
	public IAppointmentDao appdao;
	
	

	public int changeapp(AppointmentEntity app) {
		// TODO Auto-generated method stub
	
       
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        //创建当前时间
        app.setA_time(sf.format(c.getTime()));
        System.out.println(sf.format(c.getTime()));
        
      //创建3天后时间
        c.add(Calendar.DAY_OF_MONTH, 3);
        app.setA_Estimated_time(sf.format(c.getTime()));
        System.out.println(sf.format(c.getTime()));
        
        
        
        //初始预约状态
        app.setA_state("0");
        
		return appdao.addment(app);
	}

	public int removeapp(int eid) {
		// TODO Auto-generated method stub
		return appdao.delment(eid);
	}

	public AppointmentEntity queryappById(int eid) {
		// TODO Auto-generated method stub
		return appdao.selectmentById(eid);
	}

	public PageModel<AppointmentEntity> queryappPage(int curr, int size) {
		Page page = PageHelper.startPage(curr, size, true);
		//得到数据集合
		List<AppointmentEntity> elist = appdao.selectmentPage();
		//得到总条数
		int count = (int)page.getTotal();
		
		//封装app
		PageModel<AppointmentEntity> app=new PageModel<AppointmentEntity>();
		app.setCurrentPage(curr);
		app.setSize(size);
		app.setSumCount(count);
		app.setList(elist);
		return app;
	}

	
	@Override
	public int updAppment(AppointmentEntity Appment) {
		// TODO Auto-generated method stub
		int id=Appment.a_Id;
		String zt=null;
		AppointmentEntity app=appdao.selectmentById(id);
		if("0".equals(app.a_state)){
			 zt="1";
			
		}
		AppointmentEntity app1=new AppointmentEntity();
		app1.a_state=zt;
		app1.a_Id=id;
		return appdao.updment(app1);
	}
}
