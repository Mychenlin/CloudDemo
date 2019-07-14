package com.direct.service;

import java.util.List;

import com.direct.entity.ApplyEntity;

public interface IApplyService {
	public List<ApplyEntity> queryApplyInfo();
	public int addApplyInfo(ApplyEntity ai);
	public int changeApplyInfo(ApplyEntity ai);
}
