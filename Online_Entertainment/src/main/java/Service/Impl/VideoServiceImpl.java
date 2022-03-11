package Service.Impl;

import java.util.List;

import com.poly.DAO.VideoDAO;
import com.poly.DAO.impl.VideoDaoImpl;
import com.poly.Entity.Video;

import Service.VideoService;

public class VideoServiceImpl implements VideoService{

	private VideoDAO dao;
	
	public VideoServiceImpl() {
		dao = new VideoDaoImpl();
	}
	
	@Override
	public Video findById(String id) {
		return dao.findById(id);
	}

	@Override
	public List<Video> findAll() {
		return dao.findAll();
	}

	@Override
	public Video insert(Video entity) {
		entity.setIsActive(Boolean.TRUE);
		entity.setViews(0);
		entity.setShare(0);
		return dao.insert(entity);
	}

	@Override
	public Video update(Video entity) {
		return dao.update(entity);
	}

	@Override
	public Video delete(String id) {
		Video entity = findById(id);
		entity.setIsActive(Boolean.FALSE);
		return dao.update(entity);
	}
	
}
