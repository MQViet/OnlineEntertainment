package com.poly.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Videos")
public class Video {

	@Id
	@Column(name = "Id")
	private String id;

	@Column(name = "Title")
	private String title;

	@Column(name = "Poster")
	private String poster;

	@Column(name = "Views")
	private Integer views;

	@Column(name = "Shares")
	private Integer share;

	@Column(name = "Description")
	private String description;

	@Column(name = "isActive")
	private Boolean isActive;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Integer getShare() {
		return share;
	}

	public void setShare(Integer share) {
		this.share = share;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
