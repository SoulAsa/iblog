package ren.ayane.iblog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ren.ayane.iblog.dao.ISayingDao;
import ren.ayane.iblog.entity.Saying;
import ren.ayane.iblog.service.ISayingService;
import ren.ayane.core.service.impl.BaseService;

@Service("sayingService")
public class SayingService extends BaseService<Saying> implements ISayingService {

	private ISayingDao sayingDao;
	
	@Resource
	public void setSayingDao(ISayingDao sayingDao) {
		super.setIBaseDao(sayingDao);
		this.sayingDao = sayingDao;
	}

}
