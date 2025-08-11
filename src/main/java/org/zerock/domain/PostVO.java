package org.zerock.domain;

import java.util.Date;

import lombok.Data; // @Data는 @Getter, @Setter, @ToString 등을 포함해!

@Data // 
public class PostVO {
   private int post_id;


   private String jumin;
   private String title;
   private String content;
   private Date created_at;
   private Date updated_at;
   private String category;
   private int completed;

   // ⭐⭐ 추가! 마스킹된 주민등록번호를 반환하는 메서드를 만들어주자!
   public String getMaskedJumin() {
       if (jumin == null || jumin.trim().isEmpty()) {
           return ""; // 주민번호가 없으면 빈 문자열 반환
       }

       String cleanedJumin = jumin.replaceAll("[^0-9]", ""); // 숫자만 추출 (혹시 모를 하이픈 등 제거)

       if (cleanedJumin.length() == 13) {
           String frontSixDigits = cleanedJumin.substring(0, 6);
           String seventhDigit = cleanedJumin.substring(6, 7);
           // 마스킹 로직
           return frontSixDigits + "-" + seventhDigit + "******";
       } else {
           // 13자리가 아니면 (유효하지 않은 주민번호라면) 마스킹 없이 원본 반환 또는 다른 처리
           return jumin; // 예외 처리가 필요할 수도 있지만 일단 원본 반환
       }
   }
}