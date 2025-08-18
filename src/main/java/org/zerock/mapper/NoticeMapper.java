package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.NoticeVO;

public interface NoticeMapper {
	// 공지 리스트 가져오기
	public List<NoticeVO> getNoticeList();
	// 공지 등록
	public void insertNotice(NoticeVO notice);
	// 공지 수정
	public void updateNotice(NoticeVO notice);
	// 공지 읽기
	public NoticeVO readNotice(int notice_id);
	// 공지 삭제
	public void deleteNotice(int notice_id);
}
