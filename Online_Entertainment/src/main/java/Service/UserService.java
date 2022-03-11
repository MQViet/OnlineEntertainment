package Service;

import java.util.List;

import com.poly.Entity.User;

public interface UserService {
	User findById(String id);
	User findByEmail(String email);
	User login(String user, String pass);
	User resetPass(String email);
	List<User> findAll();
	User insert(String id, String pass, String email, String fullname);
	User update(User entity);
	User delete(String id);
	List<User> findUsersLikedVideoByVideoId(String id);
}
