package com.poly.Controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.Entity.User;
import com.poly.Utils.SessionA;

import Service.StatsService;
import Service.UserService;
import Service.Impl.StatsServiceImpl;
import Service.Impl.UserServiceImpl;
import dto.VideoLikeInfo;

@WebServlet(urlPatterns = { "/admin", "/admin/favorite" }, name = "HomeAdmin")
public class HomeAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StatsService statsService = new StatsServiceImpl();
	private UserService userService = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(SessionA.USER);
		String uri = request.getRequestURI();
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			if (uri.contains("/admin")) {
				this.home(request, response);
			}
			if (uri.contains("/admin/favorite")) {
				this.favorite(request, response);
			}
		} else {
			response.sendRedirect("home");
		}
	}

	private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<VideoLikeInfo> videoss = statsService.findVideoLikeInfo();
		request.setAttribute("videoss", videoss);
		request.getRequestDispatcher("/views/admin/homeAdmin.jsp").forward(request, response);
	}

	private void favorite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String videoId = request.getParameter("id");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		List<User> users = userService.findUsersLikedVideoByVideoId(videoId);
		if (users.isEmpty()) {
			response.setStatus(400);
		} else {
			ObjectMapper mapper = new ObjectMapper();
			String dataresponse = mapper.writeValueAsString(users);
			response.setStatus(200);
			out.print(dataresponse);
			out.flush();
		}
		request.getRequestDispatcher("/views/admin/homeAdmin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
