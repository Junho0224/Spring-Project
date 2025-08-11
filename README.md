# 주민센터 관리자 대시보드 스프링 프로젝트 (Java + Spring Legacy + Oracle)




관리자를 위한 민원/게시물/회원/댓글 관리 백오피스입니다.  
스프링 **Legacy MVC** 구조(Controller–Service–Mapper–View) 위에 **Spring Security** 인증/인가, **MyBatis** + **Oracle** 연동, **JSP/JSTL + Bootstrap** UI, **jQuery/Ajax** 기반의 비동기 댓글(Reply) 모듈, 페이징/검색/모달 등을 구현했습니다.

---

## 사용 기술
<p>
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=fff"/>
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=fff"/> 
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=fff"/> 
  <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=fff"/> 
  <img src="https://img.shields.io/badge/React-61DAFB?style=flat-square&logo=React&logoColor=fff"/>
  <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=spring&logoColor=fff"/>
</p>
<p>
  <img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=Oracle&logoColor=4479A1"/> 
  <img src="https://img.shields.io/badge/JAVA-8F0000?style=flat-square&logo=Java&logoColor=4479A1"/>
</p>
<p>
  <img src="https://img.shields.io/badge/Notion-ffffff?style=flat-square&logo=Notion&logoColor=black"/> 
  <img src="https://img.shields.io/badge/GitHub-gray?style=flat-square&logo=GitHub&logoColor=black"/> 
  <img src="https://img.shields.io/badge/Git-blue?style=flat-square&logo=Git&logoColor=F05032"/> 
  <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=flat-square&logo=visualstudiocode&logoColor=#007ACC"/> 
  <img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=flat-square&logo=eclipseide&logoColor=#fff"/> 
</p>

---

## 핵심 기능
- 🔐 **인증/인가**: Spring Security (로그인, 권한별 접근 제어)
- 📄 **게시물/민원 관리**: CRUD, 카테고리/상태, 다중 조건 검색, 페이지네이션
- 💬 **댓글(Reply) REST 모듈**: jQuery/Ajax로 비동기 등록/수정/삭제/조회
- 👥 **회원 관리**: 권한(Role) 기반, 활성/비활성, 최근 활동 로그
- 📊 **대시보드**: 통계 카드/차트(일간/주간/카테고리 분포)
- 🧰 **운영 편의**: 모달 기반 폼, 일괄 작업, 서버 로그(Log4j), 예외 처리 페이지

---

## 세부 설명

![Image](https://github.com/user-attachments/assets/39d091ce-1244-49d2-8658-1fefdb285482)
![Image](https://github.com/user-attachments/assets/68350e24-7f82-41e3-b0ce-899f290c2cfd)
![Image](https://github.com/user-attachments/assets/376c840f-f5e6-4d71-bc50-866a351a0fdd)
![Image](https://github.com/user-attachments/assets/eac85e12-d23d-45db-aa89-bd717d98966c)
![Image](https://github.com/user-attachments/assets/0d194330-e6d8-4cd1-8474-c33cfa038042)
![Image](https://github.com/user-attachments/assets/114d0775-76b1-402c-966f-aa2dc04f5550)
![Image](https://github.com/user-attachments/assets/2a6ffd54-585e-4c36-8d68-14bebd288584)
![Image](https://github.com/user-attachments/assets/c0f4ce69-8ee5-466f-baad-a967e0e0f00d)
![Image](https://github.com/user-attachments/assets/51d01921-6e33-4cc4-b193-337ec56b3b4d)
![Image](https://github.com/user-attachments/assets/0dd342fe-ac9d-41f0-b7f9-62f7d8f30bdb)
![Image](https://github.com/user-attachments/assets/fba1394f-d4d0-4391-89c3-7ac28486a360)
![Image](https://github.com/user-attachments/assets/4d6e382b-67b9-4fa4-abf4-7584679676e3)
![Image](https://github.com/user-attachments/assets/13645df5-9c65-4f41-90df-6b7917bd7e0f)
![Image](https://github.com/user-attachments/assets/3fe240a8-f7e7-43f8-b57f-3bb515f7a412)
![Image](https://github.com/user-attachments/assets/7a189ac8-6f13-4c28-8e1c-429169bfa03e)
![Image](https://github.com/user-attachments/assets/52adf094-376f-497d-bd99-136ad20ff6f7)
![Image](https://github.com/user-attachments/assets/1c4f1ffe-70d5-4540-9cc7-e522f62d45da)
![Image](https://github.com/user-attachments/assets/638f3e11-6152-405e-90dc-a6f090470fcc)
![Image](https://github.com/user-attachments/assets/fe087a39-e957-40e1-bc2e-7a8a5098966b)
![Image](https://github.com/user-attachments/assets/dedd7c62-ec11-4bc8-95c8-56b4f0b12ed3)
![Image](https://github.com/user-attachments/assets/17261059-2970-455b-955f-ef91b529f75c)
![Image](https://github.com/user-attachments/assets/3a54f665-ce0b-4e2e-8783-3bf93a8ad92d)

---

## 워크플로우

- **로그인 기능
<video src="https://github.com/user-attachments/assets/ab27b76e-b0a4-46d9-978c-4d604dea5c71" controls width="600"></video>**
- **대시보드 기능
<video src="https://github.com/user-attachments/assets/ca260186-5a54-45e0-8e0b-c5ac1fb408a8" controls width="600"></video>**
- **주민게시판 기능
<video src="https://github.com/user-attachments/assets/e3153ea0-fb7b-4fae-b9b7-3ef7b583faea" controls width="600"></video>**
- **민원게시판 기능
<video src="https://github.com/user-attachments/assets/5bcd9f68-4724-45ec-8d1e-a328ad1e3eb4" controls width="600"></video>**
- **민원사항 댓글 기능
<video src="https://github.com/user-attachments/assets/dfd67d4d-b534-4980-922e-499058f6deb5" controls width="600"></video>**
- **공지게시판 기능
<video src="https://github.com/user-attachments/assets/a1c209a0-56f0-4c48-8cd5-05f525bf94be" controls width="600"></video>**

---
