-- 시큐리티기능
-- JDBC를 이용하기 위한 테이블 설정
-- 스프링 시큐리티에서 지정된 SQL을 그대로 이용하고 싶다면 지정된 형식으로 테이블을 생성해야 한다.
-- (주의) 무조건 users 테이블과 authorities 테이블 사용해야 함
DROP TABLE admin;
DROP TABLE admin_auth;
DROP SEQUENCE notice_seq;
DROP TABLE notice;
drop sequence seq_reply;
drop table tbl_reply;
drop SEQUENCE post_id_seq;
drop table post;
DROP SEQUENCE seq_member_id;
DROP TABLE member;


CREATE TABLE admin (
  username VARCHAR2(50) PRIMARY KEY,
  password VARCHAR2(100) NOT NULL,
  enabled CHAR(1) DEFAULT '1',
  admin_name VARCHAR2(50),
  email VARCHAR2(100),
  admin_id int NOT NULL
);
select* from admin;
CREATE SEQUENCE seq_admin_id
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
commit;
CREATE TABLE admin_auth (
  username VARCHAR2(50),
  role VARCHAR2(50),
  FOREIGN KEY (username) REFERENCES admin(username)
);
SELECT SEQUENCE_NAME FROM USER_SEQUENCES;
ALTER TABLE admin ADD CONSTRAINT admin_name_unique UNIQUE(admin_name);
INSERT INTO admin (username, password, enabled, admin_name, email, admin_id)
VALUES ('admin01', '1234', '1', '한문철', 'admin01@example.com', seq_admin_id.NEXTVAL);
INSERT INTO admin (username, password, enabled, admin_name, email, admin_id)
VALUES ('admin02', '1234', '1', '윤기봉', 'admin02@example.com', seq_admin_id.NEXTVAL);
-- 권한 정보 입력
INSERT INTO admin_auth (username, role)
VALUES ('admin01', 'ROLE_ADMIN');
INSERT INTO admin_auth (username, role)
VALUES ('admin02', 'ROLE_ADMIN');

SELECT * FROM admin WHERE username = 'admin02';
select * from admin;
select * from admin_auth;

commit;




--notice 테이블 생성
CREATE TABLE notice (
    notice_id    NUMBER PRIMARY KEY,             -- 공지 ID
    admin_name   VARCHAR2(50) NOT NULL,          -- 작성한 관리자 이름
    title        VARCHAR2(100) NOT NULL,         -- 제목
    content      CLOB NOT NULL,                  -- 내용
    important    NUMBER(1) DEFAULT 0 NOT NULL,   -- 중요공지 여부 (0: 일반, 1: 중요)
    created_at   DATE DEFAULT SYSDATE NOT NULL   -- 작성일
);

--notice 시퀀스 생성
CREATE SEQUENCE notice_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

--더미 데이터 삽입
INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '한문철', '아랏동 춤축제 홍보', '아랏동 춤축제가 9월 12일 개최됩니다. 많은 참여 바랍니다!', 1, TO_DATE('2025-09-10', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '박도라', '고양이 입양 이벤트 안내', '사랑스러운 고양이 입양 이벤트가 열립니다.', 0, TO_DATE('2025-08-22', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '김반장', '주민센터 냉방기 점검 공지', '냉방기 점검으로 인한 일시 사용 불가 안내입니다.', 1, TO_DATE('2025-07-15', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '최민정', '요가 교실 신규 모집!', '건강한 삶을 위한 요가 교실이 개강합니다.', 0, TO_DATE('2025-08-01', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '정재훈', '복지 신청 마감일 안내', '복지 신청 마감일은 8월 10일입니다. 기한 내 신청 부탁드립니다.', 1, TO_DATE('2025-07-20', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '이예린', '마을 벼룩시장 참여 신청', '마을 주민을 위한 벼룩시장에 참여하세요!', 0, TO_DATE('2025-07-25', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '남궁범', '음식물 쓰레기 분리 배출 안내', '음식물 쓰레기 배출 시 반드시 분리해주세요.', 1, TO_DATE('2025-07-14', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '류경수', '주민참여예산 공모 시작!', '2025년도 예산안에 참여할 수 있는 기회를 놓치지 마세요.', 0, TO_DATE('2025-08-05', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '오세은', '우리 동네 퀴즈 대회 개최', '다 함께 참여하는 퀴즈 대회! 상품도 있습니다.', 0, TO_DATE('2025-08-18', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '이강우', '밤길 안전 캠페인 안내', '야간 보행자 안전을 위한 캠페인을 진행합니다.', 0, TO_DATE('2025-07-30', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '송하늘', '어르신 스마트폰 교육 신청', '어르신들을 위한 스마트폰 기초 교육이 열립니다. 많은 신청 바랍니다.', 0, TO_DATE('2025-08-03', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '문다솜', '아랏동 그림대회 개최', '아이들을 위한 그림 대회가 열립니다. 창의력 넘치는 작품을 기다립니다.', 0, TO_DATE('2025-08-12', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '유성호', '정전 대비 가정용 랜턴 배포', '여름철 정전에 대비한 가정용 랜턴을 무료로 배포합니다.', 1, TO_DATE('2025-07-28', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '이주하', '아동 도서관 여름 독서 캠프', '아동 도서관에서 여름 독서 캠프가 진행됩니다. 책과 함께하는 여름을 보내세요!', 0, TO_DATE('2025-08-09', 'YYYY-MM-DD'));

INSERT INTO notice (notice_id, admin_name, title, content, important, created_at) VALUES 
(notice_seq.NEXTVAL, '박태우', '주차 단속 시간 변경 안내', '7월 25일부터 주차 단속 시간이 오전 9시~오후 7시로 변경됩니다.', 1, TO_DATE('2025-07-18', 'YYYY-MM-DD'));


--notice 테이블 확인
SELECT * FROM notice;

--주민등록기능
CREATE TABLE member (
    member_id   int NOT NULL,
    jumin       VARCHAR2(14) PRIMARY KEY,         -- 주민등록번호 (PK, 로그인 ID)
    name        VARCHAR2(50) NOT NULL,
    address     VARCHAR2(200),
    phone       VARCHAR2(20),
    email       VARCHAR2(100),
    reg_date    DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq_member_id
START WITH 1      
INCREMENT BY 1    
NOCACHE           
NOCYCLE; 

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9901011234567', '김민수', '서울시 강남구', '010-1111-0001', 'user01@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9802022234567', '이영희', '서울시 서초구', '010-1111-0002', 'user02@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9703031234567', '박지훈', '서울시 송파구', '010-1111-0003', 'user03@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9604042234567', '최은지', '서울시 노원구', '010-1111-0004', 'user04@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9505051234567', '정우성', '서울시 중랑구', '010-1111-0005', 'user05@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9406062234567', '한지민', '서울시 은평구', '010-1111-0006', 'user06@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9307071234567', '서강준', '서울시 종로구', '010-1111-0007', 'user07@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9208082234567', '고은아', '서울시 도봉구', '010-1111-0008', 'user08@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9109091234567', '장동건', '서울시 양천구', '010-1111-0009', 'user09@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '9001012234567', '윤아름', '서울시 구로구', '010-1111-0010', 'user10@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8902021234567', '노정열', '서울시 관악구', '010-1111-0011', 'user11@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8803032234567', '오세정', '서울시 강북구', '010-1111-0012', 'user12@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8704041234567', '박정아', '서울시 동작구', '010-1111-0013', 'user13@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8605052234567', '임수정', '서울시 마포구', '010-1111-0014', 'user14@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8506061234567', '김남길', '서울시 성북구', '010-1111-0015', 'user15@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8407072234567', '손예진', '서울시 서대문구', '010-1111-0016', 'user16@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8308081234567', '황민호', '서울시 용산구', '010-1111-0017', 'user17@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8209092234567', '이소라', '서울시 강서구', '010-1111-0018', 'user18@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8110101234567', '장기용', '서울시 중구', '010-1111-0019', 'user19@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '8001012234567', '유진', '서울시 동대문구', '010-1111-0020', 'user20@example.com');

INSERT INTO member (member_id, jumin, name, address, phone, email) VALUES 
(seq_member_id.nextval, '0104219876543', '박성준', '남양주 다산동', '010-1111-0001', 'user01@example.com');

commit;



--민원게시판기능
-- 게시글 테이블 (작성자 FK → jumin)

CREATE TABLE post (
    post_id     NUMBER PRIMARY KEY,
    jumin       VARCHAR2(14) NOT NULL,  -- 작성자 (FK → member.jumin)
    title       VARCHAR2(200) NOT NULL,
    content     CLOB NOT NULL,
    created_at  DATE DEFAULT SYSDATE,
    updated_at  DATE,
    category    VARCHAR2(50),
    completed   NUMBER NOT NULL, -- 민원처리 여부(0: 미처리, 1: 처리)
    CONSTRAINT fk_post_member
        FOREIGN KEY (jumin)
        REFERENCES member(jumin)
        ON DELETE CASCADE
);
-- 1. 시퀀스 생성 
CREATE SEQUENCE post_id_seq START WITH 1 INCREMENT BY 1;

-- post 더미데이터(주민 외래키 조건 만족함)
INSERT INTO post (post_id, jumin, title, content, created_at, updated_at, category, completed)
VALUES (post_id_seq.NEXTVAL, '9604042234567', '불법 주정차 단속 요청', '초등학교 앞 불법 주정차가 심각합니다.', SYSDATE, NULL, '교통', 1);

INSERT INTO post (post_id, jumin, title, content, created_at, category, completed)
VALUES (post_id_seq.NEXTVAL, '8001012234567', '주민등록등본 발급 문의', '온라인으로 등본 발급 가능한가요?', SYSDATE, '행정,서류', 0);

INSERT INTO post (post_id, jumin, title, content, created_at, category, completed)
VALUES (post_id_seq.NEXTVAL, '8605052234567', '재산세 납부기한 문의', '재산세 납부기한이 언제까지인가요?', SYSDATE, '세무', 1);

INSERT INTO post (post_id, jumin, title, content, created_at, category, completed)
VALUES (post_id_seq.NEXTVAL, '8001012234567', '버스 정류장 위치 변경 요청', '버스 정류장이 너무 멀어서 위치 변경 요청드립니다.', SYSDATE, '교통', 0);

INSERT INTO post (post_id, jumin, title, content, created_at, category, completed)
VALUES (post_id_seq.NEXTVAL, '9109091234567', '도로 파손 신고', '우리 동네 도로가 파손되어 위험합니다.', SYSDATE, '불편사항신고', 0);

INSERT INTO post (post_id, jumin, title, content, created_at, category, completed)
VALUES (post_id_seq.NEXTVAL, '9802022234567', '문화행사 문의', '이번 달 문화행사 일정이 궁금합니다.', SYSDATE, '기타', 1);
-- 대쉬보드기능
-- 전체 민원 게시글 수 불러오기
SELECT COUNT(*) AS post_count FROM post;

-- 댓글 테이블
create table tbl_reply (
  rno number(10,0), 
  post_id number(10,0) not null,
  reply varchar2(1000) not null,
  admin_name varchar2(50) not null, 
  replyDate date default sysdate, 
  updateDate date default sysdate
);
-- 시퀀스 만들기
create sequence seq_reply;
-- rno 기본키 만들기
alter table tbl_reply add constraint pk_reply primary key (rno);
-- 참조키명 만들기 , 참조키 bno와 게시판의 bno기본키와 연결
alter table tbl_reply  add constraint fk_reply_post
foreign key (post_id)  references  post (post_id); 

alter table tbl_reply  add constraint fk_reply_admin
foreign key (admin_name)  references  admin (admin_name); 

-- 댓글 더미 데이터 추가 (한문철 관리자, 게시글 1번에 대한 댓글)
INSERT INTO tbl_reply (rno, post_id, reply, admin_name)
VALUES (seq_reply.nextval, 1, '처리완료했습니다. 문의해주셔서 감사합니다.', '한문철');

commit;
-- 게시판 테이블에 bno 번호 확인
select * from post where rownum < 10 order by post_id desc;
-- 댓글 게시판 테스트 댓글 등록후 PK/FK 확인 쿼리
select * from tbl_reply order by rno desc;

-- tbl_reply 테이블에 bno 열을 내림차순으로, rno 열을 오름차순으로 정렬하는 idx_reply라는 인덱스를 생성
create index idx_reply on tbl_reply(post_id desc, rno asc);


commit;

select*from member;
select*from admin;
select*from post;
select*from tbl_reply;
select*from notice;
