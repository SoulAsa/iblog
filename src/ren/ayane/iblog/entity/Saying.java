package ren.ayane.iblog.entity;

import java.sql.Timestamp;

/**
 * Saying entity. @author MyEclipse Persistence Tools
 */

public class Saying implements java.io.Serializable {

	// Fields

	private Integer sayId;
	private String content;
	private Timestamp createTime;

	// Constructors

	/** default constructor */
	public Saying() {
	}

	/** minimal constructor */
	public Saying(Integer sayId, String content) {
		this.sayId = sayId;
		this.content = content;
	}

	/** full constructor */
	public Saying(Integer sayId, String content, Timestamp createTime) {
		this.sayId = sayId;
		this.content = content;
		this.createTime = createTime;
	}

	// Property accessors

	public Integer getSayId() {
		return this.sayId;
	}

	public void setSayId(Integer sayId) {
		this.sayId = sayId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}