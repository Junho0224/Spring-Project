package org.zerock.domain;

import java.sql.Date;

import lombok.Data;
@Data
public class NoticeVO {
	private int notice_id;
	private String admin_name;
	private String title;
	private String content;
	private int important;
	private Date created_at;
}
