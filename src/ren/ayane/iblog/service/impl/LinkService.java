package ren.ayane.iblog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ren.ayane.iblog.dao.ILinkDao;
import ren.ayane.iblog.entity.Link;
import ren.ayane.iblog.service.ILinkService;
import ren.ayane.core.service.impl.BaseService;

@Service("linkService")
public class LinkService extends BaseService<Link> implements ILinkService {

	private ILinkDao linkDao;
	
	@Resource
	public void setLinkDao(ILinkDao linkDao) {
		super.setIBaseDao(linkDao);
		this.linkDao = linkDao;
	}
}
