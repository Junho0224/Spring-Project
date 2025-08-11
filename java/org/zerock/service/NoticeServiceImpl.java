package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.NoticeVO;
import org.zerock.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	private NoticeMapper mapper;
	
	@Override
	public void writeNotice(NoticeVO notice) {
		log.info("공지 작성 메서드 작동");
		mapper.insertNotice(notice);
	}

	@Override
	public List<NoticeVO> getNoticeList() {
		log.info("공지 리스트 가져오기 메서드 작동");
		return mapper.getNoticeList();
	}

	@Override
	public void modifyNotice(NoticeVO notice) {
		log.info("공지 수정 메서드 작동");
		mapper.updateNotice(notice);
	}

	@Override
	public NoticeVO getNotice(int notice_id) {
		log.info("공지 상세 메서드 작동");
		return mapper.readNotice(notice_id);
	}

	@Override
	public void removeNotice(int notice_id) {
		log.info("공지 삭제 메서드 작동");
		mapper.deleteNotice(notice_id);
	}

}
