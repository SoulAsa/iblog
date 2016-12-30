package ren.ayane.iblog.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;

import ren.ayane.iblog.dao.IArticleDao;
import ren.ayane.iblog.entity.Article;
import ren.ayane.iblog.entity.ArticleTag;
import ren.ayane.core.dao.impl.BaseDao;

public class ArticleDao extends BaseDao<Article> implements IArticleDao {

	@Override
	public void saveArticleTag(ArticleTag articleTag) {
		getHibernateTemplate().save(articleTag);
	}

	@Override
	public void deleteArticleTagByArtId(Serializable id) {
		Query query = getSession().createQuery("DELETE FROM ArticleTag WHERE id.article.artId = ?");
		query.setParameter(0, id);
		query.executeUpdate();		
	}

	@Override
	public List<ArticleTag> getArticleTagsByArtId(Integer artId) {
		Query query = getSession().createQuery("FROM ArticleTag WHERE id.article.artId = ?");
		query.setParameter(0, artId);
		return query.list();
	}

	@Override
	public void addReadCountByArtId(Article article) {
		Integer artId = article.getArtId();
		Integer readCount = article.getReadCount() + 1;
		Query query = getSession().createQuery("UPDATE Article SET readCount = ? WHERE artId = ?");
		query.setParameter(0, readCount);
		query.setParameter(1, artId);
		query.executeUpdate();
	}

}
