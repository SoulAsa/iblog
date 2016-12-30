package ren.ayane.iblog.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	// Fields

	private Integer cateId;
	private String cateName;
	private Set articles = new HashSet(0);

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** minimal constructor */
	public Category(Integer cateId, String cateName) {
		this.cateId = cateId;
		this.cateName = cateName;
	}

	/** full constructor */
	public Category(Integer cateId, String cateName, Set articles) {
		this.cateId = cateId;
		this.cateName = cateName;
		this.articles = articles;
	}

	// Property accessors

	public Integer getCateId() {
		return this.cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public String getCateName() {
		return this.cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public Set getArticles() {
		return this.articles;
	}

	public void setArticles(Set articles) {
		this.articles = articles;
	}

}