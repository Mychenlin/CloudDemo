package com.direct.service;

import java.util.List;

import com.direct.entity.BranchEntity;
import com.direct.entity.PageInfoEntity;
import com.direct.entity.PositionEntity;
import com.direct.entity.StaffionEntity;

public interface IZhiYuanService {

		//部门回收
		public int updatebrete(int id);
		
		//职位回收
		public int updatepostion(int id);
		
		//员工回收
		public int updatestaff(int id);
		
		
		//部门查询
		public PageInfoEntity<BranchEntity> selectbra(int curr, int size,BranchEntity b);
		
		//职位查询
		public PageInfoEntity<PositionEntity>  selectpos(int curr, int size,PositionEntity b);
		
		//员工查询
		public PageInfoEntity<StaffionEntity> selecsta(int curr, int size,StaffionEntity b);
}
