package com.direct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.direct.entity.CarBrand;
import com.direct.entity.CarInfo;
import com.direct.entity.CarType;

public interface ICarInfoDao {
	//汽车配置信息
	public List<CarInfo> queryCarInfo();
	public CarInfo queryCarInfoById(int id);
	public int insertCarInfo(CarInfo carInfo);
	public int updateCarInfo(CarInfo carInfo);
	public int deleteCarInfo(int id);
	
	//勿动
	public List<CarInfo> queryCar();
	
}
