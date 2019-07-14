package com.direct.dao;

import java.util.List;

import com.direct.entity.RepyEntity;
import com.direct.entity.ReservationSMSEntiry;

public interface IRepySMSDao {
	//添加预约信息
	public int insertrepysms(ReservationSMSEntiry r);
	//删除预约信息
	public int deleterepusms(int id);
	//查询预约信息
	public List<ReservationSMSEntiry> selesreservation();
	//单个预约
	public ReservationSMSEntiry seleByIdserva(int id);
	
	
	//消息回访
	public int inserterpy(RepyEntity r);
	//消息删除
	public int deleteerpy(int id);
	//消息查询
	public List<RepyEntity> selectrepy(int id);
	
}
