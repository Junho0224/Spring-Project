package org.zerock.domain;
/* 댓글과 댓글 수 처리 
	= 댓글의 페이징 처리가 필요한 경우에는 댓글 목록과 함께 전체 댓글의 수를 같이 전달해야만 함
	  => ReplyService 인터페이스, ReplyServiceImpl 구현 클래스를 댓글 수를 같이 전달할 수 있는 구조로 변경
	    => 댓글 페이지에 대한 정보를 전달하기 위한 클래스임
*/

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	private int replyCnt; // 댓글의 총 갯수
	private List<ReplyVO> list; // 댓글 목록 저장
	
}
