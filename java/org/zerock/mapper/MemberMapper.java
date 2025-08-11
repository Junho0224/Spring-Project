package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberMapper {
   public List<MemberVO> getList();
   
   public void delete(String member_id);
   
   public MemberVO read(String member_id);
   
   public void update(MemberVO member);
   
   public void insert(MemberVO member);
}