package com.poly.DAO;

import java.util.List;

import com.poly.Entity.History;

public interface HistoryDAO {

	List<History> findByUser(String id);

	List<History> findByUserLike(String id);

	History findByUidAndVid(String userId, String videoId);

	History insert(History entity);

	History update(History entity);
}
