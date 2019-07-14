package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.IRepySMSDao;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.RepyEntity;
import com.direct.entity.ReservationSMSEntiry;
import com.direct.service.IRepySMSService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service("RepySMSService")
public class RepySMSService implements IRepySMSService {

	@Autowired
	public IRepySMSDao irepyd;
	
	@Override
	public int insertrepysms(ReservationSMSEntiry r) {
		// TODO Auto-generated method stub
		return irepyd.insertrepysms(r);
	}

	@Override
	public int deleterepusms(int id) {
		return irepyd.deleterepusms(id);
	}

	@Override
	public PageInfoEntity<ReservationSMSEntiry> selesreservation(int curr,int size) {
		
		Page page=PageHelper.startPage(curr, size, true);
		List<ReservationSMSEntiry> list=irepyd.selesreservation();
		int sumcur=(int)page.getTotal();

		PageInfoEntity<ReservationSMSEntiry> pa=new PageInfoEntity<ReservationSMSEntiry>();
		pa.setCurrePage(curr);
		pa.setList(list);
		pa.setSize(size);
		pa.setSumCount(sumcur);
		
		return pa;
		
	}

	@Override
	public ReservationSMSEntiry seleByIdserva(int id) {
		// TODO Auto-generated method stub
		return irepyd.seleByIdserva(id);
	}

	@Override
	public int inserterpy(RepyEntity r) {
		// TODO Auto-generated method stub
		return irepyd.inserterpy(r);
	}

	@Override
	public int deleteerpy(int id) {
		// TODO Auto-generated method stub
		return irepyd.deleteerpy(id);
	}

	@Override
	public List<RepyEntity> selectrepy(int id) {

		List<RepyEntity> list=irepyd.selectrepy(id);

		return list;
		
		
	}

}
