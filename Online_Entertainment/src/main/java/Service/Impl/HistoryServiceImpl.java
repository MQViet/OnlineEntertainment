package Service.Impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.DAO.HistoryDAO;
import com.poly.DAO.impl.HistoryDaoImpl;
import com.poly.Entity.History;
import com.poly.Entity.User;
import com.poly.Entity.Video;

import Service.HistoryService;
import Service.VideoService;

public class HistoryServiceImpl implements HistoryService {

	private HistoryDAO dao;
	private VideoService videoService = new VideoServiceImpl();

	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}

	@Override
	public List<History> findByUser(String id) {
		return dao.findByUser(id);
	}

	@Override
	public List<History> findByUserLike(String id) {
		return dao.findByUserLike(id);
	}

	@Override
	public History findByUidAndVid(String userId, String videoId) {
		return dao.findByUidAndVid(userId, videoId);
	}

	@Override
	public History insert(User user, Video video) {
		History existhiHistory = findByUidAndVid(user.getId(), video.getId());
		if (existhiHistory == null) {
			existhiHistory = new History();
			existhiHistory.setUser(user);
			existhiHistory.setVideo(video);
			existhiHistory.setViewDate(new Timestamp(System.currentTimeMillis()));
			existhiHistory.setIsLiked(Boolean.FALSE);
			return dao.insert(existhiHistory);
		}
		return existhiHistory;
	}

	@Override
	public Boolean updateLike(User user, String videoid) {
		Video video = videoService.findById(videoid);
		History existHistory = findByUidAndVid(user.getId(), video.getId());
		if (existHistory.getIsLiked() == Boolean.FALSE) {
			existHistory.setIsLiked(Boolean.TRUE);
			existHistory.setIsLikeDate(new Timestamp(System.currentTimeMillis()));
		} else {
			existHistory.setIsLiked(Boolean.FALSE);
			existHistory.setIsLikeDate(null);
		}
		History updaHistory = dao.update(existHistory);
		return updaHistory != null ? true : false;
	}

}
