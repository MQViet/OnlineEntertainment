package com.poly.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.Entity.History;
import com.poly.Entity.User;
import com.poly.Entity.Video;
import com.poly.Utils.SessionA;

import Service.HistoryService;
import Service.VideoService;
import Service.Impl.HistoryServiceImpl;
import Service.Impl.VideoServiceImpl;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(urlPatterns = { "/home", "/video", "/favoriteAndHistory" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		if (uri.contains("/home")) {
			this.home(request, response);
		}
		if (uri.contains("/favoriteAndHistory")) {
			this.favoriteAndHistory(session, request, response);
		}
		if (uri.contains("/video")) {
			String actionParam = request.getParameter("action");
			String id = request.getParameter("id");
			switch (actionParam) {
			case "watch":
				this.watch(session, id, request, response);
				break;
			case "like":
				this.like(session, id, request, response);
				break;
			}
		}

	}

	private void favoriteAndHistory(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionA.USER);
		List<History> favorite = historyService.findByUserLike(user.getId());
		List<Video> videofa = new ArrayList<>();
		favorite.forEach(item -> videofa.add(item.getVideo()));
		request.setAttribute("videofa", videofa);

		List<History> histories = historyService.findByUser(user.getId());
		List<Video> videohis = new ArrayList<>();
		histories.forEach(item -> videohis.add(item.getVideo()));
		request.setAttribute("videohis", videohis);
		request.getRequestDispatcher("/views/favorite.jsp").forward(request, response);
	}

	private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Video> videos = videoService.findAll();
		request.setAttribute("videos", videos);
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	private void watch(HttpSession session, String id, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Video video = videoService.findById(id);
		request.setAttribute("video", video);
		User currentUser = (User) session.getAttribute(SessionA.USER);
		if (currentUser != null) {
			History history = historyService.insert(currentUser, video);
			request.setAttribute("like", history.getIsLiked());
		}
		request.getRequestDispatcher("/views/detail.jsp").forward(request, response);
	}

	private void like(HttpSession session, String id, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		User currentUser = (User) session.getAttribute(SessionA.USER);
		boolean result = historyService.updateLike(currentUser, id);
		if (result) {
			response.setStatus(204);
		} else {
			response.setStatus(400);
		}
	}

}
