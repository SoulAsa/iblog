package ren.ayane.iblog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ren.ayane.iblog.dao.ICommentDao;
import ren.ayane.iblog.entity.Comment;
import ren.ayane.iblog.service.ICommentService;
import ren.ayane.core.service.impl.BaseService;

@Service("commentService")
public class CommentService extends BaseService<Comment> implements ICommentService {

	private ICommentDao commentDao;
	
	@Resource
	public void setCommentDao(ICommentDao commentDao) {
		super.setIBaseDao(commentDao);
		this.commentDao = commentDao;
	}
}
