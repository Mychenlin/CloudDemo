package com.direct.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.LoginDao;
import com.direct.entity.loginsEntity;
import com.direct.service.ILoginService;

@Service("LoginService")
public class LoginService implements ILoginService{

	@Autowired
	public LoginDao logindao;
	
	@Override
	public loginsEntity login(loginsEntity l) {
		// TODO Auto-generated method stub
		return logindao.login(l);
	}

}
