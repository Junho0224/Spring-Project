package org.zerock.mapper;
/* PostMapper  占쏙옙 占쏙옙 占쏙옙 占쏙옙 占쏙옙 */

import java.util.List;

import org.zerock.domain.PostVO;

public interface PostMapper {
   public List<PostVO> getList();
   public void insert(PostVO Post);
   public PostVO read(int post_id);
   public int delete(int post_id);
   public int update(PostVO Post);
   public int getCompleted();
}
