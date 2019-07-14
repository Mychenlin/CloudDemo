package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.ICarDao;
import com.direct.dao.ICarInfoDao;
import com.direct.dao.ICarTypeDao;
import com.direct.entity.CarBrand;
import com.direct.entity.CarInfo;
import com.direct.entity.CarType;
import com.direct.entity.PageInfoEntity;
import com.direct.service.ICarService;
import com.direct.util.PageModel;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;
@Service("carService")
public class CarService implements ICarService {
	@Autowired
	public ICarDao icdao;
	
	@Autowired
	public ICarInfoDao icidao;
	
	@Autowired
	public ICarTypeDao ictdao;
	
	//汽车品牌
	public PageInfoEntity<CarBrand> selectCarBrand(int page,int rows) {
		//初始化分页的当前页数和显示条数
		Page pages = PageHelper.startPage(page, rows, true);
		List<CarBrand> cblist = icdao.queryCarBrand();
		int count = (int) pages.getTotal();
		PageInfoEntity<CarBrand> pie = new PageInfoEntity<>();
		pie.setCurrePage(page);
		pie.setSize(rows);
		pie.setSumCount(count);
		pie.setList(cblist);
		return pie;
	}

	public CarBrand selectCarBrandById(int id) {
		return icdao.queryCarBrandById(id);
	}

	public int addCarBrand(CarBrand carBarand) {
		return icdao.insertCarBrand(carBarand);
	}

	public int updateCarBrand(CarBrand carBarand) {
		return icdao.updateCarBrand(carBarand);
	}

	public int deleteCarBrand(int id) {
		return icdao.deleteCarBrand(id);
	}
	
	//汽车类型
	public PageModel<CarType> selectCarType(int curr, int size) {
		//初始化分页的当前页数和显示条数
		Page page = PageHelper.startPage(curr, size, true);
		//得到数据集合
		List<CarType> elist = ictdao.queryCarType();
		//得到总条数
		int count = (int)page.getTotal();
		//封装pm
		PageModel<CarType> pm=new PageModel<CarType>();
		pm.setCurrentPage(curr);
		pm.setSize(size);
		pm.setSumCount(count);
		pm.setList(elist);
		return pm;
	}

	public CarType selectCarTypeByID(int id) {
		return icdao.queryCarTypeByID(id);
	}

	public int addCarType(CarType carType) {
		return icdao.insertCarType(carType);
	}

	public int updateCarType(CarType carType) {
		return icdao.updateCarType(carType);
	}

	public int deleteCarType(int id) {
		return icdao.deleteCarType(id);
	}

	//汽车配置信息
	public PageModel<CarInfo> selectCarInfo(int curr, int size) {
		//初始化分页的当前页数和显示条数
		Page page = PageHelper.startPage(curr, size, true);
		//得到数据集合
		List<CarInfo> elist = icidao.queryCarInfo();
		
		//得到总条数
		int count = (int)page.getTotal();
		//封装pm
		PageModel<CarInfo> pm=new PageModel<CarInfo>();
		pm.setCurrentPage(curr);
		pm.setSize(size);
		pm.setSumCount(count);
		pm.setList(elist);
		return pm;
	}

	public CarInfo selectCarInfoById(int id) {
		return icidao.queryCarInfoById(id);
	}

	public int addCarInfo(CarInfo carInfo) {
		return icdao.insertCarInfo(carInfo);
	}

	public int updateCarInfo(CarInfo carInfo) {
		return icdao.updateCarInfo(carInfo);
	}

	public int deleteCarInfo(int id) {
		return icdao.deleteCarInfo(id);
	}
	
	
	//勿动
	public List<CarInfo> queryCar(){
		
		return icidao.queryCar();
		
	}
	
	

}
