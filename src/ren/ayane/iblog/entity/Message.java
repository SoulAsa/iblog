package ren.ayane.iblog.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	private String messageId;
	private Message message;
	private String userName;
	private String email;
	private String content;
	private Timestamp messageTime;
	private Set messages = new HashSet(0);

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** minimal constructor */
	public Message(String messageId, String userName, String email,
			String content) {
		this.messageId = messageId;
		this.userName = userName;
		this.email = email;
		this.content = content;
	}

	/** full constructor */
	public Message(String messageId, Message message, String userName,
			String email, String content, Timestamp messageTime, Set messages) {
		this.messageId = messageId;
		this.message = message;
		this.userName = userName;
		this.email = email;
		this.content = content;
		this.messageTime = messageTime;
		this.messages = messages;
	}

	// Property accessors

	public String getMessageId() {
		return this.messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}

	public Message getMessage() {
		return this.message;
	}

	public void setMessage(Message message) {
		this.message = message;
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

	public Timestamp getMessageTime() {
		return this.messageTime;
	}

	public void setMessageTime(Timestamp messageTime) {
		this.messageTime = messageTime;
	}

	public Set getMessages() {
		return this.messages;
	}

	public void setMessages(Set messages) {
		this.messages = messages;
	}

}