package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
   private int member_id;
   private String jumin;
   private String name;
   private String address;
   private String phone;
   private String email;
   private Date reg_date;
}
