package com.poly.DAO;

import java.util.List;

import com.poly.Entity.Video;


public interface VideoDAO {
	Video findById(String id);
	List<Video> findAll();
	Video insert(Video entity);
	Video update(Video entity);
	Video delete(Video entity);
}
