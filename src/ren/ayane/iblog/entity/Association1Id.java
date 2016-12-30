package ren.ayane.iblog.entity;

/**
 * Association1Id entity. @author MyEclipse Persistence Tools
 */

public class Association1Id implements java.io.Serializable {

	// Fields

	private Comment comment;
	private Comment comment_1;

	// Constructors

	/** default constructor */
	public Association1Id() {
	}

	/** full constructor */
	public Association1Id(Comment comment, Comment comment_1) {
		this.comment = comment;
		this.comment_1 = comment_1;
	}

	// Property accessors

	public Comment getComment() {
		return this.comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Comment getComment_1() {
		return this.comment_1;
	}

	public void setComment_1(Comment comment_1) {
		this.comment_1 = comment_1;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof Association1Id))
			return false;
		Association1Id castOther = (Association1Id) other;

		return ((this.getComment() == castOther.getComment()) || (this
				.getComment() != null && castOther.getComment() != null && this
				.getComment().equals(castOther.getComment())))
				&& ((this.getComment_1() == castOther.getComment_1()) || (this
						.getComment_1() != null
						&& castOther.getComment_1() != null && this
						.getComment_1().equals(castOther.getComment_1())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getComment() == null ? 0 : this.getComment().hashCode());
		result = 37 * result
				+ (getComment_1() == null ? 0 : this.getComment_1().hashCode());
		return result;
	}

}