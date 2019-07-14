package com.direct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.direct.entity.CarBrand;
import com.direct.entity.CarInfo;
import com.direct.entity.CarType;

public interface ICarTypeDao {
	
	//汽车类型
	public List<CarType> queryCarType();
	public CarType queryCarTypeByID(int id);
	public int insertCarType(CarType carType);
	public int updateCarType(CarType carType);
	public int deleteCarType(int id);
	
}
