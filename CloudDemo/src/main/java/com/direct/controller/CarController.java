package com.direct.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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

import com.direct.entity.CarBrand;
import com.direct.entity.CarInfo;
import com.direct.entity.CarType;
import com.direct.entity.PageInfoEntity;
import com.direct.service.ICarService;
import com.direct.util.PageModel;
import com.github.pagehelper.PageException;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/carC")
public class CarController {
	
	
	@Autowired
	@Qualifier("carService")
	public ICarService icservice;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor cde=new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, cde);
	}
	
	//查询显示(汽车品牌)
	@RequestMapping(value="/show")
	public void showEmp(HttpServletRequest req,HttpServletResponse resp,int page,int limit) throws IOException{
		resp.setCharacterEncoding("UTF-8");
		PageInfoEntity<CarBrand> pages = icservice.selectCarBrand(page, limit);
		List<CarBrand> cblist = pages.getList();
		int s = pages.getSumCount();
		Gson g = new Gson();
		String json = g.toJson(cblist);
		json="{\"code\":0,\"msg\":\"\",\"count\":"+s+",\"data\":"+json+"}";
		resp.getWriter().print(json);
	}
	//查询显示(汽车品牌)
	@RequestMapping(value="/carType")
	public void showType(HttpServletRequest req,HttpServletResponse resp,int page,int limit) throws IOException{
		resp.setCharacterEncoding("UTF-8");
		PageModel<CarType> pages = icservice.selectCarType(page, limit);
		List<CarType> cblist = pages.getList();
		int s = pages.getSumCount();
		Gson g = new Gson();
		String json = g.toJson(cblist);
		json="{\"code\":0,\"msg\":\"\",\"count\":"+s+",\"data\":"+json+"}";
		resp.getWriter().print(json);
	}
	
	//查询（汽车配置信息）
	@RequestMapping(value="/carInfo")
	public void showCarInfo(HttpServletRequest req,HttpServletResponse resp,int page,int limit) throws IOException{
		resp.setCharacterEncoding("UTF-8");
		PageModel<CarInfo> pages = icservice.selectCarInfo(page, limit);
		List<CarInfo> cblist = pages.getList();
		int s = pages.getSumCount();
		Gson g = new Gson();
		String json = g.toJson(cblist);
		json="{\"code\":0,\"msg\":\"\",\"count\":"+s+",\"data\":"+json+"}";
		System.out.println(json);
		resp.getWriter().print(json);
	}
	//通过id查询汽车配置信息
	@RequestMapping(value="/carInfoById")
	public ModelAndView showCarInfoById(int id){
		ModelAndView mav = new ModelAndView("backGround/page/car/carCInfo");
		CarInfo ci = icservice.selectCarInfoById(id);
		mav.addObject("ci", ci);
		return mav;
	}
	
	
	
	//勿动
	//查询汽车
	@RequestMapping(value="querycar")
	public void querycar(HttpServletRequest request,HttpServletResponse respone) throws IOException{
		request.setCharacterEncoding("utf-8");
		respone.setCharacterEncoding("utf-8");
		List<CarInfo> clist = icservice.queryCar();
		Gson g = new Gson();
		String json = g.toJson(clist);
		System.out.println(json);
		respone.getWriter().print(json);
	}
	
	
	
}
