package ren.ayane.iblog.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ren.ayane.iblog.dao.IArticleDao;
import ren.ayane.iblog.entity.Article;
import ren.ayane.iblog.entity.ArticleTag;
import ren.ayane.iblog.entity.ArticleTagId;
import ren.ayane.iblog.entity.Tag;
import ren.ayane.iblog.service.IArticleService;
import ren.ayane.core.service.impl.BaseService;

@Service("articleService")
public class ArticleService extends BaseService<Article> implements IArticleService {

	private IArticleDao articleDao;
	
	@Resource
	public void setArticleDao(IArticleDao articleDao) {
		super.setIBaseDao(articleDao);
		this.articleDao = articleDao;
	}
	
	@Override
	public void saveArticleAndTag(Article article, Integer ... tagIds) {
		// 1. 保存文章
		save(article);
		// 2. 保存文章对应的标签
		if (tagIds != null) {
			for (Integer tagId : tagIds) {
				articleDao.saveArticleTag(new ArticleTag(new ArticleTagId(article, new Tag(tagId))));
			}
		}

	}

	@Override
	public void updateArticleAndTag(Article article, Integer... tagIds) {
		// 1. 根据文章删除该文章的所有标签
		articleDao.deleteArticleTagByArtId(article.getArtId());
		// 2. 更新文章
		update(article);
		// 3. 保存文章对应的标签
		if (tagIds != null) {
			for (Integer tagId : tagIds) {
				articleDao.saveArticleTag(new ArticleTag(new ArticleTagId(article, new Tag(tagId))));
			}
		}
	}

	@Override
	public List<ArticleTag> getArticleTagsByArtId(Integer artId) {
		
		return articleDao.getArticleTagsByArtId(artId);
	}

	@Override
	public void addReadCountByArtId(Article article) {
		articleDao.addReadCountByArtId(article);
	}
}
