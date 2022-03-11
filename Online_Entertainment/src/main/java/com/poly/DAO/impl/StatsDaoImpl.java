package com.poly.DAO.impl;

import java.util.ArrayList;
import java.util.List;

import com.poly.DAO.AbstractDAO;
import com.poly.DAO.StatsDAO;

import dto.VideoLikeInfo;

public class StatsDaoImpl extends AbstractDAO<Object[]> implements StatsDAO {

	@Override
	public List<VideoLikeInfo> findVideoLikeInfo() {
		String sql = "select v.Id, v.Title,v.Views, sum(cast(h.IsLiked as int)) as totalLikes from Videos v left join History h on v.Id = h.VideoId where v.IsActive = 1 group by v.Id, v.Title, v.Views order by sum(cast(h.IsLiked as int)) desc";
		List<Object[]> objects = super.findByNative(sql);
		List<VideoLikeInfo> result = new ArrayList<>();
		objects.forEach(Object -> {
			VideoLikeInfo videoLikeInfo = setData(Object);
			result.add(videoLikeInfo);
		});
		return result;
	}

	private VideoLikeInfo setData(Object[] object) {
		VideoLikeInfo videoLikeInfo = new VideoLikeInfo();
		videoLikeInfo.setVideoId((String) object[0]);
		videoLikeInfo.setTitle((String) object[1]);
		videoLikeInfo.setViews((Integer) object[2]);
		videoLikeInfo.setTotalLike(object[3] == null ? 0 : (Integer) object[3]);
		return videoLikeInfo;
	}
}
