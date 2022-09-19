package com.poly.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttr;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.VideoService;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet({"/index", "/favorites", "/history"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int VIDEO_MAX_PAGE_SIZE = 3;

	private VideoServiceImpl videoService = new VideoServiceImpl();
	private HistoryServiceImpl historyService = new HistoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/index":
			doGetIndex(req, resp);
			break;
		case "/favorites":
			doGetFavorites(session, req, resp);
			break;
		case "/history":
			doGetHistory(session, req, resp);
			break;
		}
		
		
	}
	//localhost:8080/asm-java-4/index?page={page}

	protected void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Video> countVideo  = videoService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		List<Video> videos;

		String pageNumber = req.getParameter("page");
		if(pageNumber == null) {
			videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		}else {
			videos = videoService.findAll(Integer.valueOf(pageNumber),VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));


		}
		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/index.jsp");
		requestDispatcher.forward(req, resp);
//		req.getRequestDispatcher("/views/user/index.jsp").forward(req, resp);
		
	}
	protected void doGetFavorites(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		List<History> histories = historyService.findByUserAndIsLiked(user.getUsername());
		List<Video> videos = new ArrayList<>();
		histories.forEach(item -> videos.add(item.getVideo()));
		//for(int i = 0 ; i< histories.size();i++{
		// videos.add(histories.get(i).getVideo());}
		

		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/favorites.jsp");
		requestDispatcher.forward(req, resp);
//		req.getRequestDispatcher("/views/user/index.jsp").forward(req, resp);
		
	}
	protected void doGetHistory(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		List<History> histories = historyService.findByUser(user.getUsername());
		List<Video> videos = new ArrayList<>();
		histories.forEach(item -> videos.add(item.getVideo()));
		//for(int i = 0 ; i< histories.size();i++{
		// videos.add(histories.get(i).getVideo());}
		

		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/history.jsp");
		requestDispatcher.forward(req, resp);
//		req.getRequestDispatcher("/views/user/index.jsp").forward(req, resp);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
