package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.zerock.domain.NoticeVO;
import org.zerock.domain.PostVO;

public interface DashboardMapper {
	public int getTotalPostCount();
	public int getPendingPostCount();
	public int getCompletedPostCount();
	
	public List<Map<String, Object>> getCompletedPostCountByCategory();
	public List<Map<String, Object>> getPostCountByCategory();
	
	public List<PostVO> getRecentPosts();
	public List<NoticeVO> getRecentNotices();	
}
