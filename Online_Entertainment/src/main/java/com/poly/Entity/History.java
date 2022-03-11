package com.poly.Entity;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "History")
public class History {

	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "UserId", referencedColumnName = "Id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	private User user;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "VideoId", referencedColumnName = "Id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	private Video video;

	@Column(name = "ViewedDate")
	@CreationTimestamp
	private Timestamp viewDate;

	@Column(name = "isLiked")
	private Boolean isLiked;

	@Column(name = "LikeDate")
	private Timestamp isLikeDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public Timestamp getViewDate() {
		return viewDate;
	}

	public void setViewDate(Timestamp viewDate) {
		this.viewDate = viewDate;
	}

	public Boolean getIsLiked() {
		return isLiked;
	}

	public void setIsLiked(Boolean isLiked) {
		this.isLiked = isLiked;
	}

	public Timestamp getIsLikeDate() {
		return isLikeDate;
	}

	public void setIsLikeDate(Timestamp isLikeDate) {
		this.isLikeDate = isLikeDate;
	}

}
