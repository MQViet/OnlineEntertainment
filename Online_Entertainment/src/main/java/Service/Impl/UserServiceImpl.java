package Service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poly.DAO.UserDAO;
import com.poly.DAO.impl.UserDaoImpl;
import com.poly.Entity.User;

import Service.UserService;

public class UserServiceImpl implements UserService {

	private UserDAO dao;

	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}

	@Override
	public User findById(String id) {
		return dao.findById(id);
	}

	@Override
	public User findByEmail(String email) {
		return dao.findByEmail(email);
	}

	@Override
	public User login(String user, String pass) {
		return dao.findByLogin(user, pass);
	}

	@Override
	public User resetPass(String email) {
		User existUser = findByEmail(email);
		if (existUser != null) {
			String newPass = String.valueOf((int) (Math.random() * ((9999 - 1000) + 1)) + 1000);
			existUser.setPassword(newPass);
			return dao.update(existUser);
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		return dao.findAll();
	}

	@Override
	public User insert(String id, String pass, String email, String fullname) {
		User user = new User();
		user.setId(id);
		user.setPassword(pass);
		user.setEmail(email);
		user.setFullname(fullname);
		user.setIsAdmin(Boolean.FALSE);
		user.setIsActive(Boolean.TRUE);
		return dao.insert(user);
	}

	@Override
	public User update(User entity) {
		return dao.update(entity);
	}

	@Override
	public User delete(String id) {
		User user = dao.findById(id);
		user.setIsActive(Boolean.FALSE);
		return dao.update(user);
	}

	@Override
	public List<User> findUsersLikedVideoByVideoId(String id) {
		Map<String, Object> param = new HashMap<>();
		param.put("videoId", id);
		return dao.findUsersLikedByVideoId(param);
	}

}
