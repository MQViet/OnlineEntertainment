package com.poly.DAO.impl;

import java.util.List;

import com.poly.DAO.AbstractDAO;
import com.poly.DAO.VideoDAO;
import com.poly.Entity.Video;

public class VideoDaoImpl extends AbstractDAO<Video> implements VideoDAO{

	@Override
	public Video findById(String id) {
		return super.findById(Video.class, id);
	}

	@Override
	public List<Video> findAll() {
		return super.findAll(Video.class, true);
	}

}
