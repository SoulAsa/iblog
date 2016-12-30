package ren.ayane.iblog.service;

import java.util.List;

import ren.ayane.iblog.entity.Article;
import ren.ayane.iblog.entity.ArticleTag;
import ren.ayane.core.service.IBaseService;

public interface IArticleService extends IBaseService<Article> {

	// 保存文章和标签
	void saveArticleAndTag(Article article, Integer ... tagIds);
	// 修改文章和标签
	void updateArticleAndTag(Article article, Integer ... tagIds);
	// 根据文章ID获取该对应的所有标签
	List<ArticleTag> getArticleTagsByArtId(Integer artId);
	// 根据文章添加阅读量
	void addReadCountByArtId(Article article);
}
