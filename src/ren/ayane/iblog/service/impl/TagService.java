package ren.ayane.iblog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ren.ayane.iblog.dao.ITagDao;
import ren.ayane.iblog.entity.Tag;
import ren.ayane.iblog.service.ITagService;
import ren.ayane.core.service.impl.BaseService;

@Service("tagService")
public class TagService extends BaseService<Tag> implements ITagService {

	private ITagDao tagDao;
	
	@Resource
	public void setTagDao(ITagDao tagDao) {
		super.setIBaseDao(tagDao);
		this.tagDao = tagDao;
	}
}
