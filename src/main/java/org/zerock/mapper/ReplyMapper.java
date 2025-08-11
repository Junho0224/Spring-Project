package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

/* Mapper 인터페이스 = 댓글도 페이징처리가 필요하므로 Criteria이용해 처리 */
public interface ReplyMapper {

	   /* a. 등록(create) */
	   public int insert(ReplyVO vo);
	   /* b. 조회(read) */
	   public ReplyVO read(Long rno); // 특정 댓글 읽기
	   /* c. 삭제(delete) = 댓글의 번호(rno)만으로 처리 */
	   public int delete(Long rno);
	   /* d. 수정(update) = 댓글의 내용(reply), 최종시간(updatedate) 수정 */
	   public int update(ReplyVO vo);
	   
	   /* 댓글목록 = @Param 사용
	       	= 댓글의 목록과 페이징처리는 기존 게시물 페이징 처리와 유사
	       	  => (추가적) 특정한 게시물의 댓글들만을 대상으로 하기 때문에 추가로 게시문의 글번호가 필요
	   		#. MyBatis에 두개이상의 데이터를 파라미터로 전달하는 방법으로 가장 편리한것 = @Param
	   		  = @Param의 속성값을 MyBatis에서 SQL로 이용할 때 #{}의 이름으로 사용이 가능함
	   */
	   public List<ReplyVO> getListWithPaging(
			   // XML로 처리할때 지정된 cri와 bno모두 사용 가능
			   @Param("cri") Criteria cri, // 페이징 처리를 기존과 동일하게 Criteria 이용
			   @Param("post_id") Long post_id); // 추가적으로 해당 게시물의 번호도 파라미터로 전달하도록 함
	   /* 댓글 숫자파악 = post_id에 해당하는 댓글 숫자 구하기 */
	   public int getCountByBno(Long post_id);
}
