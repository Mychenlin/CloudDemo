package com.direct.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.CarSaleInfoDao;
import com.direct.entity.CarSaleInfo;
import com.direct.service.CarSaleInfoService;
@Service("CarService")
public class CarSaleInfoServiceImpl implements CarSaleInfoService {
	@Autowired
	private CarSaleInfoDao cdao;
	
	@Override
	public int insertCar(CarSaleInfo cs) {
		
		return cdao.insertCar(cs);
	}

}
