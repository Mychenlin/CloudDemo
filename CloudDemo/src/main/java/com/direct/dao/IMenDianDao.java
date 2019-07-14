package com.direct.dao;

import java.util.List;

import com.direct.entity.MenDianEntity;

public interface IMenDianDao {
	
	public int interMenDian(MenDianEntity m);
	public int updateMenDian(MenDianEntity m);
	public int deleteMenDian(int id);
	public List<MenDianEntity> seleMend(MenDianEntity m);
	public MenDianEntity seleMendById(int id);
	public List<MenDianEntity> seleMendss();
	
}
