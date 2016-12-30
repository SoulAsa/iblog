package ren.ayane.iblog.entity;

/**
 * AdminId entity. @author MyEclipse Persistence Tools
 */

public class AdminId implements java.io.Serializable {

	// Fields

	private String admin;
	private String pwd;

	// Constructors

	/** default constructor */
	public AdminId() {
	}

	/** full constructor */
	public AdminId(String admin, String pwd) {
		this.admin = admin;
		this.pwd = pwd;
	}

	// Property accessors

	public String getAdmin() {
		return this.admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AdminId))
			return false;
		AdminId castOther = (AdminId) other;

		return ((this.getAdmin() == castOther.getAdmin()) || (this.getAdmin() != null
				&& castOther.getAdmin() != null && this.getAdmin().equals(
				castOther.getAdmin())))
				&& ((this.getPwd() == castOther.getPwd()) || (this.getPwd() != null
						&& castOther.getPwd() != null && this.getPwd().equals(
						castOther.getPwd())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getAdmin() == null ? 0 : this.getAdmin().hashCode());
		result = 37 * result
				+ (getPwd() == null ? 0 : this.getPwd().hashCode());
		return result;
	}

}