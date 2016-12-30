package ren.ayane.core.service.impl;

import java.io.Serializable;
import java.util.List;

import ren.ayane.core.dao.IBaseDao;
import ren.ayane.core.page.PageResult;
import ren.ayane.core.service.IBaseService;
import ren.ayane.core.utils.QueryHelper;

public class BaseService<T> implements IBaseService<T> {

	private IBaseDao<T> baseDao;
	public void setIBaseDao(IBaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void save(T entity) {
		baseDao.save(entity);
	}

	@Override
	public void delete(Serializable id) {
		baseDao.delete(id);
	}

	@Override
	public void update(T entity) {
		baseDao.update(entity);
	}

	@Override
	public T findObjectById(Serializable id) {
		return baseDao.findObjectById(id);
	}

	@Override
	public List<T> findObjects() {
		return baseDao.findObjects();
	}
	
	@Override
	public List<T> findObjects(QueryHelper queryHelper) {
		return baseDao.findObjects(queryHelper);
	}

	@Override
	public PageResult getPageResult(QueryHelper queryHelper, int pageNo, int pageSize) {
		return baseDao.getPageResult(queryHelper, pageNo, pageSize);
	}
}
