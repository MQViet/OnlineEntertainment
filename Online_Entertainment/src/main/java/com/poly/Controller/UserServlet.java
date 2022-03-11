package com.poly.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.Entity.User;
import com.poly.Utils.SessionA;

import Service.EmailService;
import Service.UserService;
import Service.Impl.EmailServiceImpl;
import Service.Impl.UserServiceImpl;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet(urlPatterns = { "/login", "/logout", "/register", "/forgotPass", "/changePassword" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserServiceImpl();
	private EmailService emailService = new EmailServiceImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		if (uri.contains("/login")) {
			this.doLogin(request, response);
		}
		if (uri.contains("/register")) {
			this.doRegister(request, response);
		}
		if (uri.contains("/forgotPass")) {
			this.doForgotPass(request, response);
		}
		if (uri.contains("/changePassword")) {
			this.doChangePass(session, request, response);
		}
		if (uri.contains("/logout")) {
			session.removeAttribute(SessionA.USER);
			response.sendRedirect("home");
		}

	}

	private void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String userId = request.getParameter("luser");
			String password = request.getParameter("lpassword");
			User user = userService.login(userId, password);
			if (user != null) {
				session.setAttribute(SessionA.USER, user);
				response.sendRedirect("home");
			} else {
				response.sendRedirect("home");
			}
		}
	}

	private void doRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String re_user = request.getParameter("re-user");
			String re_fullname = request.getParameter("re-fullname");
			String re_email = request.getParameter("re-email");
			String re_pass = request.getParameter("re-pass");
			String re_confirm = request.getParameter("re-confirm");
			if (re_pass.equals(re_confirm)) {
				User user = userService.insert(re_user, re_pass, re_email, re_fullname);
				if (user != null) {
					emailService.sendEMail(getServletContext(), user, "welcome");
					session.setAttribute(SessionA.USER, user);
					response.sendRedirect("home");
				} else {
					response.sendRedirect("home");
				}
			} else {
				request.setAttribute("errorsignup", "Xác nhận mật khẩu không đúng !");
			}
		}
	}

	private void doForgotPass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String email = request.getParameter("forgotmail");
			User newPass = userService.resetPass(email);
			if (newPass != null) {
				emailService.sendEMail(getServletContext(), newPass, "forgot");
				response.setStatus(204);
			} else {
				response.setStatus(400);
			}
		}
	}

	private void doChangePass(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String current = request.getParameter("currentPass");
			String newP = request.getParameter("currentPass");
			User currentUser = (User) session.getAttribute(SessionA.USER);

			if (currentUser.getPassword().equals(current)) {
				currentUser.setPassword(newP);
				User updateuUser = userService.update(currentUser);
				if (updateuUser != null) {
					session.setAttribute(SessionA.USER, updateuUser);
					response.setStatus(204);
				} else {
					response.setStatus(400);
				}
			} else {
				response.setStatus(400);
			}
		}
	}
}
