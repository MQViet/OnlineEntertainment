package Service.Impl;

import java.util.List;

import com.poly.DAO.StatsDAO;
import com.poly.DAO.impl.StatsDaoImpl;

import Service.StatsService;
import dto.VideoLikeInfo;

public class StatsServiceImpl implements StatsService {

	private StatsDAO statsDAO;

	public StatsServiceImpl() {
		statsDAO = new StatsDaoImpl();
	}

	@Override
	public List<VideoLikeInfo> findVideoLikeInfo() {
		return statsDAO.findVideoLikeInfo();
	}

}
