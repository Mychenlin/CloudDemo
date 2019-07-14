package com.direct.service;

import java.util.List;

import com.direct.entity.CarBrand;
import com.direct.entity.CarInfo;
import com.direct.entity.CarType;
import com.direct.entity.PageInfoEntity;
import com.direct.util.PageModel;

public interface ICarService {
	//查询汽车品牌
		public PageInfoEntity<CarBrand> selectCarBrand(int page,int rows);
		public CarBrand selectCarBrandById(int id);
		public int addCarBrand(CarBrand carBarand);
		public int updateCarBrand(CarBrand carBarand);
		public int deleteCarBrand(int id);
		
		//汽车类型
		public PageModel<CarType> selectCarType(int curr,int size);
		public CarType selectCarTypeByID(int id);
		public int addCarType(CarType carType);
		public int updateCarType(CarType carType);
		public int deleteCarType(int id);
		
		//汽车配置信息
		public PageModel<CarInfo> selectCarInfo(int curr,int size);
		public CarInfo selectCarInfoById(int id);
		public int addCarInfo(CarInfo carInfo);
		public int updateCarInfo(CarInfo carInfo);
		public int deleteCarInfo(int id);
		
		//勿动
		public List<CarInfo> queryCar();
		
}
