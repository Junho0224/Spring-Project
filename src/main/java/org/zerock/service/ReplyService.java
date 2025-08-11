package org.zerock.service;
/* ReplyService 인터페이스 = 서비스계층 */



import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;

public interface ReplyService {
	/* a. 등록 */
	public int register(ReplyVO vo);
	/* b. 댓글 가져오기 */
	public ReplyVO get(Long rno);
	/* c. 댓글 수정 */
	public int modify(ReplyVO vo);
	/* d. 댓글 삭제 */
	public int remove(Long rno);
	/* e. 해당 글 댓글 목록 */
	public List<ReplyVO> getList(Criteria cri, Long post_id); 
	
	public ReplyPageDTO getListPage(Criteria cri, Long post_id);
}
