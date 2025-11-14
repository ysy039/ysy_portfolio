-- 02_load_data_example.sql
-- CSV 파일을 events 테이블에 적재

-- 실행 전: 
-- 1) cosmetics_db 사용 중인지 확인: USE cosmetics_db;
-- 2) local_infile 허용 필요할 수 있음: SET GLOBAL local_infile = 1;

USE cosmetics_db;

LOAD DATA LOCAL INFILE 'C:\Users\LG\Downloads\2020-Jan.csv'
INTO TABLE events
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    @event_time_str,
    event_type,
    product_id,
    category_id,
    category_code,
    brand,
    price,
    user_id,
    user_session
)
SET event_time = STR_TO_DATE(@event_time_str, '%Y-%m-%d %H:%i:%s');
-- 만약 시간 형식이 다르면 포맷 문자열을 CSV에 맞게 수정해야 함
