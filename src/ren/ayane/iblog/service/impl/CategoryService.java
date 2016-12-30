package ren.ayane.iblog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ren.ayane.iblog.dao.ICategoryDao;
import ren.ayane.iblog.entity.Category;
import ren.ayane.iblog.service.ICategoryService;
import ren.ayane.core.service.impl.BaseService;

@Service("categoryService")
public class CategoryService extends BaseService<Category> implements ICategoryService {

	private ICategoryDao categoryDao;
	
	@Resource
	public void setCategoryDao(ICategoryDao categoryDao) {
		super.setIBaseDao(categoryDao);
		this.categoryDao = categoryDao;
	}
}
