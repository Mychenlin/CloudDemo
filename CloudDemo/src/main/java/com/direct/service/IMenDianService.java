package com.direct.service;

import java.util.List;

import com.direct.entity.MenDianEntity;
import com.direct.entity.PageInfoEntity;

public interface IMenDianService {
	
	public int interMenDian(MenDianEntity m);
	public int updateMenDian(MenDianEntity m);
	public int deleteMenDian(int id);
	public PageInfoEntity<MenDianEntity> seleMend(int curr,int size,MenDianEntity m);
	public MenDianEntity seleMendById(int id);
	public List<MenDianEntity> seleMendss();

}
