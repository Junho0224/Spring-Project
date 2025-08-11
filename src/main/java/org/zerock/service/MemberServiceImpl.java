package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor 
public class MemberServiceImpl implements MemberService{
   @Setter(onMethod_ = @Autowired)
   private MemberMapper mapper;
   
   @Override
   public void register(MemberVO member) {
       log.info("register... " + member);
       mapper.insert(member);
   }
   
   @Override
   public List<MemberVO> getList() {
      log.info("getList => ");
      return mapper.getList();
   }
   
   @Autowired
   private MemberMapper memberMapper;

   @Override
   public void delete(String jumin) {
       memberMapper.delete(jumin);
   }
   
   @Override
   public MemberVO get(String member_id) {
       return mapper.read(member_id); // 예시. read라는 이름으로 구현해도 됨
   }
   
   @Override
   public void update(MemberVO member) {
       mapper.update(member);
   }
   
}
