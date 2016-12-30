package ren.ayane.iblog.entity;

/**
 * ArticleTagId entity. @author MyEclipse Persistence Tools
 */

public class ArticleTagId implements java.io.Serializable {

	// Fields

	private Article article;
	private Tag tag;

	// Constructors

	/** default constructor */
	public ArticleTagId() {
	}

	/** full constructor */
	public ArticleTagId(Article article, Tag tag) {
		this.article = article;
		this.tag = tag;
	}

	// Property accessors

	public Article getArticle() {
		return this.article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Tag getTag() {
		return this.tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ArticleTagId))
			return false;
		ArticleTagId castOther = (ArticleTagId) other;

		return ((this.getArticle() == castOther.getArticle()) || (this
				.getArticle() != null && castOther.getArticle() != null && this
				.getArticle().equals(castOther.getArticle())))
				&& ((this.getTag() == castOther.getTag()) || (this.getTag() != null
						&& castOther.getTag() != null && this.getTag().equals(
						castOther.getTag())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getArticle() == null ? 0 : this.getArticle().hashCode());
		result = 37 * result
				+ (getTag() == null ? 0 : this.getTag().hashCode());
		return result;
	}

}