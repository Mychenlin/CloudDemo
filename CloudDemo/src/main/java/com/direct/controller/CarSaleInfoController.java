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

import com.direct.entity.CarSaleInfo;
import com.direct.service.CarSaleInfoService;


@Controller
@RequestMapping(value="/Carsal")
public class CarSaleInfoController {
	@Autowired
	@Qualifier("CarService")
	private CarSaleInfoService car;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor cde=new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, cde);
	}
	
	//销售车辆
	
	@RequestMapping(value="insert")
	public void addCar(HttpServletRequest request,HttpServletResponse respone,CarSaleInfo cr) throws IOException{
		
		System.out.println(cr.getCusId());
		System.out.println(cr.getNetReceipts());
		System.out.println(cr.getReceivable());
		System.out.println(cr.getAdvance());
		System.out.println(cr.getDealTime());
		System.out.println(cr.getCarId().getId());
		System.out.println(cr.getStaId().getsId());
		
		int count = car.insertCar(cr);
		respone.getWriter().print(count);
	
	}
	
	
}
