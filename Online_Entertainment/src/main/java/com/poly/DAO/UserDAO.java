package com.poly.DAO;

import java.util.List;
import java.util.Map;

import com.poly.Entity.User;

public interface UserDAO {

	User findById(String id);
	User findByEmail(String email);
	User findByLogin(String user, String pass);
	List<User> findAll();
	List<User> findUsersLikedByVideoId(Map<String, Object> param);
	User insert(User entity);
	User update(User entity);
	User delete(User entity);
}
