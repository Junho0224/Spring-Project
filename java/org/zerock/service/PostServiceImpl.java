package org.zerock.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.PostVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.mapper.PostMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor 
public class PostServiceImpl implements PostService{
   @Setter(onMethod_ = @Autowired)
      private PostMapper mapper;
   
   @Override
   public List<PostVO> getList() {
      return mapper.getList();
   }

   @Override
   public PostVO get(int post_id) {
      return mapper.read(post_id);
   }

   @Override
   public void register(PostVO post) {
      mapper.insert(post);
   }

   @Override
   public void delete(int post_id) {
       mapper.delete(post_id);
   }

   @Override
   public void update(PostVO post) {
       mapper.update(post);
   }

   @Override
   public int getCompleted() {
	   return mapper.getCompleted();
}
   
}
