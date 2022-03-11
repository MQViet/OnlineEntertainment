package Service;

import java.util.List;

import com.poly.Entity.Video;

public interface VideoService {
	Video findById(String id);

	List<Video> findAll();

	Video insert(Video entity);

	Video update(Video entity);

	Video delete(String id);
}
