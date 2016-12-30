package ren.ayane.iblog.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Article entity. @author MyEclipse Persistence Tools
 */

public class Article implements java.io.Serializable {

	// Fields

	private Integer artId;
	private Category category;
	private String title;
	private String content;
	private String iconCover;
	private Timestamp createTime;
	private Timestamp modifyTime;
	private String keyword;
	private Integer readCount;
	private Boolean isFlag;
	private Set comments = new HashSet(0);
	private Set articleTags = new HashSet(0);

	// Constructors

	/** default constructor */
	public Article() {
	}

	/** minimal constructor */
	public Article(Integer artId, Category category, String title,
			Timestamp createTime, Boolean isFlag) {
		this.artId = artId;
		this.category = category;
		this.title = title;
		this.createTime = createTime;
		this.isFlag = isFlag;
	}

	/** full constructor */
	public Article(Integer artId, Category category, String title,
			String content, String iconCover, Timestamp createTime, Timestamp modifyTime,
			String keyword, Integer readCount, Boolean isFlag, Set comments,
			Set articleTags) {
		this.artId = artId;
		this.category = category;
		this.title = title;
		this.content = content;
		this.iconCover = iconCover;
		this.createTime = createTime;
		this.modifyTime = modifyTime;
		this.keyword = keyword;
		this.readCount = readCount;
		this.isFlag = isFlag;
		this.comments = comments;
		this.articleTags = articleTags;
	}

	// Property accessors

	public Integer getArtId() {
		return this.artId;
	}

	public void setArtId(Integer artId) {
		this.artId = artId;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIconCover() {
		return this.iconCover;
	}

	public void setIconCover(String iconCover) {
		this.iconCover = iconCover;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Timestamp modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getReadCount() {
		return this.readCount;
	}

	public void setReadCount(Integer readCount) {
		this.readCount = readCount;
	}

	public Boolean getIsFlag() {
		return this.isFlag;
	}

	public void setIsFlag(Boolean isFlag) {
		this.isFlag = isFlag;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

	public Set getArticleTags() {
		return this.articleTags;
	}

	public void setArticleTags(Set articleTags) {
		this.articleTags = articleTags;
	}

}