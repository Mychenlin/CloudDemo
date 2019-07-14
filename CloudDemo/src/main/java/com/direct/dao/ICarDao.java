package com.direct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.direct.entity.CarBrand;
import com.direct.entity.CarInfo;
import com.direct.entity.CarType;

public interface ICarDao {
	
	//查询汽车品牌
	public List<CarBrand> queryCarBrand();
	public CarBrand queryCarBrandById(int id);
	public int insertCarBrand(CarBrand carBarand);
	public int updateCarBrand(CarBrand carBarand);
	public int deleteCarBrand(int id);
	
	//汽车类型
	public List<CarType> queryCarType();
	public CarType queryCarTypeByID(int id);
	public int insertCarType(CarType carType);
	public int updateCarType(CarType carType);
	public int deleteCarType(int id);
	
	//汽车配置信息
	public List<CarInfo> queryCarInfo();
	public CarInfo queryCarInfoById(int id);
	public int insertCarInfo(CarInfo carInfo);
	public int updateCarInfo(CarInfo carInfo);
	public int deleteCarInfo(int id);
	
}
