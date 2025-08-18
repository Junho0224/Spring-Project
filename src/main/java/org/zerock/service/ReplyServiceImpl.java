package org.zerock.service;

import java.util.List;
/* ReplyService 구현 클래스 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register => " + vo);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get => " + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify => " + vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove => " + rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long post_id) {
		log.info("getList with criteria => " + post_id);
		return mapper.getListWithPaging(cri, post_id);
	}
	
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long post_id) {
		// 리턴 = 두개의 정보를 하나의 DTO 객체에 담아서 반환
		return new ReplyPageDTO(mapper.getCountByBno(post_id), // 댓글의 총 갯수
				// 파라미터 cri = 검색조건에 따른 페이지 번호, 페이지당 항목수 정보 | bno = 게시물 번호
				mapper.getListWithPaging(cri, post_id)); // 댓글 목록이 됨
	}
}
