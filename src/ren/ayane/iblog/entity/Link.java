package ren.ayane.iblog.entity;

/**
 * Link entity. @author MyEclipse Persistence Tools
 */

public class Link implements java.io.Serializable {

	// Fields

	private Integer linkId;
	private String linkName;
	private String url;
	private String iconLink;

	// Constructors

	/** default constructor */
	public Link() {
	}

	/** minimal constructor */
	public Link(Integer linkId, String linkName) {
		this.linkId = linkId;
		this.linkName = linkName;
	}

	/** full constructor */
	public Link(Integer linkId, String linkName, String url, String iconLink) {
		this.linkId = linkId;
		this.linkName = linkName;
		this.url = url;
		this.iconLink = iconLink;
	}

	// Property accessors

	public Integer getLinkId() {
		return this.linkId;
	}

	public void setLinkId(Integer linkId) {
		this.linkId = linkId;
	}

	public String getLinkName() {
		return this.linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIconLink() {
		return this.iconLink;
	}

	public void setIconLink(String iconLink) {
		this.iconLink = iconLink;
	}

}