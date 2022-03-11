package Service.Impl;

import javax.servlet.ServletContext;

import com.poly.Entity.User;
import com.poly.Utils.SendmailUtils;

import Service.EmailService;

public class EmailServiceImpl implements EmailService {

	private static final String EMAIL_WELLCOME = "Welcome to OnlineEntertainment";
	private static final String EMAIL_FORGOT_PASSWORD = "OnlineEntertainment - New password";

	@Override
	public void sendEMail(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome":
				subject = EMAIL_WELLCOME;
				content = "Dear " + recipient.getId() + ", Welcome to OnlineEntertainment page, wish you a happy movie watching";
				break;
			case "forgot":
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Dear " + recipient.getId() + ", your new password here : " + recipient.getPassword();
				break;
			default:
				subject = "OnlineEntertainment";
				content = "Maybe this email is wrong, don't care about it!";
			}
			SendmailUtils.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
