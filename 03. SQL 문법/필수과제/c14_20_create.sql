# 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS mydb;

# 데이터베이스 사용
USE mydb;

# 테이블 초기화
DROP TABLE IF EXISTS employees;

# employees 테이블을 생성해주세요
CREATE TABLE IF NOT EXISTS employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);

# 테이블 구조 확인 (DESCRIBE도 사용 가능)
DESC employees;

# 직원 데이터를 employees에 추가해주세요
INSERT INTO employees(name, position, salary) 
VALUES
	('혜린', 'PM', 90000),
    ('은우', 'Frontend', 80000),
    ('가을', 'Backend', 92000),
    ('지수', 'Frontend', 7800),
    ('민혁', 'Frontend', 96000),
    ('하온', 'Backend', 130000);
    
# 직원 데이터 확인하기 (생성은 아님)
SELECT * FROM employees;