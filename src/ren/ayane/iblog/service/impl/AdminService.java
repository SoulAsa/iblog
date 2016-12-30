package ren.ayane.iblog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ren.ayane.iblog.dao.IAdminDao;
import ren.ayane.iblog.entity.Admin;
import ren.ayane.iblog.service.IAdminService;
import ren.ayane.core.service.impl.BaseService;

@Service("adminService")
public class AdminService extends BaseService<Admin> implements IAdminService {

	private IAdminDao adminDao;
	
	@Resource
	public void setAdminDao(IAdminDao adminDao) {
		super.setIBaseDao(adminDao);
		this.adminDao = adminDao;
	}
}
