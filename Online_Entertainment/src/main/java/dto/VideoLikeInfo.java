package dto;

public class VideoLikeInfo {

	private String videoId;
	private String title;
	private Integer views;
	private Integer totalLike;

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Integer getTotalLike() {
		return totalLike;
	}

	public void setTotalLike(Integer totalLike) {
		this.totalLike = totalLike;
	}

}
