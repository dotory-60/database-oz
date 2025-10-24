# MySQL 데이터 타입
# BOOL: 0 false, 1 true
# INT(M): or INTEGER(M): 4바이트 정수
# CHAR(M): 고정 길이 문자열 저장 (M: 0~255)
# VARCHAR(M): 가변 길이 문자열 저장 (M: 0~65,535)
# TEXT: 1~65,535 길이의 가변 길이 문자열
# DATETIME: 날짜와 시간을 같이 나타내는 타입 (8바이트)
# TIMESTAMP: INSERT, UPDATE 연산에 유리 (4바이트)

/* 
	DATETIME과 TIMESTAP의 차이
    
	datetime
    범위: 1000-01-01 00:00:00~9999-12-31 23:59:59
    크기: 8바이트
    시간대 무관: datetime 값은 시간대 변환 없이 그대로 저장됩니다.
    사용 사례: 특정 사건이 발생한 정확한 시점을 기록할 때 사용. 예를 들어, 사용자의 생일이나 기념일 등.
    
    timestamp
    범위: 1970-01-01 00:00:00~2037-01-19 03:14:07
    크기: 4바이트
    시간대 인식: timestamp는 utc로 저장되며, 조회 시 서버의 시간대 설정에 따라 변환됩니다.
    자동 갱신: insert나 update 연산 시 현재 시간으로 자동 갱신될 수 있습니다.
    사용 사례: 레코드의 생성 또는 수정 시간을 기록할 때 주로 사용. 예를 들어, 게시물의 작성 시간이나 마지막 수정 시간 등.
*/

# DATETIME 사용 예시: 사용자 프로필
# date_of_birth datetime: 사용자의 생일 데이터의 경우 회원 가입 이후 변경되지 않으며, 시간대에 영향을 받지 않는다.
create table users (
	id int auto_increment primary key,
    name varchar(100),
    email varchar(100),
    date_of_birth datetime
);

# TIMESTAMP 사용 예시: 블로그 게시물
# created_at timestamp: 게시물이 처음 생성된 시간. 이 필드는 게시물이 만들어질 때 현재 시간으로 자동 설정됩니다.
# updated_at timestamp: 게시물이 마지막으로 수정된 시간. 이 필드는 게시물이 수정될 때마다 현재 시간으로 자동 갱신됩니다.
create table blog_posts (
	id int auto_increment primary key,
    title varchar(255),
    content text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);

# 사용시 고려사항
# 시간대: 국제화된 애플리케이션에서는 시간대 변환의 중요성 때문에 timestamp가 유리할 수 있습니다.
# 범위와 저장 크기: datetime은 더 넓은 범위를 커버하며 더 많은 저장 공간을 사용합니다.
# 자동 갱신의 필요성: 레코드의 생성 또는 수정 시간을 자동으로 추적하고 싶다면 timestamp가 적합합니다.

# datetime은 시간대에 무관한 넓은 범위의 날짜와 시간을 8바이트로 저장
# timestamp는 시간대를 인식하는 좁은 범위의 날짜와 시간을 4바이트로 저장하며, 자동 갱신 가능
