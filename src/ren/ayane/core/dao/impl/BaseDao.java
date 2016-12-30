package ren.ayane.core.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ren.ayane.core.dao.IBaseDao;
import ren.ayane.core.page.PageResult;
import ren.ayane.core.utils.QueryHelper;

public class BaseDao<T> extends HibernateDaoSupport implements IBaseDao<T> {

	private Class<T> clazz;
	
	public BaseDao() {
		// 使用反射得到T的真实类型
		// 获取当前new的对象的 泛型的父类 类型
		ParameterizedType pt = (ParameterizedType) getClass().getGenericSuperclass();
		// 获取第一个类型参数的真实类型
		this.clazz = (Class<T>) pt.getActualTypeArguments()[0];
	}

	
	@Override
	public void save(T entity) {
		getHibernateTemplate().save(entity);
		
	}

	@Override
	public void delete(Serializable id) {
		getHibernateTemplate().delete(findObjectById(id));
	}

	@Override
	public void update(T entity) {
		getHibernateTemplate().update(entity);
	}

	@Override
	public T findObjectById(Serializable id) {
		return getHibernateTemplate().get(clazz, id);
	}

	@Override
	public List<T> findObjects() {
		Query query = getSession().createQuery("FROM " + clazz.getSimpleName());
		return query.list();
	}
	
	@Override
	public List<T> findObjects(QueryHelper queryHelper) {
		Query query = getSession().createQuery(queryHelper.getListQueryHql());
		List<Object> parameters = queryHelper.getParameters();
		if (parameters != null && parameters.size() > 0) {
			for (int i = 0; i < parameters.size(); i++ ) {
				query.setParameter(i, parameters.get(i));
			}
		}
		return query.list();
	}

	@Override
	public PageResult getPageResult(QueryHelper queryHelper, int pageNo, int pageSize) {
		Query query = getSession().createQuery(queryHelper.getListQueryHql());
		List<Object> parameters = queryHelper.getParameters();
		if (parameters != null && parameters.size() > 0) {
			for (int i = 0; i < parameters.size(); i++ ) {
				query.setParameter(i, parameters.get(i));
			}
		}
		if (pageNo < 1) pageNo = 1;
		query.setFirstResult((pageNo - 1)*pageSize); // 设置数据起始索引号
		query.setMaxResults(pageSize);
		List items = query.list();
		// 获取总记录数
		Query queryCount = getSession().createQuery(queryHelper.getCountHql());
		if (parameters != null && parameters.size() > 0) {
			for (int i = 0; i < parameters.size(); i++ ) {
				queryCount.setParameter(i, parameters.get(i));
			}
		}
		long totalCount = (Long) queryCount.uniqueResult();
		return new PageResult(totalCount, pageNo, pageSize, items);
	}

}
