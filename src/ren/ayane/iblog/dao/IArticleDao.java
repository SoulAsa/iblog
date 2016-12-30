package ren.ayane.iblog.dao;

import java.io.Serializable;
import java.util.List;

import ren.ayane.iblog.entity.Article;
import ren.ayane.iblog.entity.ArticleTag;
import ren.ayane.core.dao.IBaseDao;

public interface IArticleDao extends IBaseDao<Article> {

	// 保存文章标签
	void saveArticleTag(ArticleTag articleTag);
	// 根据文章删除该文章的所有标签
	void deleteArticleTagByArtId(Serializable id);
	// 根据文章ID获取该对应的所有标签
	List<ArticleTag> getArticleTagsByArtId(Integer artId);
	// 根据文章添加阅读量
	void addReadCountByArtId(Article article);
}
