package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;

/* MemberService 인터페이스 */
public interface MemberService {
   public List<MemberVO> getList();
   
   public MemberVO get(String member_id);
   
   public void register(MemberVO member);
   
   public void delete(String jumin);
   
   public void update(MemberVO member);
}
