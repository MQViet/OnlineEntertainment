package Service;

import java.util.List;

import dto.VideoLikeInfo;

public interface StatsService {

	List<VideoLikeInfo> findVideoLikeInfo();
	
}
