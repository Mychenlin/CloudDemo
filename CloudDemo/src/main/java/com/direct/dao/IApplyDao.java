package com.direct.dao;

import java.util.List;

import com.direct.entity.ApplyEntity;
import com.direct.entity.ApplyInfo;

public interface IApplyDao {
	public List<ApplyEntity> selectApply();
	public int insertApply(ApplyEntity ae);
	public int updateApply(ApplyEntity ae);
}
