package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.IMenDianDao;
import com.direct.entity.MenDianEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.StaffionEntity;
import com.direct.service.IMenDianService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service("MenDianService")
public class MenDianService implements IMenDianService{

	@Autowired
	public IMenDianDao imendiandao;
	
	@Override
	public int interMenDian(MenDianEntity m) {
		// TODO Auto-generated method stub
		return imendiandao.interMenDian(m);
	}

	@Override
	public int updateMenDian(MenDianEntity m) {
		// TODO Auto-generated method stub
		return imendiandao.updateMenDian(m);
	}

	@Override
	public int deleteMenDian(int id) {
		// TODO Auto-generated method stub
		return imendiandao.deleteMenDian(id);
	}

	@Override
	public PageInfoEntity<MenDianEntity> seleMend(int curr, int size,MenDianEntity m) {

		Page page=PageHelper.startPage(curr, size, true);
		List<MenDianEntity> list=imendiandao.seleMend(m);
		int sumcur=(int)page.getTotal();

		PageInfoEntity<MenDianEntity> pa=new PageInfoEntity<MenDianEntity>();
		pa.setCurrePage(curr);
		pa.setList(list);
		pa.setSize(size);
		pa.setSumCount(sumcur);
		
		return pa;
		
		
	}

	@Override
	public MenDianEntity seleMendById(int id) {
		
		return imendiandao.seleMendById(id);
	}

	@Override
	public List<MenDianEntity> seleMendss() {
		// TODO Auto-generated method stub
		return imendiandao.seleMendss();
	}

}
