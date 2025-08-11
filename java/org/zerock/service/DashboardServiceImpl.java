package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.DashboardVO;
import org.zerock.domain.NoticeVO;
import org.zerock.domain.PostVO;
import org.zerock.mapper.DashboardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class DashboardServiceImpl implements DashboardService {
	@Autowired
	private DashboardMapper mapper;
	
	@Override
	public DashboardVO getDashboard() {
		log.info("getDashboard() 호출됨");
		int totalPostCount = mapper.getTotalPostCount();
		int pendingPostCount = mapper.getPendingPostCount();
		int completedPostCount  = mapper.getCompletedPostCount();
		List<Map<String, Object>> CompletedPostCountByCategory = mapper.getCompletedPostCountByCategory();
		List<Map<String, Object>> PostCountByCategory = mapper.getPostCountByCategory();
//		List<QnaVO> recentQnaList = mapper.getRecentQnaList(); // 댓글 추가시 개발
		List<PostVO> recentPosts = mapper.getRecentPosts();
		List<NoticeVO> recentNotices = mapper.getRecentNotices();
		log.info("totalPostCount = " + totalPostCount);
		log.info("pendingPostCount = " + pendingPostCount);
		log.info("completedPostCount = " + completedPostCount);
		log.info("CompletedPostCountByCategory = " + CompletedPostCountByCategory);
		log.info("PostCountByCategory = " + PostCountByCategory);
		log.info("recentPosts = " + recentPosts);
		log.info("recentNotices = " + recentNotices);
		DashboardVO dashborad = new DashboardVO(
				totalPostCount, pendingPostCount, completedPostCount, 
				CompletedPostCountByCategory, PostCountByCategory, 
				recentPosts, recentNotices);
		log.info("대쉬보드 -> " + dashborad);
		return dashborad;
	}

}
