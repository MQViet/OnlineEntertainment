package com.poly.DAO;

import java.util.List;

import dto.VideoLikeInfo;

public interface StatsDAO {

	List<VideoLikeInfo> findVideoLikeInfo();
}
