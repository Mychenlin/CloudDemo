package com.direct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.direct.dao.IApplyDao;
import com.direct.entity.ApplyEntity;
import com.direct.entity.ApplyInfo;
import com.direct.service.IApplyService;

@Service("applyService")
public class ApplyService implements IApplyService {

	@Autowired
	private IApplyDao iadao;
	
	public List<ApplyEntity> queryApplyInfo() {
		return iadao.selectApply();
	}

	public int addApplyInfo(ApplyEntity ai) {
		return iadao.insertApply(ai);
	}

	public int changeApplyInfo(ApplyEntity ai) {
		return iadao.updateApply(ai);
	}

}
