package com.poly.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;

@NamedStoredProcedureQueries({
	@NamedStoredProcedureQuery (name = "User.FindListLikedbyVideoId",
			procedureName = "sp_selectUserLikedVideoByVideoId",
			resultClasses = {User.class}, parameters = @StoredProcedureParameter(name = "videoId", type = String.class))
})
@Entity
@Table(name = "Users")
public class User {
	@Id
	@Column(name = "Id")
	private String id;
	
	@Column(name = "Password")
	private String password;

	@Column(name = "Email")
	private String email;

	@Column(name = "Fullname")
	private String fullname;

	@Column(name = "isAdmin")
	private Boolean isAdmin;

	@Column(name = "isActive")
	private Boolean isActive;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
