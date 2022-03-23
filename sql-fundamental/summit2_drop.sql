DROP TABLE C_EMP          CASCADE CONSTRAINTS;  
DROP TABLE EMP            CASCADE CONSTRAINTS; 
DROP TABLE PROFESSOR      CASCADE CONSTRAINTS;
DROP TABLE SAMPLE         CASCADE CONSTRAINTS;  
DROP TABLE STUDENT        CASCADE CONSTRAINTS;
DROP TABLE S_CUSTOMER     CASCADE CONSTRAINTS;  
DROP TABLE S_DEPT         CASCADE CONSTRAINTS; 
DROP TABLE S_EMP          CASCADE CONSTRAINTS;
DROP TABLE S_ITEM         CASCADE CONSTRAINTS;  
DROP TABLE S_ORD          CASCADE CONSTRAINTS;
DROP TABLE S_PRODUCT      CASCADE CONSTRAINTS;
DROP TABLE S_REGION       CASCADE CONSTRAINTS;
DROP TABLE SALGRADE;
DROP SYNONYM DEPT;
DROP VIEW EMPV;
DROP VIEW EMPVU113;
DROP VIEW SAM_VU;
DROP VIEW SA_VU;
DROP SEQUENCE C_EMP_ID ;

DROP SEQUENCE s_customer_id;
DROP SEQUENCE s_dept_id;
DROP SEQUENCE s_region_id;
DROP SEQUENCE s_product_id;
DROP SEQUENCE s_emp_id;
DROP SEQUENCE s_ord_id;







set feedback off
set echo off
prompt Creating and populating tables and sequences.  Please wait.

Rem Create sequences.
Rem    Starting values for sequences begin at the existing maxima for
Rem    existing primary key values, plus increments.

rem
rem alter session 
rem set nls_date_format = 'dd-mon-yy'
rem ;

alter session 
set nls_date_format = 'dd-MON-rr'
;



CREATE SEQUENCE s_ord_id
   MINVALUE 1
   MAXVALUE 9999999
   INCREMENT BY 1
   START WITH 113
   NOCACHE
   NOORDER
   NOCYCLE;

CREATE SEQUENCE s_product_id
   MINVALUE 1
   MAXVALUE 9999999
   INCREMENT BY 1
   START WITH 50537
   NOCACHE
   NOORDER
   NOCYCLE;


CREATE SEQUENCE s_region_id
   MINVALUE 1
   MAXVALUE 9999999
   INCREMENT BY 1
   START WITH 6
   NOCACHE
   NOORDER
   NOCYCLE;
   
CREATE SEQUENCE s_dept_id
   MINVALUE 1
   MAXVALUE 9999999
   INCREMENT BY 1
   START WITH 51
   NOCACHE
   NOORDER
   NOCYCLE;
   
CREATE SEQUENCE s_customer_id
   MINVALUE 1
   MAXVALUE 9999999
   INCREMENT BY 1
   START WITH 216
   NOCACHE
   NOORDER
   NOCYCLE;
  
CREATE SEQUENCE s_emp_id
   MINVALUE 1
   MAXVALUE 9999999
   INCREMENT BY 1
   START WITH 26
   NOCACHE
   NOORDER
   NOCYCLE;

CREATE TABLE s_customer
(id                         NUMBER(7)
   CONSTRAINT s_customer_id_nn NOT NULL,
 name                       VARCHAR2(50)
   CONSTRAINT s_customer_name_nn NOT NULL,
 phone                      VARCHAR2(25),
 address                    VARCHAR2(50),
 zip_code                   VARCHAR2(10),
 credit_rating              VARCHAR2(9),
 sales_rep_id               NUMBER(7),
 region_id                  NUMBER(7),
 comments                   VARCHAR2(100),
     CONSTRAINT s_customer_id_pk PRIMARY KEY (id),
     CONSTRAINT s_customer_credit_rating_ck
        CHECK (credit_rating IN ('우수', '양호', '불량')));

INSERT INTO s_customer VALUES (
   201, '신경화', '669-3147',
   '경기도 화성군 송산면 고정1리 540-2','445-870',
   '우수', 12, 2, '대체로 많은 양의 주문을 하는 고객으로 신용도도 높은 편.');
INSERT INTO s_customer VALUES (
   202, '서용만', '0331-280-7243',
   '경기도 용인시 기흥읍 농서리 산24', '449-900',
   '불량', 14, 2, '신용도 향상때까지 현금결제가 필요한 고객임.');
INSERT INTO s_customer VALUES (
   203, '정주영', '0342-718-8881',
   '경기도 성남시 분당구 구미동 79번지 까치마을', '463-500',
   '양호', 14, 2, '에어콘 전문 고객으로 성남에서 가장 큰 소매상을 운영하는 고객임.');
INSERT INTO s_customer VALUES (
   204, '전용호', '0571-821-5699',
   '경북 안동시 용상동 1234-5번지','305-770',
   '우수', 11, 5, NULL);
INSERT INTO s_customer VALUES (
   205, '한신동', '739-6242',
   '서울 종로구 수송동 81', '110-140',
   '우수', 15, 1, NULL);
INSERT INTO s_customer VALUES (
   206, '강원석', '594-1973',
   '서울 동작구 사당3동 183-2', '156-093',
   '우수', 15, 1, '냉장고를 특히 많이 구매하는 고객임.');
INSERT INTO s_customer VALUES (
   207, '고정환', '0331-200-8990',
   '경기도 수원시 팔달구 매탄3동 416번지', '442-742',
   '양호', NULL, 2, NULL);
INSERT INTO s_customer VALUES (
   208, '김영철', '966-4789',
   '서울 동대문구 회기동 101-6', '130-050',
   '양호', 15, 1, '가격이 싼 품목은 현금으로 비싼 품목은 신용카드로 결재하는 고객임.');
INSERT INTO s_customer VALUES (
   209, '정태웅', '0336-30-5981',
   '경기도 이천시 부발읍 아미리 산 139-1', '467-860',
   '우수', 11, 2, NULL);
INSERT INTO s_customer VALUES (
   210, '정진영', '3400-3409',
   '서울 송파구 가락동 80-3', '138-460',
   '우수', 12, 1, '전화통화가 어려우므로 우편으로 연락하기 바람.');
INSERT INTO s_customer VALUES (
   211, '최계윤', '032-511-8635',
   '인천시 부평구 갈산2동 400-5', '403-082',
   '우수', 15, 2, NULL);
INSERT INTO s_customer VALUES (
   212, '엄준식', '833-4572',
   '서울 영등포구 대림동 988-22', '150-071',
   '우수', 13, 1, NULL);
INSERT INTO s_customer VALUES (
   213, '노호현', '0331-280-2332',
   '경기도 용인시 기흥읍 서천리', '449-701',
   '우수', 11, 2, '신용도가 높은 고객임');
INSERT INTO s_customer VALUES (
   214, '장혁', '051-621-4306',
   '부산시 진구 범천 4동 1124', '614-021',
   '불량', 11, 5, NULL);
INSERT INTO s_customer VALUES (
   215, '장창식', '660-3277',
   '서울 강서구 공항동 291', '157-240',
   '불량', 15, 1, '결재가 까다로운 고객이므로 현금결재 요망.');
COMMIT;


CREATE TABLE s_dept
(id                         NUMBER(7)
   CONSTRAINT s_dept_id_nn NOT NULL,
 name                       VARCHAR2(25)
   CONSTRAINT s_dept_name_nn NOT NULL,
 region_id                  NUMBER(7),
     CONSTRAINT s_dept_id_pk PRIMARY KEY (id),
     CONSTRAINT s_dept_name_region_id_uk UNIQUE (name, region_id));

INSERT INTO s_dept VALUES (
   101, '총무부', 1);
INSERT INTO s_dept VALUES (
   102, '영업부', 1);
INSERT INTO s_dept VALUES (
   103, '영업부', 2);
INSERT INTO s_dept VALUES (
   104, '영업부', 3);
INSERT INTO s_dept VALUES (
   105, '영업부', 4);
INSERT INTO s_dept VALUES (
   106, '영업부', 5);
INSERT INTO s_dept VALUES (
   110, '기획부', 1);
INSERT INTO s_dept VALUES (
   111, '기획부', 2);
INSERT INTO s_dept VALUES (
   112, '기획부', 3);
INSERT INTO s_dept VALUES (
   113, '기획부', 4);
INSERT INTO s_dept VALUES (
   118, '인사부', 1);
COMMIT;


CREATE TABLE s_emp
(id                         NUMBER(7)
   CONSTRAINT s_emp_id_nn NOT NULL,
 name                  VARCHAR2(25)
   CONSTRAINT s_emp_name_nn NOT NULL,
 mailid                     VARCHAR2(8),
 start_date                 DATE,
 manager_id                 NUMBER(7),
 title                      VARCHAR2(25),
 dept_id                    NUMBER(7),
 salary                     NUMBER(11, 2),
 commission_pct             NUMBER(4, 2),
     CONSTRAINT s_emp_id_pk PRIMARY KEY (id),
     CONSTRAINT s_emp_userid_uk UNIQUE (mailid),
     CONSTRAINT s_emp_commission_pct_ck
        CHECK (commission_pct IN (10, 12.5, 15, 17.5, 20)));
COMMENT ON COLUMN s_emp.salary IS 'S_EMP 테이블의 급여의 단위는 천원임';
INSERT INTO s_emp VALUES (
  1, '박구곤', 'sky98',
   '03-MAR-90', NULL, '사장',
   118, 5000, NULL);
INSERT INTO s_emp VALUES (
   2, '손명성', '2xxsig',
   '08-MAR-90', 1, '기획부장',
   110, 3000, NULL);
INSERT INTO s_emp VALUES (
   3, '이은선', 'ch21175',
   '17-JUN-91', 1, '영업부장',
   102, 3500, NULL);
INSERT INTO s_emp VALUES (
   4, '서의홍', 'mquickto',
   '07-APR-90', 1, '총무부장',
   101, 3000, NULL);
INSERT INTO s_emp VALUES (
   5, '김심선', 'aropebur',
   '04-MAR-90', 1, '인사부장',
   118, 3200, NULL);
INSERT INTO s_emp VALUES (
   6, '전지영', 'murguhar',
   '18-JAN-91', 2, '과장',
   110, 2400, NULL);
INSERT INTO s_emp VALUES (
   7, '김정미', 'enchu',
   '14-MAY-90', 2, '과장',
   111, 2400, NULL);
INSERT INTO s_emp VALUES (
   8, '신기웅', 'bbiri',
   '07-APR-90', 2, '과장',
   112, 2100, NULL);
INSERT INTO s_emp VALUES (
   9, '이상헌', 'acatchpo',
   '09-FEB-92', 2, '과장',
   113, 2300, NULL);
INSERT INTO s_emp VALUES (
   10, '최순철', 'mhavel',
   '27-FEB-91', 2, '과장',
   113, 2300, NULL);
INSERT INTO s_emp VALUES (
   11, '최정선', 'cmagee',
   '14-MAY-90', 3, '영업대표이사',
   102, 2450, 10);
INSERT INTO s_emp VALUES (
   12, '안은경', 'hgiljum',
   '18-JAN-92', 3, '영업대표이사',
   103, 2500, 12.5);
INSERT INTO s_emp VALUES (
   13, '김석우', 'ysedeghi',
   '18-FEB-91', 3, '영업대표이사',
   104, 2650, 10);
INSERT INTO s_emp VALUES (
   14, '박성규', 'mnguyen',
   '22-JAN-92', 3, '영업대표이사',
   105, 2650, 15);
INSERT INTO s_emp VALUES (
   15, '신종필', 'adumas',
   '09-OCT-91', 3, '영업대표이사',
   106, 2400, 17.5);
INSERT INTO s_emp VALUES (
   16, '이기철', 'emaduro',
   '07-FEB-92', 6, '사원',
   110, 2400, NULL);
INSERT INTO s_emp VALUES (
   17, '구원상', 'gsmith',
   '08-MAR-90', 6, '사원',
   110, 940, NULL);
INSERT INTO s_emp VALUES (
   18, '서정주', 'anozaki',
   '09-FEB-91', 7, '사원',
   111, 1200, NULL);
INSERT INTO s_emp VALUES (
   19, '안창환', 'vpatel',
   '06-AUG-91', 7, '사원',
   111, 795, NULL);
INSERT INTO s_emp VALUES (
   20, '윤정숙', 'cnewman',
   '21-JUL-91', 8, '사원',
   112, 750, NULL);
INSERT INTO s_emp VALUES (
   21, '장현철','amarkari',
   '26-MAY-91', 8, '사원',
   112, 850, NULL);
INSERT INTO s_emp VALUES (
   22, '장혜숙', 'echang',
   '30-NOV-90', 9, '사원',
   113, 800, NULL);
INSERT INTO s_emp VALUES (
   23, '강연범', 'rpatel',
   '17-OCT-90', 9, '사원',
   106, 795, NULL);
INSERT INTO s_emp VALUES (
   24, '오은경', 'bdancs',
   '17-MAR-91', 10, '사원',
   113, 860, NULL);
INSERT INTO s_emp VALUES (
   25, '이용호', 'sschwart',
   '09-MAY-91', 10, '사원',
   113, 1100, NULL);
COMMIT;


CREATE TABLE s_item
(ord_id                     NUMBER(7)
   CONSTRAINT s_item_ord_id_nn NOT NULL,
 item_id                    NUMBER(7)
   CONSTRAINT s_item_item_id_nn NOT NULL,
 product_id                 NUMBER(7)
   CONSTRAINT s_item_product_id_nn NOT NULL,
 price                      NUMBER(11, 2),
 quantity                   NUMBER(9),
     CONSTRAINT s_item_ordid_itemid_pk PRIMARY KEY (ord_id, item_id),
     CONSTRAINT s_item_ordid_prodid_uk UNIQUE (ord_id, product_id));

INSERT INTO s_item VALUES (
   100, 1, 10011, 135, 500);
INSERT INTO s_item VALUES (
   100, 2, 10013, 380, 400);
INSERT INTO s_item VALUES (
   100, 3, 10021, 14, 500);
INSERT INTO s_item VALUES (
   100, 5, 30326, 582, 600);
INSERT INTO s_item VALUES (
   100, 7, 41010, 8, 250);
INSERT INTO s_item VALUES (
   100, 6, 30433, 20, 450);
INSERT INTO s_item VALUES (
   100, 4, 10023, 36, 400);
INSERT INTO s_item VALUES (
   101, 1, 30421, 16, 15);
INSERT INTO s_item VALUES (
   101, 3, 41010, 8, 20);
INSERT INTO s_item VALUES (
   101, 5, 50169, 4.29, 40);
INSERT INTO s_item VALUES (
   101, 6, 50417, 80, 27);
INSERT INTO s_item VALUES (
   101, 7, 50530, 45, 50);
INSERT INTO s_item VALUES (
   101, 4, 41100, 45, 35);
INSERT INTO s_item VALUES (
   101, 2, 40422, 50, 30);
INSERT INTO s_item VALUES (
   102, 1, 20108, 28, 100);
INSERT INTO s_item VALUES (
   102, 2, 20201, 123, 45);
INSERT INTO s_item VALUES (
   103, 1, 30433, 20, 15);
INSERT INTO s_item VALUES (
   103, 2, 32779, 7, 11);
INSERT INTO s_item VALUES (
   104, 1, 20510, 9, 7);
INSERT INTO s_item VALUES (
   104, 4, 30421, 16, 35);
INSERT INTO s_item VALUES (
   104, 2, 20512, 8, 12);
INSERT INTO s_item VALUES (
   104, 3, 30321, 1669, 19);
INSERT INTO s_item VALUES (
   105, 1, 50273, 22.89, 16);
INSERT INTO s_item VALUES (
   105, 3, 50532, 47, 28);
INSERT INTO s_item VALUES (
   105, 2, 50419, 80, 13);
INSERT INTO s_item VALUES (
   106, 1, 20108, 28, 46);
INSERT INTO s_item VALUES (
   106, 4, 50273, 22.89, 75);
INSERT INTO s_item VALUES (
   106, 5, 50418, 75, 98);
INSERT INTO s_item VALUES (
   106, 6, 50419, 80, 27);
INSERT INTO s_item VALUES (
   106, 2, 20201, 123, 21);
INSERT INTO s_item VALUES (
   106, 3, 50169, 4.29, 125);
INSERT INTO s_item VALUES (
   107, 1, 20106, 11, 50);
INSERT INTO s_item VALUES (
   107, 3, 20201, 115, 130);
INSERT INTO s_item VALUES (
   107, 5, 30421, 16, 55);
INSERT INTO s_item VALUES (
   107, 4, 30321, 1669, 75);
INSERT INTO s_item VALUES (
   107, 2, 20108, 28, 22);
INSERT INTO s_item VALUES (
   108, 1, 20510, 9, 9);
INSERT INTO s_item VALUES (
   108, 6, 41080, 35, 50);
INSERT INTO s_item VALUES (
   108, 7, 41100, 45, 42);
INSERT INTO s_item VALUES (
   108, 5, 32861, 60, 57);
INSERT INTO s_item VALUES (
   108, 2, 20512, 8, 18);
INSERT INTO s_item VALUES (
   108, 4, 32779, 7, 60);
INSERT INTO s_item VALUES (
   108, 3, 30321, 1669, 85);
INSERT INTO s_item VALUES (
   109, 1, 10011, 140, 150);
INSERT INTO s_item VALUES (
   109, 5, 30426, 18, 500);
INSERT INTO s_item VALUES (
   109, 7, 50418, 75, 43);
INSERT INTO s_item VALUES (
   109, 6, 32861, 60, 50);
INSERT INTO s_item VALUES (
   109, 4, 30326, 582, 1500);
INSERT INTO s_item VALUES (
   109, 2, 10012, 175, 600);
INSERT INTO s_item VALUES (
   109, 3, 10022, 21, 300);
INSERT INTO s_item VALUES (
   110, 1, 50273, 22, 17);
INSERT INTO s_item VALUES (
   110, 2, 50536, 50, 23);
INSERT INTO s_item VALUES (
   111, 1, 40421, 65, 27);
INSERT INTO s_item VALUES (
   111, 2, 41080, 35, 29);
INSERT INTO s_item VALUES (
   97, 1, 20106, 9, 1000);
INSERT INTO s_item VALUES (
   97, 2, 30321, 1500, 50);
INSERT INTO s_item VALUES (
   98, 1, 40421, 85, 7);
INSERT INTO s_item VALUES (
   99, 1, 20510, 9, 18);
INSERT INTO s_item VALUES (
   99, 2, 20512, 8, 25);
INSERT INTO s_item VALUES (
   99, 3, 50417, 80, 53);
INSERT INTO s_item VALUES (
   99, 4, 50530, 45, 69);
INSERT INTO s_item VALUES (
   112, 1, 20106, 11, 50);
COMMIT;


CREATE TABLE s_ord
(id                         NUMBER(7)
   CONSTRAINT s_ord_id_nn NOT NULL,
 customer_id                NUMBER(7)
   CONSTRAINT s_ord_customer_id_nn NOT NULL,
 date_ordered               DATE,
 sales_rep_id               NUMBER(7),
 total                      NUMBER(11, 2),
 payment_type               VARCHAR2(6),
     CONSTRAINT s_ord_id_pk PRIMARY KEY (id),
     CONSTRAINT s_ord_payment_type_ck
        CHECK (payment_type in ('현금', '카드')));

INSERT INTO s_ord VALUES (
   100, 204, '31-AUG-92', 
   11, 60110000, '카드');
INSERT INTO s_ord VALUES (
   101, 205, '31-AUG-92', 
   14, 805600, '카드');
INSERT INTO s_ord VALUES (
   102, 206, '01-SEP-92', 
   15, 833500, '카드');
INSERT INTO s_ord VALUES (
   103, 208, '02-SEP-92', 
   15, 377000, '현금');
INSERT INTO s_ord VALUES (
   104, 208, '03-SEP-92', 
   15, 3243000, '카드');
INSERT INTO s_ord VALUES (
   105, 209, '04-SEP-92', 
   11, 2722000, '카드');
INSERT INTO s_ord VALUES (
   106, 210, '07-SEP-92', 
   12, 15634000, '카드');
INSERT INTO s_ord VALUES (
   107, 211, '07-SEP-92', 
   15, 14217100, '카드');
INSERT INTO s_ord VALUES (
   108, 212, '07-SEP-92', 
   13, 14957000, '카드');
INSERT INTO s_ord VALUES (
   109, 213, '08-SEP-92', 
   11, 102093500, '카드');
INSERT INTO s_ord VALUES (
   110, 214, '09-SEP-92', 
   11, 1539000, '현금');
INSERT INTO s_ord VALUES (
   111, 204, '09-SEP-92', 
   11, 2770000, '현금');
INSERT INTO s_ord VALUES (
   97, 201, '28-AUG-92', 
   12, 8400000, '카드');
INSERT INTO s_ord VALUES (
   98, 202, '31-AUG-92', 
   14, 5950000, '현금');
INSERT INTO s_ord VALUES (
   99, 203, '31-AUG-92', 
   14, 7707000, '카드');
INSERT INTO s_ord VALUES (
   112, 210, '31-AUG-92', 
   12, 550000, '카드');
COMMIT;


CREATE TABLE s_product
(id                         NUMBER(7)
   CONSTRAINT s_product_id_nn NOT NULL,
 name                       VARCHAR2(50)
   CONSTRAINT s_product_name_nn NOT NULL,
 short_desc                 VARCHAR2(255),
     CONSTRAINT s_product_id_pk PRIMARY KEY (id),
     CONSTRAINT s_product_name_uk UNIQUE (name));

INSERT INTO s_product VALUES (
   10011, '명품플러스원',
   '한글자막 안내기능/통합리모컨/고화질 콤필터/TV');
INSERT INTO s_product VALUES (
   10012, '장수명브라운관',
   '기존 브라운관 수명의 3배/TV');
INSERT INTO s_product VALUES (
   10013, '절약형',
   '초절전버튼/자기진단기능/TV');
INSERT INTO s_product VALUES (
   10021, '액정와이드프로젝션',
   '고화질시네마비젼/초슬림디자인/TV');
INSERT INTO s_product VALUES (
   10022, '시네마비젼',
   '첨단 박막 액정소자 사용/초슬림디자인/TV');
INSERT INTO s_product VALUES (
   10023, '커플',
   'S-VHS간이재생/TV');
INSERT INTO s_product VALUES (
   20106, '고감도헤드',
   '고감도 다이아몬드 헤드 채용/VTR');
INSERT INTO s_product VALUES (
   20108, '미니미니',
   '3차원 서라운드기능/3모드 프르세트이퀄라이저/오디오');
INSERT INTO s_product VALUES (
   20201, '르네상스오페라',
   '고출력 극저의율 앰프/전기능 풀리모컨 시스템/오디오');
INSERT INTO s_product VALUES (
   20510, '2단분리',
   '자유로운 배치/오디오');
INSERT INTO s_product VALUES (
   20512, '왕눈이',
   'CD반복기능/내장마이크/카세트');
INSERT INTO s_product VALUES (
   30321, '마이마이',
   '광리모컨/알람/취침예약/카세트');
INSERT INTO s_product VALUES (
   30326, '수중강타',
   '물기둥세탁방식/세탁기');
INSERT INTO s_product VALUES (
   30421, '드럼건조',
   '전자식드럼/세탁.건조겸용/세탁기');
INSERT INTO s_product VALUES (
   30426, '손빨래',
   '5단계 수위 세분화/이중폭포수류/세탁기');
INSERT INTO s_product VALUES (
   30433, '하이쿨',
   '에너지소비효울 1등급/터보냉방/에어콘');
INSERT INTO s_product VALUES (
   32779, '여름사냥',
   '상하좌우 바람방향이 달라지는 입체회전 기능/선풍기');
INSERT INTO s_product VALUES (
   32861, '지펠',
   '초저소음 쾌적냉장/환경마크획득/냉장고');
INSERT INTO s_product VALUES (
   40421, '문단속따로따로',
   '촉촉한 유제품 보관함/2단 수납계란꽂이/냉장고');
INSERT INTO s_product VALUES (
   40422, '수평핸들',
   '수평핸들디자인/대형점보가드/냉장고');
INSERT INTO s_product VALUES (
   41010, '골고루',
   '항균코팅 조리실/조리시간보상기능/전자레인지');
INSERT INTO s_product VALUES (
   41020, '센서형',
   '항균세라믹코팅조리실/원터치센서 데우기/전자레인지');
INSERT INTO s_product VALUES (
   41050, '클린',
   '2구 가스레인지의 고급형 디자인/가스레인지');
INSERT INTO s_product VALUES (
   41080, '듀오',
   '강화실버스톤 상판/오븐 자동청소 기능/가스레인지');
INSERT INTO s_product VALUES (
   41100, '가스그릴',
   '강화실버스톤 상판/초대형그릴채용/가스레인지');
INSERT INTO s_product VALUES (
   50169, '한국형메뉴',
   '솥자체에서 열을 내는 IH취사방식/6가지 한국형메뉴/전기밥솥');
INSERT INTO s_product VALUES (
   50273, '대용량',
   '23인용/취사 및 보온겸용/전기밥솥');
INSERT INTO s_product VALUES (
   50417, '뜸기능',
   '마이컴 취사방식/뜸기능/전기밥솥');
INSERT INTO s_product VALUES (
   50418, '원터치',
   '간편한 원터치 뚜껑열림/12시간 예약취사기능/전기밥솥');
INSERT INTO s_product VALUES (
   50419, '겨울사냥',
   '송풍팬이 부착된 강제대류방식/난로');
INSERT INTO s_product VALUES (
   50530, '마이캠',
   '컬러뷰파인더/간단조작/캠코더');
INSERT INTO s_product VALUES (
   50532, '케녹스',
   '피사체가 중앙에 있지 않아도 초점을 맞춰주는 멀티빔/카메라');
INSERT INTO s_product VALUES (
   50536, '3배줌',
   '인공지능촬영/인물중심촬영/카메라');
COMMIT;


CREATE TABLE s_region
(id                         NUMBER(7)
   CONSTRAINT s_region_id_nn NOT NULL,
 name                       VARCHAR2(50)
   CONSTRAINT s_region_name_nn NOT NULL,
     CONSTRAINT s_region_id_pk PRIMARY KEY (id),
     CONSTRAINT s_region_name_uk UNIQUE (name));

INSERT INTO s_region VALUES (
   1, '서울특별시');
INSERT INTO s_region VALUES (
   2, '경기도');
INSERT INTO s_region VALUES (
   3, '충청/강원');
INSERT INTO s_region VALUES (
   4, '전라/제주');
INSERT INTO s_region VALUES (
   5, '부산/경상');
COMMIT;

CREATE TABLE  salgrade
(grade           char(1),
losal           number(11,2),
hisal           number(11,2));
INSERT INTO  salgrade
VALUES('A',4000,5999);
INSERT INTO  salgrade
VALUES('B',3000,3999);
INSERT INTO  salgrade
VALUES('C',2000,2999);
INSERT INTO  salgrade
VALUES('D',1000,1999);
INSERT INTO  salgrade
VALUES('E',500,999);
COMMIT;

Rem Add foreign key constraints.
ALTER TABLE s_dept
   ADD CONSTRAINT s_dept_region_id_fk
   FOREIGN KEY (region_id) REFERENCES s_region (id);
ALTER TABLE s_emp
   ADD CONSTRAINT s_emp_manager_id_fk
   FOREIGN KEY (manager_id) REFERENCES s_emp (id);
ALTER TABLE s_emp
   ADD CONSTRAINT s_emp_dept_id_fk
   FOREIGN KEY (dept_id) REFERENCES s_dept (id);
ALTER TABLE s_customer
   ADD CONSTRAINT s_sales_rep_id_fk
   FOREIGN KEY (sales_rep_id) REFERENCES s_emp (id);
ALTER TABLE s_customer
   ADD CONSTRAINT s_customer_region_id_fk
   FOREIGN KEY (region_id) REFERENCES s_region (id);
ALTER TABLE s_ord
   ADD CONSTRAINT s_ord_customer_id_fk
   FOREIGN KEY (customer_id) REFERENCES s_customer (id);
ALTER TABLE s_ord
   ADD CONSTRAINT s_ord_sales_rep_id_fk
   FOREIGN KEY (sales_rep_id) REFERENCES s_emp (id);
ALTER TABLE s_item
   ADD CONSTRAINT s_item_ord_id_fk
   FOREIGN KEY (ord_id) REFERENCES s_ord (id);
ALTER TABLE s_item
   ADD CONSTRAINT s_item_product_id_fk
   FOREIGN KEY (product_id) REFERENCES s_product (id);

prompt Tables and sequences created and populated.
prompt 'S_EMP 테이블의 급여의 단위는 천원임'
set feedback on
