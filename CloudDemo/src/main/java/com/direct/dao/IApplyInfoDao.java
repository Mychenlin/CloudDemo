package com.direct.dao;

import java.util.List;

import com.direct.entity.ApplyInfo;

public interface IApplyInfoDao {
	public List<ApplyInfo> selectApplyInfo();
	public int insertApplyInfo(ApplyInfo ai);
	public int updateApplyInfo(ApplyInfo ai);
}
