package ren.ayane.iblog.entity;

import java.util.Date;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

public class Admin implements java.io.Serializable {

	// Fields

	private AdminId id;
	private String name;
	private String iconHead;
	private Date birthday;
	private String hometown;
	private String work;
	private String signature;
	private String anime;
	private String music;
	private String about;
	private String attach;
	private String phone;
	private String city;
	private String skill;

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(AdminId id) {
		this.id = id;
	}

	/** full constructor */
	public Admin(AdminId id, String name, String iconHead, Date birthday,
			String hometown, String work, String signature, String anime,
			String music, String about, String attach, String phone,
			String city, String skill) {
		this.id = id;
		this.name = name;
		this.iconHead = iconHead;
		this.birthday = birthday;
		this.hometown = hometown;
		this.work = work;
		this.signature = signature;
		this.anime = anime;
		this.music = music;
		this.about = about;
		this.attach = attach;
		this.phone = phone;
		this.city = city;
		this.skill = skill;
	}

	// Property accessors

	public AdminId getId() {
		return this.id;
	}

	public void setId(AdminId id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIconHead() {
		return this.iconHead;
	}

	public void setIconHead(String iconHead) {
		this.iconHead = iconHead;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getHometown() {
		return this.hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public String getWork() {
		return this.work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getSignature() {
		return this.signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getAnime() {
		return this.anime;
	}

	public void setAnime(String anime) {
		this.anime = anime;
	}

	public String getMusic() {
		return this.music;
	}

	public void setMusic(String music) {
		this.music = music;
	}

	public String getAbout() {
		return this.about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getAttach() {
		return this.attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSkill() {
		return this.skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

}