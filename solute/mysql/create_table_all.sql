SELECT table_name FROM information_schema.tables WHERE table_schema = 'solugate';

DROP TABLE company_info;

CREATE TABLE company_info (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ceo_subject VARCHAR(150) NOT NULL,
    ceo_content VARCHAR(1500) NOT NULL,
    ceo_photo VARCHAR(100) NOT NULL,
    ceo_name_photo VARCHAR(100) NOT NULL COMMENT'대표 이름 사진',
    address VARCHAR(200) NOT NULL,
    subway VARCHAR(120) COMMENT'지하철 경로',
    bus VARCHAR(120) COMMENT'버스 경로',
    phone VARCHAR(18),
    fax VARCHAR(18),
    email VARCHAR(50)
);

CREATE TABLE customer_center (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    inquiry_type INT NOT NULL COMMENT'제품문의=1, 제휴문의=2',
    company_name VARCHAR(30) NOT NULL,
    customer_name VARCHAR(30) NOT NULL,
    phone VARCHAR(18) NOT NULL,
    email VARCHAR(50) NOT NULL,
    inquiry_content VARCHAR(1000) NOT NULL COMMENT'제휴문의 내용'
);

CREATE TABLE inquiry_product (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(90) COMMENT'문의 제품 이름',
    customer_center_id INT NOT NULL,
    FOREIGN KEY (customer_center_id) REFERENCES customer_center(id)
);

CREATE TABLE recruit (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(150) NOT NULL,
    recruit_period_start VARCHAR(11) COMMENT'채용 시작 날짜',
    recruit_period_end VARCHAR(11) COMMENT'채용 종료 날짜',
    proceed INT NOT NULL COMMENT'진행중=1, 마감=2',
    view BIGINT COMMENT'조회수',
    create_date DATETIME NOT NULL,
    update DATETIME NOT NULL
);

CREATE TABLE qualification (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    photo VARCHAR(100) NOT NULL COMMENT'모집부분 및 자격요건 사진',
    recruit_id INT NOT NULL,
    FOREIGN KEY (recruit_id) REFERENCES recruit (id)
);

CREATE TABLE recruit_content (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    sub_title VARCHAR(90) NOT NULL,
    content VARCHAR(210) NOT NULL,
    recruit_id INT NOT NULL,
    FOREIGN KEY (recruit_id) REFERENCES recruit (id)
);

CREATE TABLE history (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date VARCHAR(33) NOT NULL,
    content VARCHAR(150) NOT NULL,
    photo VARCHAR(100) NOT NULL
);

ALTER TABLE company_info COMMENT'회사 정보 테이블';
ALTER TABLE customer_center COMMENT'문의관리 테이블';
ALTER TABLE inquiry_product COMMENT'문의 제품들을 저장하는 테이블';
ALTER TABLE recruit COMMENT'채용정보 테이블';
ALTER TABLE qualification COMMENT'모집부분 및 자격요건 테이블';
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

