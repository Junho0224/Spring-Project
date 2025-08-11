package org.zerock.service;

import java.util.List;

import org.zerock.domain.NoticeVO;

public interface NoticeService {
	// 공지 작성
	public void writeNotice(NoticeVO notice);
	// 공지 전제 목록 가져오기
	public List<NoticeVO> getNoticeList();
	// 공지 수정
	public void modifyNotice(NoticeVO notice);
	// 공지 상세
	public NoticeVO getNotice(int notice_id);
	// 공지 삭제
	public void removeNotice(int notice_id);
}
