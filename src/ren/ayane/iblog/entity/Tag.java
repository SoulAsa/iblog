package ren.ayane.iblog.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Tag entity. @author MyEclipse Persistence Tools
 */

public class Tag implements java.io.Serializable {

	// Fields

	private Integer tagId;
	private String tagName;
	private Set articleTags = new HashSet(0);

	// Constructors

	/** default constructor */
	public Tag() {
	}
	
	public Tag(Integer tagId) {
		this.tagId = tagId;
	}

	/** minimal constructor */
	public Tag(Integer tagId, String tagName) {
		this.tagId = tagId;
		this.tagName = tagName;
	}

	/** full constructor */
	public Tag(Integer tagId, String tagName, Set articleTags) {
		this.tagId = tagId;
		this.tagName = tagName;
		this.articleTags = articleTags;
	}

	// Property accessors

	public Integer getTagId() {
		return this.tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return this.tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public Set getArticleTags() {
		return this.articleTags;
	}

	public void setArticleTags(Set articleTags) {
		this.articleTags = articleTags;
	}

}