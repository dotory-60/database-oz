/*
	select * from table a
	left join table b
    on a.key = b.key
*/

# inner join (내부조인)
# 테이블 A를 기준으로 테이블 B를 합하여 생성
# 모든 사용자와 그들이 만든 주문들을 조회합니다. 사용자와 주문 테이블 간의 user_id를 기준으로 매칭된 행을 반환합니다.
use testdatabase;
select * from users
inner join orders on users.user_id = orders.user_id;

# left join (왼쪽 조인)
# 사용자 테이블의 모든 행을 포함하고, 주문 테이블과 매칭되는 경우 해당 주문 정보를 포함합니다.
use testdatabase;
select * from users
left join orders on users.user_id = orders.user_id;

use testdatabase;
select * from orders
left join users on users.user_id = orders.user_id;

# 테이블의 데이터만 삭제
# truncate table users;