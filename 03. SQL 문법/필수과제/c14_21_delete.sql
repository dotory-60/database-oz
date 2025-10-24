# 데이터베이스 사용
USE mydb;

# 민혁 사원의 데이터를 삭제하세요
DELETE FROM employees
WHERE name='민혁'
LIMIT 1;

# employees 테이블을 삭제하세요
DROP TABLE employees;