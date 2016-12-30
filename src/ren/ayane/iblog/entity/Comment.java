package ren.ayane.iblog.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comment implements java.io.Serializable {

	// Fields

	private String commentId;
	private Comment comment;
	private Article article;
	private String userName;
	private String email;
	private String content;
	private Timestamp commentTime;
	private Set association1sForCommentId = new HashSet(0);
	private Set association1sForComCommentId = new HashSet(0);
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** minimal constructor */
	public Comment(String commentId, Article article, String userName,
			String email, String content) {
		this.commentId = commentId;
		this.article = article;
		this.userName = userName;
		this.email = email;
		this.content = content;
	}

	/** full constructor */
	public Comment(String commentId, Comment comment, Article article,
			String userName, String email, String content, Timestamp commentTime,
			Set association1sForCommentId, Set association1sForComCommentId,
			Set comments) {
		this.commentId = commentId;
		this.comment = comment;
		this.article = article;
		this.userName = userName;
		this.email = email;
		this.content = content;
		this.commentTime = commentTime;
		this.association1sForCommentId = association1sForCommentId;
		this.association1sForComCommentId = association1sForComCommentId;
		this.comments = comments;
	}

	// Property accessors

	public String getCommentId() {
		return this.commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public Comment getComment() {
		return this.comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Article getArticle() {
		return this.article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCommentTime() {
		return this.commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

	public Set getAssociation1sForCommentId() {
		return this.association1sForCommentId;
	}

	public void setAssociation1sForCommentId(Set association1sForCommentId) {
		this.association1sForCommentId = association1sForCommentId;
	}

	public Set getAssociation1sForComCommentId() {
		return this.association1sForComCommentId;
	}

	public void setAssociation1sForComCommentId(Set association1sForComCommentId) {
		this.association1sForComCommentId = association1sForComCommentId;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}