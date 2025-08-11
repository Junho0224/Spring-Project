package org.zerock.domain;
/* pageNum과 amount값을 전달하는 용도의 클래스 + 검색 조건 추가 */

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	/* 검색 작업을 위해 추가 */
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	/* 검색 작업 메서드 추가 = 검색 조건이 각 글자(T,W,C)로 구성 -> 검색 조건을 배열로 만들어서 한번에 처리하기 위하여 만듦 
	 							=> 이 메서드를 이용해서 Mybatis의 동적 태그를 활용할 수 있음 */
	public String[] getTypeArr() {
		// 초깃값이 null이면 문자열 배열 생성하고, 값이 있으면 멤버변수 type에 넣어줌
		return type == null ? new String[] {} : type.split("");
	}
	
	
}
