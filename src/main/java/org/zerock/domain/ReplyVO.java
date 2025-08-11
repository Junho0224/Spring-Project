package org.zerock.domain;



import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno; 
	private Long post_id; 
	private String reply;
	private String admin_name;
	private Date replyDate; 
	private Date updateDate;
}
