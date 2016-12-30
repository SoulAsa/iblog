package ren.ayane.iblog.entity;

/**
 * ArticleTag entity. @author MyEclipse Persistence Tools
 */

public class ArticleTag implements java.io.Serializable {

	// Fields

	private ArticleTagId id;

	// Constructors

	/** default constructor */
	public ArticleTag() {
	}

	/** full constructor */
	public ArticleTag(ArticleTagId id) {
		this.id = id;
	}

	// Property accessors

	public ArticleTagId getId() {
		return this.id;
	}

	public void setId(ArticleTagId id) {
		this.id = id;
	}

}