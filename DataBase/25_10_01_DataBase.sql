-- 데이터베이스에서 언어 구분을 할 수가 있다.
--	1. DQL(Data Query Language) : Select를 이용한 데이터 조회
--	2. DDL(Data Definition Language) : 객체 생성, 수정, 삭제
--	3. DML(Data Manipulation Language) : 데이터를 입력, 수정, 삭제, 병합
--	4. DCL(Data Control Language) : 사용자에게 권한 주기, 권한 뺏기
--  5. TCL(Transaction Control Language) : 트랜잭션 관리

-- 데이터베이스에서 객체
--	테이블, 인덱스, 뷰, 시퀀스, 동의어 등등
--  위에 적힌 객체들을 생성(create), 수정(alter), 삭제(truncate, drop)
--	현재 수업에서는 테이블을 위주로 진행할 것이고, 나머지는 각자 수업 때 진행.

-- 생성하기 - CREATE
--	새로운 오브젝트(객체) 또는 스키마를 생성할 때 사용하는 명령어
--	1. 일반 테이블 생성하기
CREATE TABLE testTable(
	NO 		number(4,2) ,
	name	varchar2(20) ,
	birth	DATE
);
-- 		설명
--		1. create 명령어를 사용해서 testTable이라는 이름의 Table을 생성
--		2. NO 라는 컬럼은 숫자(Number)만 들어갈 수 있고, 전체 자리수는 4자리, 소수점은 2자리
--		3. name 이라는 컬럼은 문자(varchar2)가 들어갈 수 있고, 최대 길이는 20byte다.
--  	4. birth 라는 컬럼은 날짜(DATE) 데이터만 들어갈 수 있다.

--  2. 기본 값을 설정한 테이블 만들기
--		Default(기본값)를 사용해서 데이터를 삽입할 때, 값을 지정하지 않아도
--		기본 데이터를 넣는다.
CREATE TABLE testTable2(
	NO		number(4,2)		DEFAULT 0,
	name	varchar2(20)	DEFAULT 'NO NAME',
	birth	DATE			DEFAULT sysdate
);

INSERT INTO testtable2(no) values(1);

SELECT * FROM testtable2;
-- 테이블 생성 시 주의사항
--		1. 테이블 이름은 반드시 문자로 시작해야한다.
--			숫자로 시작할 수는 없고, 포함은 가능하다.
--			특수기호도 사용가능하지만 _ 를 제외한 것은 추천하지 않는다.
--		2. 테이블 이름은 최대 30byte 까지 사용 가능
--			한글로 테이블을 생성시에 주의해야함
--		3. 테이블 이름은 같은 사용자(계정)일 때 중복되어서는 안된다.
--			scott 라는 계정에 emp 테이블이 2개가 될 순 없다.
--			생성한 후에 동일한 이름으로 생성하면 "이미 존재하는 객체다."라는 에러
--			다른 계정일 때는 동일한 이름이 가능하다.
--		4. 객체의 이름을 지을 때는 예약어(키워드)를 사용하지 않기를 권장.
--			테이블 이름으로 select나 from, where 과 같은 이름은 사용X

-- 임시 테이블 생성하기
--	임시 테이블이란 ? 테이블을 생성하지만, 일시적으로 테스트할 테이블을 말한다.
--			commit 이나 세션이 종료될 경우에 삭제된다.
--		commit 이란 ? 트랜잭션을 성공적으로 종료시킨다 라는 뜻의 명령어
--			트랜잭션 : 명령을 하는 기간
--		세션 이란 ? 사용자가 계정을 사용하는 시간
CREATE GLOBAL TEMPORARY TABLE temp_table(
	NO		Number(4,2),
	name	varchar2(20),
	birth	date
);
-- 현재 세션에서는 보이지만 다른 세션에서는 확인할 수 없다.
SELECT * FROM temp_table;

-- 테이블을 복사해서 새로운 테이블 만들기 ( CTAS 라고도 한다. )
CREATE TABLE dept_test
AS SELECT * FROM dept2;

SELECT * FROM dept_test;

-- 테이블의 데이터말고 구조만 복사하기
CREATE TABLE dept_test2
AS SELECT * FROM dept2 WHERE 1 = 2 ;

SELECT * FROM dept2 WHERE 1 = 2 ;

SELECT * FROM dept_test2;

-- 객체 수정하기 ( ALTER )
--	테이블의 경우에는 컬럼을 추가, 삭제, 이름변경, 컬럼명 변경 등의 작업이 가능
--	테스트 테이블 만들기 dept2 테이블에서 dcode와 dname을 가져와서 만들 것이다.
CREATE TABLE dept_test3
AS SELECT dcode, dname FROM dept2;
-- 	테스트 테이블 확인
SELECT * FROM dept_test3;

--	테이블에 새로운 컬럼을 추가하기
--		dept_test3 테이블에 LOCATION 컬럼을 추가한다.
ALTER TABLE dept_test3
ADD (location varchar2(10));

SELECT * FROM dept_test3;
--	기본값을 가진 새로운 컬럼 추가하기
ALTER TABLE dept_test3
ADD (location2 varchar2(10) DEFAULT 'SEOUL');

SELECT * FROM dept_test3;
--	테이블의 컬럼 이름을 변경하기
--		dept_test3 테이블의 location2 컬럼의 이름을 LOC로 변경
ALTER TABLE dept_test3
RENAME COLUMN location2 TO loc;

SELECT * FROM dept_test3;
--	테이블 이름 변경
RENAME dept_test3 TO dept_test4;

SELECT * FROM dept_test3; -- 이름이 변경되었기 때문에 에러뜸
SELECT * FROM dept_test4; -- 기존의 dept_test3 테이블이 조회됨.

-- 테이블 컬럼의 크기를 변경하기
ALTER TABLE dept_test4
MODIFY ( loc varchar2(30) );

-- 다른 자료형으로 변경도 가능하다. 
ALTER TABLE dept_test4
MODIFY ( location NUMBER(4,3));

-- 테이블의 컬럼을 삭제하기
ALTER TABLE dept_test4
DROP COLUMN loc;

SELECT * FROM dept_test4;

-- 테이블 삭제하기 ( TRUNCATE / DROP )
--	TRUNCATE : 테이블 내의 모든 내용(데이터)이 삭제된다.
--	DROP : 객체 자체를 삭제한다.

TRUNCATE TABLE dept_test4;
-- 데이터가 사라지고 테이블의 구조만 남아있는 것을 확인 가능
SELECT * FROM dept_test4;

DROP TABLE dept_test4;
-- 테이블 자체를 삭제했기 때문에 확인조차 불가능하다. ( 에러뜨는게 정상 )
SELECT * FROM dept_test4;

-- 테이블을 수정하지 못하게 읽기전용으로 변경
--	테스트를 위한 테이블 만들기
CREATE TABLE readonly_table(
	NO Number(4,2),
	name varchar2(20)
);
--	데이터 넣기
INSERT INTO readonly_table values(1, 'aaa');
--	테이블 확인
SELECT * FROM readonly_table;
--	테이블을 읽기전용으로 변경
ALTER TABLE readonly_table READ ONLY;

--	읽기 전용으로 변경 후 데이터 넣기 ( DML 은 불가능 )
INSERT INTO readonly_table values(2, 'bbb'); -- 에러 출력

--	읽기 전용으로 변경 후 테이블 컬럼 수정 ( DDL 은 일부 허용한다 )
ALTER TABLE READONLY_TABLE 
ADD ( tel number(12) DEFAULT 111);

-- 읽기 전용인 테이블을 다시 읽기 쓰기 모드로 변경
ALTER TABLE readonly_table READ WRITE;

-- 읽기 쓰기 모드에서 데이터 넣기
INSERT INTO READONLY_TABLE VALUES(3,'cccc', 1234);

-- 테이블에서 가상 컬럼을 설정하기
--	가상 컬럼이란 ? 다른 컬럼을 기준으로 계산해서 자동으로 만들어지는 컬럼
--	테스트 테이블 만들기
CREATE TABLE vt_test(
	COL1	number(5) ,
	COL2	number(5) ,
	COL3	number(5) GENERATED ALWAYS AS (COL1+COL2)
);
--	테스트 테이블에 데이터 넣기
INSERT INTO vt_test values(1,2,3);
 -- 위 쿼리문은 3번째 컬럼이 가상컬럼이기에 에러출력
INSERT INTO vt_test values(1,2);
 -- 위 쿼리문은 컬럼이 3개이기 때문에 에러 출력

-- 데이터를 넣을 컬럼을 지정해서 데이터를 넣는다.
INSERT INTO vt_test(col1, col2) VALUES(1,2);

SELECT * FROM vt_test;

-- 데이터를 수정했을 때 가상컬럼은 확인하기
UPDATE vt_test
SET col1 = 5;
-- 가상컬럼은 실시간으로 데이터 변화에 작동한다.
SELECT * FROM vt_test;

-- DATA DICTIONARY ( 데이터 사전 )
--	오라클 데이터베이스는 데이터베이스 운영에 관한 데이터를 테이블로 가지고 있다.
--	큰 틀로 나누게되면
--		1. 사용자 테이블 : 개발자가 직접 테이블을 만들고 관리하는 테이블
--		2. 데이터 사전 : 데이터베이스 운영에 필요한 정보
--			> 수정을 하면 안되기 때문에 직접 접근 x , 보기만 가능
--			> select구문으로 확인이 가능하다.
--			> 데이터 사전은 접두어를 통해서 용도를 알 수가 있다.
--				USER_XXXX 	: 현 사용자가 소유한 객체
--				ALL_XXXX 	: 현 사용자가 사용 가능한 모든 객체
--				DBA_XXXX	: DB 관리를 위한 정보(sys, system만 연람 가능)
--				v$_XXXX		: 데이터베이스의 성능 관련 정보

-- 전체 데이터 사전 조회하기
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

-- USER_ 접두어를 가진 데이터 사전 조회하기
SELECT * FROM DICT
WHERE table_name LIKE 'USER%';

-- 현 계정의 사용자 테이블 확인하기
SELECT table_name, num_rows FROM user_tables;

-- ALL_ 접두어를 가진 데이터 사전 조회하기
SELECT * FROM DICT
WHERE table_name LIKE 'ALL%';

-- 현 계정의 사용자가 볼 수 있는 모든 테이블 확인하기
SELECT owner, table_name FROM all_tables;

-- DBA_ 접두어를 가진 데이터 사전 ( sys , system 계정으로 확인 가능 )
SELECT * FROM DICT WHERE table_name LIKE 'DBA%';

SELECT * FROM dba_tables;

-- scott 계정에 대한 정보 확인 ( sys, system 계정에서 확인 가능 )
SELECT * FROM dba_users WHERE username = 'SCOTT';

-- 문제 1 ) 테이블을 생성하시오
--		테이블이름 : new_emp
--		컬럼 : no Number(5) / name varchar2(20)
--			  hiredate date / bonus number(6,2)
CREATE TABLE new_emp(
	NO		Number(5) ,
	name	varchar2(20),
	hiredate DATE,
	bonus	number(6,2)
);

SELECT * FROM new_emp;

--	문제 2 ) 1번에서 생성한 new_emp 테이블에서 NO, NAME, HIREDATE
--			3개의 컬럼구조만 가져와서 테이블을 생성하라
--			테이블명 : new_emp2
CREATE TABLE new_emp2
AS SELECT NO, name, hiredate FROM new_emp WHERE 1=2;

SELECT * FROM new_emp2;

-- 문제 4 ) 생성한 new_emp2 테이블에 date 타입을 가진 birthday 컬럼을
--			추가하고, 기본적으로 오늘 날짜가 자동으로 입력되게끔 하세요.
ALTER TABLE NEW_EMP2 
ADD ( birthday DATE DEFAULT sysdate );

-- 문제 5 ) 4번에서 생성한 birthday 컬럼을 birth 이름을 변경하여라.
ALTER TABLE NEW_EMP2 
RENAME COLUMN birthday TO birth;

-- 문제 6 ) new_emp2 테이블의 no 컬럼의 길이를 5 -> 7 로 변경하여라
ALTER TABLE new_emp2
MODIFY ( NO NUMBER(7));

-- 문제 7 ) birth 컬럼을 삭제하시오.
ALTER TABLE NEW_EMP2 
DROP COLUMN birth;

-- 문제 8 ) 컬럼만 남겨놓고 모든 데이터를 삭제하시오.
TRUNCATE TABLE new_emp2;

-- 문제 9 ) new_emp2 테이블을 삭제하시오.
DROP TABLE new_emp2;

------------------------------------------------------

-- DML(Data Manipulation Language)
--	객체가 아닌 데이터를 추가 수정 삭제하는 언어
--	CRUD ( CREATE READ UPDATE DELETE )
--		데이터를 추가하고 읽고 수정하고 삭제하고
-- 데이터 추가 : INSERT
-- 데이터 수정 : UPDATE
-- 데이터 삭제 : DELETE

-- 데이터 추가 ( INSERT )
--  INSERT INTO 테이블명(컬럼1, 컬럼2, ...) VALUES(값1, 값2, ...)

-- 예제 1) dept_test2 테이블에 데이터 넣기
--		부서번호 : 9000 / 부서명 : temp_1 / 상위부서 : 1006
--		지역 : temp area
INSERT INTO dept_test2(dcode, dname, pdept, area)
VALUES (9000, 'temp_1', 1006, 'temp area');

SELECT * FROM dept_test2;

-- 예제 2) dept_test2 테이블에 데이터를 원하는 컬럼만 넣기
--		부서번호 : 9001 / 부서명 : temp_2 / 상위부서 : 1006
INSERT INTO dept_test2(dcode, dname, pdept)
VALUES (9001, 'temp_2', 1006);

SELECT * FROM dept_test2;

-- 예제 3) 날짜 데이터 입력하기
-- 테스트 테이블 만들기
--	테스트테이블은 professor 테이블의 구조만 가지고 만든다.
CREATE TABLE prof_test
AS SELECT * FROM professor WHERE 1=2;

SELECT * FROM prof_test;
-- 데이터 입력하기
-- 교수번호 : 5001 / 교수 이름 : James Bond / ID : Love_me
-- POSITION : a full professor / pay : 500 / 입사일 : 14년 10월 23일
INSERT INTO prof_test(profno, name, id, POSITION, pay, hiredate)
VALUES(5001, 'James Bond', 'Love_me', 'a full professor', 500, 
		'2014-10-23');

SELECT * FROM prof_test;
-- 현재 지정된 날짜 형식과 다른 형식으로 추가할 때
INSERT INTO prof_test(profno, name, id, POSITION, pay, hiredate)
VALUES (5002, 'test data', 'test_me', 'test prof', 300,
		'23-10-2014');
-- 지정된 날짜 형식 변경하기
ALTER SESSION SET nls_date_format='dd-mm-yyyy';
-- 날짜형식 변경 후에 실행
INSERT INTO prof_test(profno, name, id, POSITION, pay, hiredate)
VALUES (5002, 'test data', 'test_me', 'test prof', 300,
		'23-10-2014');

SELECT * FROM prof_test;
-- 원래 형식으로 원복하는 코드
ALTER SESSION SET nls_date_format='yyyy-mm-dd HH24:MI:SS';
-- TIP ! 날짜 형식을 변경하지 않고 형식과 다른 date 넣는 방법
--		to_date() 함수를 사용해서 넣는다.

-- 예제 4) NULL 값 넣기
--		1. 자동으로 NULL 값 넣기.
--			insert into 테이블명(컬럼) - 이때 컬럼을 작성하지 않으면 된다.
--			values(값)
INSERT INTO prof_test(profno, name, id, POSITION, pay, hiredate)
VALUES (1002, 'hello', 'hello', 'hello prof', 300, '2024-10-01');

SELECT * FROM prof_test;
--		2. 수동으로 NULL 값 넣기.
--			NULL 이라고 적어주면 됩니다.
INSERT INTO prof_test(profno, name, id, POSITION, pay, hiredate)
VALUES (NULL,'hello2','hello2','hello2 prof',20,'2024-10-01');

SELECT * FROM prof_test;

-- 예제 5) 숫자 자리수 관련해서 데이터 확인하기
CREATE TABLE test_minus(
	no1 NUMBER,
	no2 number(3), -- 소수점자리를 지정하지 않으면 소수는 정수까지만 저장된다.
	no3 number(3,2)
);
-- 테이블이 가진 컬럼에 대한 데이터를 values 모두 작성해주면, 
-- 테이블명 옆에 컬럼을 지정하지 않아도 된다.
INSERT INTO test_minus values( 1, 1, 1 );
INSERT INTO test_minus VALUES(1.1 , 1.1, 1.1);
INSERT INTO test_minus values(-1.1, -1.1, -1.1);

SELECT * FROM test_minus;

-- INSERT 를 쿼리를 이용해서 여러 행을 입력하기
SELECT * FROM prof_test;
-- INSERT INTO 테이블명 다음에 query문을 작성하면, 그 쿼리문의 조회결과가
--	테이블에 저장된다. (ITAS 라고도 불린다)
INSERT INTO prof_test
SELECT * FROM professor;

-- INSERT ALL 을 이용해서 여러 테이블에 여러 행을 입력하기
-- 테스트 테이블 prof_test2 / prof_test3 을 professor 구조만 가져오기
CREATE TABLE prof_test2
AS SELECT * FROM professor WHERE 1=2;

CREATE TABLE prof_test3
AS SELECT * FROM professor WHERE 1=2;

SELECT * FROM prof_test2;
SELECT * FROM prof_test3;

-- 예제) 교수 번호가 1000번에서 1999번까지인 교수의 번호와 이름은 
--		prof_test2 에 저장하고,
--		교수 번호가 2000번에서 2999번까지인 교수의 번호와 이름은
--		prof_test3 에 저장한다.
INSERT ALL
	WHEN profno BETWEEN 1000 AND 1999 THEN 
		INTO prof_test2 values(profno, name)
	WHEN profno BETWEEN 2000 AND 2999 THEN
		INTO prof_test3 values(profno, name)
SELECT profno, name
FROM professor;

SELECT * FROM prof_test2;
SELECT * FROM prof_test3;

TRUNCATE TABLE prof_test2;
TRUNCATE TABLE prof_test3;

-- 예제2) Professor 테이블의 profno가 3000이상 3999이하인 데이터를
--		prof_test2 와 prof_test3 에 데이터 동시에 넣기
INSERT ALL
	INTO prof_test2 values(profno, name)
	INTO prof_test3 values(profno, name)
SELECT profno, name
FROM PROFESSOR 
WHERE profno BETWEEN 3000 AND 3999;

-- 데이터 수정하기 ( UPDATE )
--	UPDATE 테이블명
--	SET 컬럼명 = 변경할 값
--	WHERE 조건
-- 예제1) prof_test 테이블에서 'hello'라는 이름을 가진 교수의 
--		 bonus를 200으로 변경하라
UPDATE prof_test
SET bonus = 200
WHERE name = 'hello';

SELECT * FROM prof_test;
-- 예제2) prof_test 테이블에서 'James Bond'라는 이름을 가진 교수의
--		pay를 350으로 변경하라.
UPDATE prof_test
SET pay = 350
WHERE name = 'James Bond';

SELECT * FROM prof_test;

-- ***** 내가 변경하려는 조건을 정확하게 입력해야한다.
--		입력하지 않으면 테이블 전체의 데이터가 변경되거나, 
--		원하는 데이터가 변경되지 않는다.

-- 데이터 삭제 ( DELETE )
-- DELETE FROM 테이블명
-- WHERE 조건;
-- 예제 ) prof_test 테이블에서 교수번호가 4000번 이상되는 데이터를 모두 삭제하라.
DELETE FROM prof_test
WHERE profno >= 4000;

SELECT * FROM prof_test;
-- ***** 내가 삭제하려는 조건을 정확하게 입력해야한다.
--		입력하지 않으면 테이블 전체의 데이터가 삭제되거나, 
--		원하는 데이터가 삭제되지 않는다.

-- 테이블 병합 ( MERGE )
--	MERGE INTO 병합하려는테이블명(A)
--	USING 비교할테이블명(B)
--	ON ( 두 테이블을 비교할 조건 )
--	WHEN MATCHED THEN
--		UPDATE SET 컬럼1 = 컬럼1, 컬럼2 = 컬럼2
--	WHEN NOT MATCHED THEN
--		INSERT (컬럼1, 컬럼2) VALUES (컬럼1, 컬럼2)

-- 테스트 테이블 EMP 테이블에서 EMPNO와 ENAME의 구조만 가지고온다.
CREATE TABLE EMP_TEST
AS SELECT EMPNO, ENAME FROM EMP WHERE 1=2;

CREATE TABLE EMP_TEST2
AS SELECT EMPNO, ENAME FROM EMP;

SELECT * FROM EMP_TEST;
SELECT * FROM EMP_TEST2;

INSERT INTO EMP_TEST VALUES(7369, 'TEST');
INSERT INTO EMP_TEST VALUES(7499, 'TEST2');

MERGE INTO EMP_TEST e1
USING emp_test2 e2
ON (e1.empno = e2.empno)
WHEN MATCHED THEN
	UPDATE SET e1.ename = e2.ename
WHEN NOT MATCHED THEN
	INSERT (empno, ename) VALUES(e2.empno, e2.ename);

SELECT * FROM emp_test;

-- 트랜잭션 : 논리적인 작업 단위
--		데이터를 추가, 수정, 삭제하는 하나의 단위를 트랜잭션이라고 한다.
--		트랜잭션 관리하는 언어 TCL (Transaction Control Language)
--			COMMIT 		: 트랜잭션을 성공적으로 끝냈다.
--			ROLLBACK	: 트랜잭션이 성공적이지 못해서 다시 원복시킨다.
UPDATE EMP_TEST et 
SET ename = 'aaa';

INSERT INTO emp_test values(1, 'asadf');
INSERT INTO emp_test values(12, '123asadf');

SELECT * FROM emp_test;

ROLLBACK;



















