SELECT table_name FROM information_schema.tables WHERE table_schema = 'solugate';

DROP TABLE company_info;
DROP TABLE inquiry_product;
DROP TABLE customer_product;
DROP TABLE customer_alliance;
DROP TABLE solution_content;
DROP TABLE solution_photo;
DROP TABLE solution;
DROP TABLE history;
DROP TABLE recruit_content;
DROP TABLE recruit;

CREATE TABLE company_info (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(60) NOT NULL,
    ceo_subject VARCHAR(150) NOT NULL COMMENT'대표 인사 제목',
    ceo_content VARCHAR(1500) NOT NULL COMMENT'대표 인사 내용',
    ceo_photo VARCHAR(100) NOT NULL COMMENT'대표 사진',
    ceo_sign_photo VARCHAR(100) NOT NULL COMMENT'대표 이름 사진',
    post_number VARCHAR(15) NOT NULL,
    address VARCHAR(120) NOT NULL,
    address_detail VARCHAR(120) NOT NULL,
    subway VARCHAR(120) COMMENT'지하철 경로',
    bus VARCHAR(120) COMMENT'버스 경로',
    phone VARCHAR(18) NOT NULL,
    fax VARCHAR(18),
    email VARCHAR(50) NOT NULL
);

CREATE TABLE customer_product (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(30) NOT NULL,
    customer_name VARCHAR(30) NOT NULL,
    phone VARCHAR(18) NOT NULL,
    email VARCHAR(50) NOT NULL,
    inquiry_content VARCHAR(1000) NOT NULL COMMENT'제휴문의 내용'
);

CREATE TABLE inquiry_product (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(90) NOT NULL COMMENT'문의 제품 이름',
    customer_product_id INT NOT NULL,
    FOREIGN KEY (customer_product_id) REFERENCES customer_product(id)
);

CREATE TABLE customer_alliance (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(30) NOT NULL,
    customer_name VARCHAR(30) NOT NULL,
    phone VARCHAR(18) NOT NULL,
    email VARCHAR(50) NOT NULL,
    inquiry_content VARCHAR(1000) NOT NULL COMMENT'제휴문의 내용'
);

CREATE TABLE recruit (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(150) NOT NULL,
    recruit_start_date VARCHAR(11) COMMENT'채용 시작 날짜',
    recruit_end_date VARCHAR(11) COMMENT'채용 종료 날짜',
    full_time BOOLEAN NOT NULL COMMENT '상시채용 여부',
    proceed INT NOT NULL COMMENT'진행중=1, 마감=2',
    view BIGINT COMMENT'조회수',
    create_date DATETIME NOT NULL,
    update_date DATETIME NOT NULL
);

CREATE TABLE recruit_content (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    title_group_id INT NOT NULL,
    sub_title VARCHAR(90),
    content VARCHAR(210),
    photo VARCHAR(100) COMMENT'사진',
    recruit_id INT NOT NULL,
    FOREIGN KEY (recruit_id) REFERENCES recruit (id)
);

CREATE TABLE history (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL COMMENT'년도-월 로 입력',
    content VARCHAR(150) NOT NULL,
    photo VARCHAR(100)
);

CREATE TABLE solution (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(21) NOT NULL,
    full_name VARCHAR(90) NOT NULL,
    explanation VARCHAR(300) NOT NULL
);

CREATE TABLE solution_photo (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    photo VARCHAR(100) NOT NULL,
    solution_id INT NOT NULL,
    FOREIGN KEY (solution_id) REFERENCES solution (id)
);

CREATE TABLE solution_content (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(60) NOT NULL,
    solution_id INT NOT NULL,
    FOREIGN KEY (solution_id) REFERENCES solution (id)
);

ALTER TABLE company_info COMMENT'회사 정보 테이블';
ALTER TABLE customer_product COMMENT'제품문의 관리 테이블';
ALTER TABLE customer_alliance COMMENT'제휴문의 관리 테이블';
ALTER TABLE inquiry_product COMMENT'문의 제품들을 저장하는 테이블';
ALTER TABLE recruit COMMENT'채용정보 테이블';
ALTER TABLE recruit_content COMMENT'title =
    1. 근무조건 및 환경 테이블
        sub_title = 근무형태, 근무요일/시간, 근무지역, 급여, 회사주소, 인근전철
    2. 전형절차
        sub_title = 전형절차
    3. 접수기간 및 제출서류 테이블
        sub_title = 접수기간, 접수방법, 기타 유의사항
    4. 접수방법 및 문의처
        sub_title = 담당자';
ALTER TABLE history COMMENT'연혁의 날짜와 내용과 사진들을 담는 테이블';


INSERT INTO company_info VALUES (NULL, '솔루게이트',
    '"세상의 모든 소리에 대한 정보제공을 통한 삶의 질 향상을 위해
    솔루게이트가 함께 하겠습니다."',
    '(주)솔루게이트는 2014년 창립 이래 음성인식 및 가상콜상담 사업을 비롯하여 챗봇 서비스, 성문인증 등의 음성인식 기술 서비스 기업
    입니다.
    최근 4차 산업혁명과 인공지능을 통해 사람의 삶을 개선하고, 서비스 품질을 높이기 위한 고객의 요구가 다양화되고 세분화되고 있습니다.
    저희 솔루게이트는 끊임없는 기술 개발을 통해 2018년 기술평가 우수기업 인증(T3)을 받았습니다. 또한 다수의기술특허를 통해
    새로운 시장의 고객 요구사항을 충족할 수 있도록 한발 먼저 준비하고 있습니다.
    국내 무인 가상 상담 시스템 구축 및 서비스의 선도 기업의 전문화를 위해 솔루게이트는 한발 먼저 달려가고 있습니다.
    저희 솔루게이트가 고객의 새로운 Digital Transformation Partner가 되어드리겠습니다.',
    'about_img.jpg', 'sign01.gif', '08506','서울특별시 금천구 가산디지털1로 145', '11층 1104호(가산동, 에이스하이엔드타워3차)',
    '1호선, 7호선 가산디지털단지역 5번 출구 도보 3분', '653번, BYC하이시티 하차 (정류장 번호 18-231)',
    '070-8882-5252', '070-4405-7835', 'solugate@solugate.com'
);

SELECT * FROM company_info;

INSERT INTO solution VALUES (NULL,
    'SGSAS™', 'Solugate Speech Analysis System',
    'SGSAS™은 ㈜솔루게이트의 음성인식 솔루션입니다.');

INSERT INTO solution_content VALUES (NULL, '딥러닝기반 기계학습', 1);
INSERT INTO solution_content VALUES (NULL, '다양한 연동 프로토콜 지원', 1);
INSERT INTO solution_content VALUES (NULL, '학습자동화를 통한 편의성 강화', 1);
INSERT INTO solution_content VALUES (NULL, 'GPU 기반 고속병렬처리', 1);
INSERT INTO solution_content VALUES (NULL, '음성인식 결과에 대한 신뢰도 제공', 1);
INSERT INTO solution_content VALUES (NULL, '음원 유출 방지를 통한 보안성 강화', 1);
INSERT INTO solution_content VALUES (NULL, '실시간 자연어 음성인식', 1);

INSERT INTO solution_photo VALUES (null, 'solution_img01.jpg', 1);

INSERT INTO solution VALUES (NULL,
    'SGACC™', 'Solugate Speech Analysis System Automatic Process Call Center',
    'SGACC™은 ㈜솔루게이트의 음성인식 기술과 인공지능 기술을 통합한 무인콜센터 솔루션 입니다.');

INSERT INTO solution_content VALUES (NULL, '딥러닝기반 기계학습', 2);
INSERT INTO solution_content VALUES (NULL, '다양한 연동 프로토콜 지원', 2);
INSERT INTO solution_content VALUES (NULL, '학습자동화를 통한 편의성 강화', 2);
INSERT INTO solution_content VALUES (NULL, 'GPU 기반 고속병렬처리', 2);
INSERT INTO solution_content VALUES (NULL, '음성인식 결과에 대한 신뢰도 제공', 2);
INSERT INTO solution_content VALUES (NULL, '음원 유출 방지를 통한 보안성 강화', 2);
INSERT INTO solution_content VALUES (NULL, '실시간 자연어 음성인식', 2);

INSERT INTO solution_photo VALUES (null, 'solution_img07.jpg', 2);


INSERT INTO history VALUES (NULL, '2014-07-11', '㈜솔루게이트 법인 설립', NULL);
INSERT INTO history VALUES (NULL, '2015-01-11', '음성인식 및 Virtual Agent로 벤처기업 등록 (벤처 제20150101449호)', NULL);
INSERT INTO history VALUES (NULL, '2015-03-08', 'ETRI 음성인식기술 (콜센터 서비스를 위한 한국어 음성인식기술) 이전 계약 및 전수', NULL);
INSERT INTO history VALUES (NULL, '2015-10-10', 'Virtual Agent(VA), 무인상담, 챗봇상담, 가상상담원 상표 특허 출원 및 등록', NULL);
INSERT INTO history VALUES (NULL, '2015-12-24', '가상상담시스템 및 가상상담 방법론 특허 등록', NULL);
INSERT INTO history VALUES (NULL, '2015-12-12', '기업부설연구소 설립', 'history_img04.jpg');
INSERT INTO history VALUES (NULL, '2016-03-19', '감성정보 추출 장치 및 방법 외, 인공지능 관련 2건 특허 등록', NULL);
INSERT INTO history VALUES (NULL, '2016-09-09', '대화형 가상상담시스템 개발 기술 평가 우수기업 인증', 'history_img03.jpg');
INSERT INTO history VALUES (NULL, '2016-12-12', '사업장 이전 (서울시 금천구 → 서울시 마포구)', NULL);
INSERT INTO history VALUES (NULL, '2017-03-05', '벤처기업 재인증', NULL);
INSERT INTO history VALUES (NULL, '2017-04-15', '중소기업청 지능형 인공지능 서비스를 위한 대화형 가상상담시스템 개발 연구과제 선정', NULL);
INSERT INTO history VALUES (NULL, '2017-12-20', '기술혁신형중소기업(INNOBIZ) 인증', 'history_img02.jpg');
INSERT INTO history VALUES (NULL, '2017-12-16', '음성인식 자동학습시스템, 신뢰도판단시스템 특허 등', NULL);
INSERT INTO history VALUES (NULL, '2018-01-17', '(주)아인톱시스템 비즈니스 파트너 계약 체결', NULL);
INSERT INTO history VALUES (NULL, '2018-01-12', '굿모닝아이텍(주) 비즈니스 파트너 계약 체결', NULL);
INSERT INTO history VALUES (NULL, '2018-04-08', '신용보증기금 퍼스트펭귄형 창업기업 선정 (15억원)', NULL);
INSERT INTO history VALUES (NULL, '2018-04-01', '한국기업데이터 기술역량 우수기업 인증(음성기반 가상상담시스템 개발 T3등급)', NULL);
INSERT INTO history VALUES (NULL, '2018-05-21', '자본금 증자 (약 9.1억원)', NULL);
INSERT INTO history VALUES (NULL, '2018-05-13', '신용보증기금 투자 유치 (13억원)', NULL);
INSERT INTO history VALUES (NULL, '2018-07-18', '복합 사용자 인증 시스템 특허 등록', NULL);
INSERT INTO history VALUES (NULL, '2018-10-20', '자본금 증자 (약 10.5억원)', NULL);
INSERT INTO history VALUES (NULL, '2018-10-13', '서울투자 성장산업 벤처조합 투자 유치 (8억원)', NULL);
INSERT INTO history VALUES (NULL, '2018-10-10', '자본금 증자 (약 9.7억원)', NULL);
INSERT INTO history VALUES (NULL, '2018-10-28', '신한캐피탈 투자 유치 (7억원)', NULL);
INSERT INTO history VALUES (NULL, '2018-11-25', '(주)웅진 비즈니스 파트너 계약 체결', NULL);
INSERT INTO history VALUES (NULL, '2018-11-21', '사업장 이전 (서울시 마포구 → 서울시 금천구)', 'history_img01.jpg');

COMMIT;

INSERT INTO recruit VALUES (NULL, '전략사업부 영업지원팀 채용', '2019-02-07', '2019-02-28', FALSE, 2, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 1);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 1);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 1);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 1);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 1);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 1);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 1);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 1);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2019년 2월 2일 (토)', null, 1);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 1);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 1);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 1);

INSERT INTO recruit VALUES (NULL, '전략사업부 영업지원팀 채용', '2022-06-07', '2022-07-08', FALSE, 2, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 2);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 2);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 2);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 2);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 2);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 2);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 2);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 2);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 6월 5일 (일)', null, 2);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 2);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 2);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 2);

INSERT INTO recruit VALUES (NULL, '전략사업부 영업지원팀 채용', '2022-02-07', '2022-02-28', FALSE, 2, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 3);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 3);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 3);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 3);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 3);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 3);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 3);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 3);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 2월 2일 (토)', null, 3);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 3);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 3);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 3);

INSERT INTO recruit VALUES (NULL, '솔루션 사업부 C++ 개발자 채용', '2022-08-12', '2022-08-28', FALSE, 2, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 4);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 4);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 4);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 4);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 4);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 4);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 4);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 4);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 8월 10일 (일)', null, 4);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 4);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 4);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 4);


INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2022-09-07', '2022-09-29', FALSE, 2, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 5);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 5);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 5);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 5);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 5);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 5);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 5);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 5);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 9월 4일 (일)', null, 5);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 5);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 5);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 5);

INSERT INTO recruit VALUES (NULL, '전략사업부 영업지원팀 채용', '2022-07-11', '2022-07-28', FALSE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 6);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 6);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 6);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 6);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 6);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 6);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 6);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 6);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 7월 10일 (일)', null, 6);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 6);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 6);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 6);

INSERT INTO recruit VALUES (NULL, '솔루션 사업부 C++ 개발자 채용', '2019-02-07', '2019-02-28', FALSE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 7);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 7);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 7);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 7);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 7);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 7);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 7);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 7);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2019년 2월 3일 (일)', null, 7);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 7);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 7);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 7);

INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2022-08-16', '2022-09-03', FALSE, 2, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 8);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 8);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 8);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 8);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 8);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 8);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 8);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 8);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 8월 10일 (수)', null, 8);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 8);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 8);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 8);

INSERT INTO recruit VALUES (NULL, '전략사업부 영업지원팀 채용', '2022-10-12', '2022-10-28', FALSE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 9);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 9);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 9);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 9);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 9);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 9);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 9);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 9);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 10월 08일 (토)', null, 9);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 9);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 9);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 9);

INSERT INTO recruit VALUES (NULL, '솔루션 사업부 C++ 개발자 채용', '2022-10-02', '2022-10-21', FALSE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 10);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 10);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 10);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 10);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 10);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 10);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 10);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 10);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 09월 28일 (수)', null, 10);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 10);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 10);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 10);

INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2019-02-07', '2019-02-28', FALSE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 11);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 11);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 11);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 11);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 11);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 11);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 11);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 11);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2019년 02월 02일 (토)', null, 11);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 11);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 11);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 11);

INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2022-11-17', '2022-12-13', TRUE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 12);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경' , 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 12);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 12);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 12);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 12);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 12);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 12);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 12);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 11월 10일 (목)', null, 12);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 12);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 12);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 12);

INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2022-11-17', '2022-12-13', TRUE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 13);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경' , 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 13);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 13);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 13);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 13);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 13);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 13);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 13);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 11월 10일 (목)', null, 13);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 13);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 13);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 13);

INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2022-11-17', '2022-12-13', TRUE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 14);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경' , 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 14);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 14);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 14);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 14);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 14);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 14);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 14);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 11월 10일 (목)', null, 14);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 14);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 14);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 14);

INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2022-11-17', '2022-12-13', TRUE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 15);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경' , 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 15);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 15);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 15);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 15);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 15);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 15);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 15);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 11월 10일 (목)', null, 15);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 15);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 15);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 15);

INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2022-11-17', '2022-12-13', TRUE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 16);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경' , 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 16);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 16);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 16);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 16);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 16);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 16);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 16);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 11월 10일 (목)', null, 16);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 16);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 16);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 16);

INSERT INTO recruit VALUES (NULL, '솔루션 사업부 C++ 개발자 채용', '2022-10-02', '2022-10-21', FALSE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 17);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 17);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 17);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 17);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 17);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 17);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 17);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 17);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 09월 28일 (수)', null, 17);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 17);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 17);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 17);

INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2019-02-07', '2019-02-28', FALSE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 18);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 18);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 18);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 18);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 18);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 18);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 18);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 18);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2019년 02월 02일 (토)', null, 18);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 18);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 18);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 18);

INSERT INTO recruit VALUES (NULL, '[상시채용] 음성인식 및 가상상담 개발 개발자 채용', '2022-11-17', '2022-12-13', TRUE, 1, 0, NOW(), NOW());
INSERT INTO recruit_content VALUES (NULL, '모집부분 및 자격요건', 1, null, null, 'recruit_img07.jpg', 19);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경' , 2, '근무형태', '정규직(필요 시 수습기간 3개월)', null, 19);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무요일/시간', '주 5일(월~금) 오전 9시~오후 6시', null, 19);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '근무지역', '서울 - 금천구', null, 19);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '급여', '면접후 결정', null, 19);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '회사주소', '(08506) 서울 금천구 가산디지털1로 145 에이스하이엔드타워3차 1104호', null, 19);
INSERT INTO recruit_content VALUES (NULL, '근무조건 및 환경', 2, '인근전철', '서울 7호선 가산디지털단지 5번출구 에서 200m 이내', null, 19);
INSERT INTO recruit_content VALUES (NULL, '전형절차', 3, '전형절차', '서류전형 - 면접 - 합격통보', null, 19);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수기간', '2022년 11월 10일 (목)', null, 19);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '접수방법', '이메일 : recruit@solugate.com', null, 19);
INSERT INTO recruit_content VALUES (NULL, '접수기간 및 제출서류', 4, '기타 유의사항', '입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
', null, 19);
INSERT INTO recruit_content VALUES (NULL, '접수방법 및 문의처​', 5, '담당자', '박준호 실장(전략기획실) 전화070-4405-7847', null, 19);

COMMIT;

SELECT id, DATE_FORMAT(date, '%Y-%m') AS date, content, photo, date AS ori_date FROM history ORDER BY ori_date desc;

DELETE FROM history WHERE id = 7;

SELECT * FROM company_info;

SELECT rt.id, subject, recruit_start_date, recruit_end_date, full_time, proceed,
       view, create_date, update_date, photo, title, sub_title, content
FROM recruit rt, recruit_content rtc
WHERE rt.id = 1 AND rt.id = rtc.recruit_id;

SELECT * FROM recruit;

SELECT * FROM recruit_content WHERE recruit_id = 19 ORDER BY title_group_id;

SELECT title, sub_title, content
FROM recruit_content
WHERE recruit_id = 1 ORDER BY id;

UPDATE history SET content = '업데이트 테스트' WHERE id = 1;
UPDATE history SET content = '㈜솔루게이트 법인 설립' WHERE id = 1;

SELECT @rownum:=@rownum-1 as number, r.*
FROM (SELECT @rownum:=@rownum+1 as number_count, rt.*
    FROM (SELECT @rownum:=0) tmp1, (SELECT * FROM recruit) rt
    ORDER BY id desc) as r
WHERE r.number_count >= 1 AND r.number_count <= 10 AND (@rownum:=19)=19;


DELETE FROM recruit_content WHERE recruit_id = 9;
DELETE FROM recruit WHERE id = 19;

SELECT count(id) as total_content_count FROM recruit;

SELECT MAX(id) as last_id FROM recruit;

DELETE FROM recruit_content;
DELETE FROM recruit;

SELECT * FROM solution_content;
SELECT * FROM solution_photo;

DELETE FROM solution WHERE id = 4;
DELETE FROM solution_content WHERE id > 14;

SELECT * FROM customer_product;
SELECT * FROM customer_alliance;
SELECT * FROM inquiry_product;

SELECT * FROM history;


-- like 절 없는 최초 쿼리문
SELECT @rownum:=r.total_count+1-r.number_count as number, r.*
FROM (SELECT @rownum:=@rownum+1 as number_count, rt.*, rtc.*
      FROM (SELECT @rownum:=0) tmp1, (SELECT * FROM recruit) rt, (SELECT COUNT(id) as total_count FROM recruit) rtc
      ORDER BY id desc) as r
WHERE r.number_count >= 1 AND r.number_count <= 10;

-- 중복값이 나오는 실패 쿼리문
SELECT @rownum:=r.total_count+1-r.number_count as number, r.*
FROM (SELECT @rownum:=@rownum+1 as number_count, rt.*, rtc.*
      FROM (SELECT @rownum:=0) tmp1,
           (SELECT rs.* FROM recruit rs, recruit_content rc WHERE rs.subject LIKE CONCAT('%','솔','%') OR rc.content LIKE CONCAT('%','솔','%') AND rs.id = rc.recruit_id) rt,
           (SELECT COUNT(rs.id) as total_count FROM recruit rs, recruit_content rc WHERE subject LIKE CONCAT('%','솔','%') OR rc.content LIKE CONCAT('%','솔','%') AND rs.id = rc.recruit_id) rtc
      ORDER BY id desc) as r
WHERE r.number_count >= 1 AND r.number_count <= 10;


-- recruit_content like 문 실행해서 recruit 의 id 값을 기준으로 group by
SELECT r.* FROM recruit r, (SELECT * FROM recruit_content WHERE content LIKE CONCAT('%','상','%')) rc WHERE r.id = rc.recruit_id
GROUP BY r.id;

SELECT * FROM recruit WHERE subject LIKE CONCAT('%','솔','%');

-- union 을 사용해서 풀 아웃 조인을 실행한 쿼리문
SELECT *
FROM (SELECT * FROM recruit WHERE subject LIKE CONCAT('%','사','%')
    UNION
    SELECT r.* FROM recruit r, (SELECT * FROM recruit_content WHERE content LIKE CONCAT('%','사','%')) rc WHERE r.id = rc.recruit_id GROUP BY r.id) as uni
ORDER BY uni.id desc;


-- 쿼리문 완성
SELECT @rownum:=r.total_count+1-r.number_count as number, r.*
FROM (SELECT @rownum:=@rownum+1 as number_count, r_uni.*, total.total_count
      FROM (SELECT @rownum:=0) tmp1,
           (SELECT *
            FROM (SELECT * FROM recruit WHERE subject LIKE CONCAT('%','솔','%')
                  UNION
                  SELECT r.* FROM recruit r, (SELECT * FROM recruit_content WHERE content LIKE CONCAT('%','솔','%')) rc WHERE r.id = rc.recruit_id GROUP BY r.id) as uni
            ORDER BY uni.id desc
            ) as r_uni,
           (SELECT COUNT(*) as total_count
            FROM (SELECT * FROM recruit WHERE subject LIKE CONCAT('%','솔','%')
                  UNION
                  SELECT r.* FROM recruit r, (SELECT * FROM recruit_content WHERE content LIKE CONCAT('%','솔','%')) rc WHERE r.id = rc.recruit_id GROUP BY r.id) as uni
           ) as total
      ) as r
WHERE r.number_count >= 1 AND r.number_count <= 10;


-- 검색 도움 기능
SELECT subject FROM recruit WHERE subject LIKE CONCAT('%','솔','%');

-- 검색 도움 기능 쿼리문 완성
SELECT subject
FROM (SELECT * FROM recruit WHERE subject LIKE CONCAT('%','사','%') GROUP BY subject
      UNION
      SELECT r.* FROM recruit r, (SELECT * FROM recruit_content WHERE content LIKE CONCAT('%','사','%')) rc WHERE r.id = rc.recruit_id GROUP BY r.subject) as uni
ORDER BY uni.id desc


