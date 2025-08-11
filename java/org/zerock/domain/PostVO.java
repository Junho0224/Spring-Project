package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PostVO {
   private int post_id;
   private String jumin;
   private String title;
   private String content;
   private Date created_at;
   private Date updated_at;
   private String category;
   private int completed;
}