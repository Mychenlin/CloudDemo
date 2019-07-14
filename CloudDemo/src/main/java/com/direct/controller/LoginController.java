package com.direct.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.direct.entity.loginsEntity;
import com.direct.service.ILoginService;

@Controller
@RequestMapping(value="/LoginController")
public class LoginController {
	
	@Autowired
	@Qualifier("LoginService")
	public ILoginService ilogin;
	
	@RequestMapping(value="/loginto")
	public String loginto(HttpServletRequest req,loginsEntity l){
		
		loginsEntity lo = ilogin.login(l);
		if(lo!=null&&lo.getlName()!=null){
			req.getSession().getServletContext().setAttribute("user", lo);
			return "redirect:/backGround/index.html";
			
		}
	
		return "redirect:/backGround/login/index.html";
	}

}
