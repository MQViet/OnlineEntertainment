package Service;

import java.util.List;

import com.poly.Entity.History;
import com.poly.Entity.User;
import com.poly.Entity.Video;

public interface HistoryService {

	List<History> findByUser(String id);

	List<History> findByUserLike(String id);

	History findByUidAndVid(String userId, String videoId);

	History insert(User user, Video video);

	Boolean updateLike(User user, String videoid);
}