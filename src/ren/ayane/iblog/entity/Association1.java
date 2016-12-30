package ren.ayane.iblog.entity;

/**
 * Association1 entity. @author MyEclipse Persistence Tools
 */

public class Association1 implements java.io.Serializable {

	// Fields

	private Association1Id id;

	// Constructors

	/** default constructor */
	public Association1() {
	}

	/** full constructor */
	public Association1(Association1Id id) {
		this.id = id;
	}

	// Property accessors

	public Association1Id getId() {
		return this.id;
	}

	public void setId(Association1Id id) {
		this.id = id;
	}

}