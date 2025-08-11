package org.zerock.service;

import java.util.List;

import org.zerock.domain.PostVO;

public interface PostService {
     public List<PostVO> getList();
      
      public PostVO get(int post_id);
      
      public void register(PostVO post);
      
      public void delete(int post_id);
      
      public void update(PostVO post);
      
      public int getCompleted();
}
