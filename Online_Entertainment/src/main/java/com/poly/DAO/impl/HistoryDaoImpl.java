package com.poly.DAO.impl;

import java.util.List;

import com.poly.DAO.AbstractDAO;
import com.poly.DAO.HistoryDAO;
import com.poly.Entity.History;

public class HistoryDaoImpl extends AbstractDAO<History> implements HistoryDAO {

	@Override
	public List<History> findByUser(String id) {
		String sqlString = "select o from History o where o.user.id = ?0 AND o.video.isActive = 1"
				+ " ORDER BY o.viewDate DESC";
		return super.findMany(History.class, sqlString, id);
	}

	@Override
	public List<History> findByUserLike(String id) {
		String sqlString = "select o from History o where o.user.id = ?0 AND o.isLiked = 1"
				+ " AND o.video.isActive = 1" + " ORDER BY o.viewDate DESC";
		return super.findMany(History.class, sqlString, id);
	}

	@Override
	public History findByUidAndVid(String userId, String videoId) {
		String sql = "select o from History o where o.user.id = ?0 AND o.video.id = ?1"
				+ " AND o.video.isActive = 1";
		return super.findOne(History.class, sql, userId, videoId);
	}

}
