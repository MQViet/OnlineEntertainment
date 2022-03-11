package com.poly.DAO.impl;

import java.util.List;
import java.util.Map;

import com.poly.DAO.AbstractDAO;
import com.poly.DAO.UserDAO;
import com.poly.Entity.User;

public class UserDaoImpl extends AbstractDAO<User> implements UserDAO {

	@Override
	public User findById(String id) {
		String sql = "select o from User o where o.id = ?0";
		return super.findOne(User.class, sql, id);
	}

	@Override
	public User findByEmail(String email) {
		String sql = "select o from User o where o.email = ?0";
		return super.findOne(User.class, sql, email);
	}

	@Override
	public User findByLogin(String user, String pass) {
		String sql = "select o from User o where o.id = ?0 AND o.password = ?1";
		return super.findOne(User.class, sql, user, pass);
	}

	@Override
	public List<User> findAll() {
		return super.findAll(User.class, true);
	}

	@Override
	public List<User> findUsersLikedByVideoId(Map<String, Object> param) {
		
		return super.callStored("User.FindListLikedbyVideoId", param);
	}

}
