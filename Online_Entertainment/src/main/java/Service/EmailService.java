package Service;

import javax.servlet.ServletContext;

import com.poly.Entity.User;

public interface EmailService {

	void sendEMail(ServletContext context, User recipient, String type);
}