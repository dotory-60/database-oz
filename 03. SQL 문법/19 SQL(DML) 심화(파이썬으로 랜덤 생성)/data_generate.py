import mysql.connector
from faker import Faker
import random # 파이썬 기본 모듈

# (1) MYSQL 연결 설정
db_connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='rlawldnjs',
    database='testdatabase'
)

# (2) MYSQL 연결
cursor = db_connection.cursor()
faker = Faker()

# (3) users 데이터 생성, 100명의 더미 데이터 생성
for _ in range(100):
    username = faker.user_name()
    email = faker.email()

    sql = 'insert into users(username, email) values(%s, %s)'
    values= (username, email)
    cursor.execute(sql, values)

# user_id 불러오기
cursor.execute('select user_id from users')
valid_user_id = [row[0] for row in cursor.fetchall()] # cursor 안에 user_id가 담겨있다.
# cursor.fatchall로 값을 모두 가져오고 row 객체에서 0번째의 값만 받겠다.

# 100개의 주문 더미 데이터 생성
for _ in range(100):
    user_id = random.choice(valid_user_id)
    product_name = faker.word()
    quantity = random.randint(1, 10)

    try:
        sql = 'insert into orders(user_id, product_name, quantity) values(%s, %s, %s)'
        values = (user_id, product_name, quantity)
        cursor.execute(sql, values)
    except:
        pass

db_connection.commit() # 반영
cursor.close()
db_connection.close()