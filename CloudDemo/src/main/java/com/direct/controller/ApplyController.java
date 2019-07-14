package com.direct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.direct.entity.ApplyEntity;
import com.direct.service.IApplyService;


@Controller
@RequestMapping("/app")
public class ApplyController {
	@Autowired
	@Qualifier("applyService")
	private IApplyService ias;
	
	@RequestMapping("/selectApply")
	public ModelAndView selectApply(){
		ModelAndView mav = new ModelAndView();
		List<ApplyEntity> alist = ias.queryApplyInfo();
		mav.addObject("alist", alist);
		return mav;
	}
	@RequestMapping("/insertApply")
	public ModelAndView insertApply(ApplyEntity ae){
		ModelAndView mav = new ModelAndView("not.jsp");
		int row = ias.addApplyInfo(ae);
		if(row>0){
			return this.selectApply();
		}
		return mav;
	}
	@RequestMapping("/updateApply")
	public ModelAndView updateApply(ApplyEntity ae){
		ModelAndView mav = new ModelAndView("not.jsp");
		int row = ias.changeApplyInfo(ae);
		if(row>0){
			return this.selectApply();
		}
		return mav;
	}
	
}
