package org.zerock.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
/* ReplyController 설계
 	= REST 방식으로 동작
 	= REST 방식 URL 설계시 PK 기준으로 작성하는 것이 좋음
 	  PK만으로 조회, 수정, 삭제가 가능하기 때문
 	= 다만, 댓글의 목록은 PK를 사용할 수 없기 때문에 파라미터로 게시물의 번호(bno)와 페이지번호(page)정보들을 URL에서 표현하는 방식 사용
 	#. REST 방식으로 처리시 주의할 점
 	  a. 브라우저나 외부에서 서버를 호출할 때
 	     데이터의 포맷과 서버에서 보내주는 데이터의 타입을 명확하게 설계해야 함
 	     (예시) 댓글 등록의 경우
 	       가. (브라우저) JSON타입으로 된 댓글 데이터를 서버에 전송
 	       나. (서버) 댓글의 처리 결과가 정상적으로 되었는지 문자열로 결과를 알려주도록 함
*/
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/replies/")
@AllArgsConstructor
public class ReplyController {
	@Setter(onMethod_ = {@Autowired})
	private ReplyService service;
	
	@PostMapping(value="/new", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplyVO => " + vo);
		int insertCount = service.register(vo);
		log.info("Reply INSERT COUNT => " + insertCount);
		// 삼항조건 연산자 = 댓글추가 유무에 따라서 200번 OK, 500번 Server Error 반환
		return insertCount == 1 ? new ResponseEntity<>("success 200",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	/* 테스트작업 = 크롬 YARC 사용 | select * from tbl_board 조회 후 실제 존재하는 bno번호로 테스트
	 	URL : http://localhost:8080/replies/new
	 	Payload : {"bno":27,"reply":"hello","replyer":"hj"}
	 	- bno는 실제 DB에있는 글번호
	 	- reply, replyer는 컬럼명
	 	Custom Headers : Content-Type application/json
	 	=> 테스트 성공시 200 OK
	 	=> select * from tbl_reply where bno = 27; => 실제 영속성 처리되었는지 확인 */
	
	/*
	 * @GetMapping(value="/pages/{bno}/{page}",
	 * produces={MediaType.APPLICATION_ATOM_XML_VALUE,
	 * MediaType.APPLICATION_JSON_UTF8_VALUE}) public ResponseEntity<List<ReplyVO>>
	 * getList(
	 * 
	 * @PathVariable("page") int page,
	 * 
	 * @PathVariable("bno") Long bno) {
	 * log.info("getList.............................."); // Criteria 통해 파라미터 수집
	 * {page}의 page값은 Criteria를 생성해서 직접 처리 Criteria cri = new Criteria(page, 10); //
	 * Criteria(pageNum=1, amount=10, type=null, keyword=null)
	 * log.info("Criteria의 page => " + cri); return new
	 * ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK); }
	 */
	/* (브라우저테스트) http://localhost:8080/replies/pages/1/1.json */
	
	@GetMapping(value="/{rno}", 
			produces={MediaType.APPLICATION_ATOM_XML_VALUE,
					  MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		log.info("get => " + rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	/* (브라우저테스트) http://localhost:8080/replies/11 */
	
	// 스프링에서 HTTP DELETE요청을 처리하는데 사용되는 어노테이션
	// RESTful 웹 서비스에서 자원을 삭제하기 위한 메서드에 적용
	@DeleteMapping(value="/{rno}", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		log.info("delete => " + rno);
		return service.remove(rno) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	/* 테스트작업 = 크롬 YARC 사용 | select * from tbl_board 조회 후 실제 존재하는 rno번호로 테스트
 	URL : http://localhost:8080/replies/6
 	- rno는 실제 DB에있는 글번호
 	Custom Headers : Content-Type application/json
 	=> 테스트 성공시 200 OK
 	=> 실제 영속성 처리되었는지 확인 */
	
	// JSON형태로 전달되는 데이터와 파라미터로 전달되는 댓글번호(rno)를 처리함
	// 수정 = PUT이나 PATCH 방식을 이용하여 처리
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
	         value = "/{rno}", // 댓글번호
	         consumes = "application/json", // 실제 수정되는 데이터는 JSON 포맷으로 설정 = @RequestBody 통해 처리
	         produces = { MediaType.TEXT_PLAIN_VALUE })
	   public ResponseEntity<String> modify(
	         @RequestBody ReplyVO vo,
	         @PathVariable("rno") Long rno) {
	      vo.setRno(rno); // 입력 파라미터 rno값 setter이용하여 수정
	      log.info("rno => " + rno);
	      log.info("modify => " + vo);
	      return service.modify(vo) == 1
	            ? new ResponseEntity<>("success", HttpStatus.OK)
	            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	/* (크롬 YARC 사용 테스트) 
	 	URL : http://localhost:8080/replies/6
	 	Payload : {"bno":1,"reply":"hellohello","replyer":"hj"}
	 	Custom Headers : Content-Type application/json
	 	=> 테스트 성공시 200 OK
 		=> 실제 영속성 처리되었는지 확인 */
	
	
	/* 위의 getList() 핸들러 주석처리 후 수정 */
	// 댓글 목록, 댓글 총 갯수 반환
	@GetMapping(value="/pages/{post_id}/{page}", produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	// 리턴타입 수정
	public ResponseEntity<ReplyPageDTO> getList(
			@PathVariable("post_id") Long post_id,
			@PathVariable("page") int page) {
		log.info("getList..............................");
		Criteria cri = new Criteria(page, 10);
		log.info("Criteria의 page => " + cri);
		// 리턴타입, getListPage 메서드명 수정
		return new ResponseEntity<>(service.getListPage(cri, post_id), HttpStatus.OK);
	}
	/* (브라우저테스트) http://localhost:8080/replies/pages/1/1.json
	 	= 기존과 동일하게 JSON 데이터를 전송하지만 ReplyPageDTO객체를 JSON으로 전송하게 됨
	 	  => 특정 게시물의 댓글 목록을 조회하면 replyCnt와 list라는 이름의 속성을 가지는 JSON문자열이 전송 */

}
