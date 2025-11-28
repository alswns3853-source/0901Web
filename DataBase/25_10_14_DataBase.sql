-- 제약조건
--		테이블에 올바른 데이터만 입력받고 잘못된 데이터는 들어오지 못하도록
--		컬럼마다 정하는 규칙
--	데이터 정확성 : 입력 받는 데이터가 정확하다라는 보장
--	데이터 무결성 : 입력 받는 데이터가 정확성과 일관성을 보장
--		영역 무결성 - 저장되는 값이 적절한지
--		개체 무결성 - 기본 키(PK)는 반드시 값을 가지며, 중복과 NULL을 불허한다.
--		참조 무결성 - 외래키(FK) 반드시 참조 테이블의 기본키로 존재해야하며, NULL이 가능
--	제약조건은 보통 테이블을 생성할 때 많이 작성한다.

-- 제약조건의 종류
--	1. NOT NULL : 컬럼에 NULL 값이 들어가면 안된다.
--	2. UNIQUE 	: 컬럼에 데이터 중복이 안된다.
--	3. PRIMARY KEY(PK) : 기본 키로서, NOT NULL + UNIQUE ( NULL, 중복 안됨)
--	4. FOREIGN KEY(FK) : 외래 키로서, 다른 테이블의 컬럼을 참조해서 검사
--	5. CHECK 	: 조건을 달아서 조건에 허용된 값만 입력이 가능

--	** UNIQUE 나 PK 같은 경우에는 제약조건을 만들 시에 같이 인덱스도 만들어진다.

--	** FK(외래 키) 의 용어 < EMP(deptno) - DEPT(deptno) >
--		- 부모 테이블 : 정보를 제공해주는 테이블 ( DEPT 테이블 )
--		- 자식 테이블 : 정보를 받는 테이블 ( EMP 테이블 )
--		- 참조 키(Reference Key) : 부모 테이블 쪽에서 참조 되는 컬럼 ( DEPT(deptno) )
--		- 외래 키(Foreign Key) : 자식 테이블의 컬럼에 설정되는 키 ( EMP(deptno) )
--	** FK(외래 키)의 주의점
--		참조 키의 데이터를 삭제하려면, 외래 키에 데이터가 없어야한다.

-- 제약 조건 설정하기
--	1. 테이블 생성할 때 제약 조건 설정
--		컬럼명 자료형(크기) CONSTRAINT 제약조건이름 제약조건종류
--			** FK의 경우 제약조건종류로 "REFERENCES 부모테이블(참조키)"를 작성 
CREATE TABLE new_emp1(
	NO number(4) 
		CONSTRAINT emp1_no_pk PRIMARY KEY,
	name varchar2(20) 
		CONSTRAINT emp1_name_nn NOT NULL,
	jumin varchar2(13)
		CONSTRAINT emp1_jumin_nn NOT NULL
		CONSTRAINT emp1_jumin_uk UNIQUE,
	loc_code number(1)
		CONSTRAINT emp1_area_ck check( loc_code < 5 ),
	deptno varchar2(6)
		CONSTRAINT emp1_deptno_fk REFERENCES dept2(dcode)
);
-- 	2. 테이블 생성할 때 제약 조건 설정 ( 이름 지정 X )
CREATE TABLE new_emp2(
	NO Number(4) PRIMARY KEY,
	name varchar2(20) NOT NULL,
	jumin varchar2(13) NOT NULL UNIQUE,
	loc_code number(1) check(loc_code < 5),
	deptno varchar2(6) REFERENCES dept2(dcode)
);

-- 3. 테이블 생성 후에 제약 조건 붙이기
CREATE TABLE new_emp3(
	NO number(4),
	name varchar2(20),
	jumin varchar2(13),
	loc_code number(1),
	deptno varchar2(6)
);
--		name 컬럼에 unique 제약조건 추가하기
--			ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건이름 제약조건종류(컬럼)
ALTER TABLE new_emp3
ADD CONSTRAINT emp3_name_uk UNIQUE(name);
--	** NOT NULL 은 기본적으로 NULL 허용이 들어가기 때문에 
--	   ADD가 아닌 MODIFY로 해주어야한다.
ALTER TABLE new_emp3
MODIFY ( loc_code CONSTRAINT emp3_loccode_nn NOT NULL );
-- 		no 컬럼에 emp2(empno)를 외래키로 추가하기
--		FK는 부모테이블의 기본키 또는 유니크 제약조건을 가진 컬럼을 가져와야한다.
ALTER TABLE new_emp3
ADD CONSTRAINT emp3_no_fk FOREIGN KEY(no)
REFERENCES emp2(empno);

-- ** 참조 키로 설정된 부모테이블의 데이터를 삭제할 때.
--	1. ON DELETE CASCADE  : 참조 키가 삭제되면 외래 키 데이터도 같이 삭제
--	2. ON DELETE SET NULL : 참조 키가 삭제되면 외래 키 데이터를 NULL로 설정
--	위 명령어를 사용하는 실습
--		1. 테이블 생성
CREATE TABLE c_test1( -- 자식테이블
	NO NUMBER,		  
	name varchar2(6),
	deptno NUMBER	  -- 외래 키
);
CREATE TABLE c_test2( -- 부모테이블
	NO NUMBER,        -- 참조 키
	name varchar2(10)
);
--		2. 참조 키에 unique 제약조건 달아주기
ALTER TABLE c_test2
ADD CONSTRAINT ctest2_no_uk UNIQUE(no);
--		3. 외래 키에 FK 제약조건 달아주기( on delete cascade )
ALTER TABLE c_test1
ADD CONSTRAINT ctest1_deptno_fk FOREIGN KEY(deptno)
REFERENCES c_test2(no)
ON DELETE CASCADE;
--		4. 데이터 삽입
--		( FK 는 참조받는 데이터가 있어야 하기 때문에, 
--			부모테이블의 데이터를 먼저 삽입한다.)
INSERT INTO c_test2 values(10, 'AAAA');
INSERT INTO c_test2 VALUES(20, 'BBBB');
INSERT INTO c_test2 VALUES(30, 'CCCC');
SELECT * FROM c_test2;

INSERT INTO c_test1 values(1, 'apple', 10);
INSERT INTO c_test1 values(2, 'banana', 20);
INSERT INTO c_test1 values(3, 'cherry', 30);
SELECT * FROM c_test1;
--		5. 참조키를 삭제해보기 ( on delete cascade 상태 )
DELETE FROM c_test2 WHERE NO=10;
SELECT * FROM c_test2;
SELECT * FROM c_test1;
--		6. on delete cascade를 on delete set null 로 변경
ALTER TABLE c_test1 DROP CONSTRAINT ctest1_deptno_fk;

ALTER TABLE c_test1
ADD CONSTRAINT ctest1_deptno_fk FOREIGN KEY(deptno)
REFERENCES c_test2(no)
ON DELETE SET NULL;
--		7. 참조키를 삭제해보기 ( on delete set null 상태 )
DELETE FROM c_test2 WHERE NO = 20;
SELECT * FROM c_test2;
SELECT * FROM c_test1;

-- 외래키가 not null 인 상태에서 on delete set null을 적용하면??
-- 1. deptno 컬럼에 not null 제약조건 주기
--		2번 데이터가 이미 null 이기 때문에 에러를 출력
ALTER TABLE c_test1
MODIFY ( deptno CONSTRAINT ctest1_deptno_nn NOT NULL );
-- 2. 2번 데이터의 deptno 를 30 으로 변경
UPDATE c_test1 SET deptno = 30
WHERE NO = 2;
-- 3. null인 데이터를 30으로 변경했기 때문에 not null 제약조건 달아주기
ALTER TABLE c_test1
MODIFY ( deptno CONSTRAINT ctest1_deptno_nn NOT NULL );
-- 4. 참조 키인 c_test2 의 30번 데이터를 삭제하기
DELETE FROM c_test2 WHERE NO = 30;
SELECT * FROM c_test2;
SELECT * FROM c_test1;
-- NOT NULL 로 지정된 컬럼에 on delete set null 명령은 이루어지지않는다.
--	에러를 출력하고, 참조키 삭제x 외래키 null 변경 x

-- 제약 조건 관리하기
--	제약조건을 임의로 켜고 끌 수 있다.
--	DISABLE VALIDATE : 제약조건을 끄고, 기존 데이터들에 대해 검증이 된 상태
--	DISABLE NOVALIDATE : 제약조건을 끄고, 
--			기존 데이터들과 앞으로 들어오는 데이터들에 대해 검증을 안한다.
--	ENABLE VALIDATE : 제약조건을 켜고, 기존데이터 + 앞으로의 데이터 모두 검증하겠다.
--	ENABLE NOVALIDATE : 제약조건을 켜고, 기존데이터 신경x 앞으로의 데이터는 검증하겠다
SELECT * FROM T_NOVALIDATE;
SELECT * FROM T_VALIDATE;
SELECT * FROM T_ENABLE;
--	1. DISABLE NOVALIDATE
--		1-1. 사용 전 데이터 삽입(제약조건 위배 라는 에러 출력)
INSERT INTO T_NOVALIDATE VALUES(1,'DDD');
--		1-2. 사용
ALTER TABLE T_NOVALIDATE
DISABLE NOVALIDATE CONSTRAINT SYS_C007494;
--		1-3. 사용 후 데이터 삽입(정상적으로 데이터가 입력된다.)
INSERT INTO T_NOVALIDATE VALUES(1,'DDD');
SELECT * FROM T_NOVALIDATE;

--	2. DISABLE VALIDATE
--		> 기존 데이터 검증 상태를 유지하기 위해 DML 코드를 불허한다.

--		2-1. 사용 전 데이터 삽입(제약조건 위배 라는 에러 출력)
INSERT INTO T_VALIDATE VALUES(4, NULL);
--		2-2. 사용
ALTER TABLE T_VALIDATE
DISABLE VALIDATE CONSTRAINT TV_NAME_NN;
--		2-3. 사용 후 데이터 삽입(DML을 수행할 수 없다 라는 에러 출력)
INSERT INTO T_VALIDATE VALUES(4, null);
--		2-4. 사용 후 정상적인 데이터 삽입(DML을 수행할 수 없다 라는 에러 출력)
INSERT INTO t_Validate values(4, 'ddd');
--		2-5. 다른 컬럼에만 데이터 삽입(DML을 수행할 수 없다 라는 에러 출력)
INSERT INTO t_validate(no) values(4);

--	ENABLE 테스트를 위한 데이터 삽입
INSERT INTO T_ENABLE VALUES(1, 'AAA');
INSERT INTO T_ENABLE VALUES(2, 'BBB');
-- 제약 조건 OFF
ALTER TABLE T_ENABLE
DISABLE CONSTRAINT TE_NAME_NN;
-- 제약 조건에 따르지 않는 데이터 삽입
INSERT INTO T_ENABLE VALUES(3, NULL);
-- T_ENABLE 테이블 데이터 확인
SELECT * FROM T_ENABLE;

-- 3. ENABLE NOVALIDATE
--	3-1. 사용
ALTER TABLE T_ENABLE
ENABLE NOVALIDATE CONSTRAINT TE_NAME_NN;
--	3-2. 사용 후 데이터 삽입( 제약조건을 켰기 때문에 null 삽입x 에러 출력 )
INSERT INTO T_ENABLE VALUES(4, NULL);
SELECT * FROM t_enable;

-- 4. ENABLE VALIDATE
--	4-1. 테스트를 위해 DISABLE 상태로 변경하기
ALTER TABLE T_ENABLE
DISABLE CONSTRAINT TE_NAME_NN;
--	4-2. ENABLE VALIDATE 로 상태 변경하기
--	 기존 데이터에 NAME 컬럼 중 NULL 데이터가 있기 때문에 
--	 실행할 수 없다 라는 에러 출력
ALTER TABLE T_ENABLE
ENABLE VALIDATE CONSTRAINT TE_NAME_NN;

-- 5. ENABLE VALIDATE 를 사용하기 위해 제약조건 위반한 데이터 찾기
---------------- CMD창에서 진행
--		1. SYSTEM 계정으로 사용하기 ( CMD 창에서 진행 )
--			CMD 창에 SQLPLUS SYSTEM/1111 AS SYSDBA 로 접속
--			@?/RDBMS/ADMIN/UTLEXCPT.SQL 외부SQL문 실행
--			"테이블이 생성되었습니다." 라는 스크립트 문을 출력

--			1-1. 테스트 테이블 만들기
CREATE TABLE SCOTT.TT500(
	NO NUMBER CONSTRAINT TT500_CK CHECK(NO>5)
);

--			1-2. 제약조건을 DISABLE 상태로 만들기
ALTER TABLE SCOTT.TT500 DISABLE CONSTRAINT TT500_CK;

--			1-3. 테스트 테이블에 데이터 삽입
INSERT INTO SCOTT.TT500 VALUES (1); -- 문제될 데이터
INSERT INTO SCOTT.TT500 VALUES (6);
INSERT INTO SCOTT.TT500 VALUES (7);
SELECT * FROM SCOTT.TT500; -- 1 6 7 데이터 확인

--			1-4. 제약조건을 ENABLE VALIDATE 상태로 변경하면서 
--				 에러부분을 SYS.EXCEPTIONS 테이블에 저장하기
ALTER TABLE SCOTT.TT500 ENABLE VALIDATE CONSTRAINT TT500_CK
EXCEPTIONS INTO SYS.EXCEPTIONS;

--			1-5. EXCEPTIONS에 저장된 에러가 난 ROWID를 조회
SELECT ROWID, NO
FROM SCOTT.TT500
WHERE ROWID IN (SELECT ROW_ID FROM EXCEPTIONS);

--			1-6. 조회된 ROWID를 통해서 제대로된 값으로 수정
UPDATE SCOTT.TT500
SET NO = 8
WHERE ROWID = 'AAASCpAAHAAAAHuAAA';

SELECT * FROM SCOTT.TT500;

--			1-7. 잘못된 데이터를 수정한 후 
--				 ENABLE VALIDATE 상태로 변경하면 변경이 된다.
ALTER TABLE SCOTT.TT500 ENABLE VALIDATE CONSTRAINT TT500_CK;

---------------------여기까지는 CMD에서 테스트한 내용.

--		2. SCOTT 계정에서 진행하기
--			CMD창에서 외부 SQL문만 실행한다.
--			@?/RDBMS/ADMIN/UTLEXCPT.SQL 실행
--		2-1. 예제 테이블 만들기
CREATE TABLE tt551(
	NO NUMBER,
	name varchar2(10)
		CONSTRAINT tt551_name_uk UNIQUE
);

--		2-2. name 제약조건 diable 시키기
ALTER TABLE tt551 disable CONSTRAINT tt551_name_uk;

--		2-3. 예제 테이블에 데이터 삽입하기
INSERT INTO tt551 VALUES (1, 'aaa');
INSERT INTO tt551 VALUES (2, 'aaa');
INSERT INTO tt551 VALUES (3, 'aaa');
SELECT * FROM tt551;
COMMIT;

--		2-4. enable validate 상태로 변경하면서 
--			 에러가 나면 rowid를 exceptions 테이블에 저장하기
ALTER TABLE tt551
enable VALIDATE CONSTRAINT tt551_name_uk
exceptions INTO exceptions;

--		2-5. exceptions 테이블에서 에러난 rowid를 출력하기
SELECT rowid, name
FROM tt551
WHERE rowid IN ( SELECT row_id FROM exceptions);

--		2-6. rowid를 가지고 데이터를 올바르게 변경하기
UPDATE TT551
SET name = 'bbb'
WHERE rowid = 'AAASCrAAHAAAAH3AAB';

UPDATE tt551
SET name='ccc'
WHERE rowid = 'AAASCrAAHAAAAH3AAC';

SELECT * FROM tt551;

--		2-7. exceptions 테이블을 비우기
TRUNCATE TABLE exceptions;

--		2-8. 다시 enable validate 상태로 변경해주기
ALTER TABLE tt551
enable VALIDATE CONSTRAINT tt551_name_uk
exceptions INTO exceptions;

-- 제약조건 조회하기
--	데이터 사전 중에 USER_CONSTRAINTS / USER_CONS_COLUMNS 에서 확인 가능

-- 예제 1) NEW_EMP2 테이블에 설정된 제약조건 조회하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'NEW_EMP2'; -- 테이블 이름은 대문자로 작성해야한다.
--		OWNER : 조회된 제약조건을 가진 사용자
--		CONSTRAINT_NAME : 지정한 제약조건의 이름
--		CONSTRAINT_TYPE : 지정한 제약조건의 종류
--			P : pk(기본 키)
--			R : fk(외래 키)
--			C : CHECK 제약조건 및 NOT NULL 제약조건
--			U : UNIQUE 제약조건
--		STATUS : 제약조건이 활성화 / 비활성화

-- 예제 2) 특정 테이블의 특정 컬럼에 설정되어있는 제약조건 확인하기
SELECT OWNER, CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'EMP';

-- 제약조건이 설정된 컬럼을 보고싶다면 USER_CONS_COLUMNS 테이블
-- 제약조건만 보고싶다면 USER_CONSTRAINT 테이블

-- 예제 3) FOREIGN KEY 조회하기
SELECT a.table_name "child_table",
	   c.column_name "child_column",
	   a.constraint_name "child_cons_name",
	   b.table_name "parent_table",
	   d.column_name "parent_column",
	   a.r_constraint_name "parent_cons_name"
FROM user_constraints a, user_constraints b, 
	 user_cons_columns c,
	 ( SELECT constraint_name, column_name, table_name 
	   FROM user_cons_columns ) d
WHERE a.r_constraint_name = b.constraint_name
AND	  a.constraint_name = c.constraint_name
AND   a.r_constraint_name = d.constraint_name
AND	  a.constraint_type = 'R';

-- 제약조건 삭제하기
ALTER TABLE new_emp3
DROP CONSTRAINT emp3_no_fk;


-- P.353 7장 연습문제 1번
--	아래의 표와 같이 테이블을 생성하라
CREATE TABLE tcons(
	NO		number(5)
		CONSTRAINT tcons_no_pk PRIMARY KEY,
	name	varchar2(20)
		CONSTRAINT tcons_name_nn NOT NULL,
	jumin	varchar2(13)
		CONSTRAINT tcons_jumin_nn NOT NULL
		CONSTRAINT tcons_jumin_uk UNIQUE,
	area	number(1)
		CONSTRAINT tcons_area_ck check(area BETWEEN 1 AND 4),
	deptno varchar2(6)
		CONSTRAINT tcons_deptno_fk REFERENCES dept2(dcode) 
);

-- P.353 7장 연습문제 2번
-- 방금 생성한 tcons 테이블의 name 컬럼이 emp2 테이블의 name 컬럼의 값을 참조하도록
-- 외래키 제약조건을 추가 설정하는 쿼리를 작성하시오. (tcons 가 자식테이블입니다.)
-- 	2-1. emp2 테이블의 name 컬럼에 unique 제약조건을 설정하시오.
ALTER TABLE EMP2 
ADD CONSTRAINT emp2_name_uk UNIQUE(name);
--  2-2. 2번문제의 답을 작성하시오.
ALTER TABLE TCONS 
ADD CONSTRAINT tcons_name_fk FOREIGN KEY(name)
REFERENCES emp2(name);

-- P.353 7장 연습문제 3번
-- tcons 테이블의 jumin 컬럼에 만들어져있는 unique 제약조건을 "사용안함"으로 변경하되
-- 테이블의 데이터에 DML까지 안되도록 변경하는 쿼리를 쓰세요.
ALTER TABLE TCONS 
disable VALIDATE CONSTRAINT tcons_jumin_uk;

-- P.353 7장 연습문제 4번
-- 위 3번에서 "사용안함"으로 설정한 제약조건을 사용함으로 변경하되 기존에 있던 내용과
-- 새로 들어올 내용 모두 체크하는 옵션으로 변경하라. 그리고 문제가 되는 데이터들은
-- exceptions 테이블에 저장하도록 설정하는 쿼리문을 작성하여라.
ALTER TABLE TCONS
enable VALIDATE CONSTRAINT tcons_jumin_uk
exceptions INTO exceptions;

-- P.353 7장 연습문제 5번
-- tcons 테이블에 설정되어 있는 제약조건 중 자신이 생성한 제약조건들의 테이블명, 
-- 컬럼명, 제약조건명으로 검색하는 쿼리를 작성하라( 단, foreign key는 제외합니다. )
-- hint) user_cons_columns 에서 테이블명,컬럼명,제약조건명을 가져오기.
-- hint) user_constraints 테이블을 JOIN해서 
--		 constraint_type 이 R이 아닌것만 출력하기
-- hint) 두 테이블을 join 할때는 constraint_name이 동일하다 라는 조건으로 하면 됨
SELECT col.table_name, col.column_name, col.constraint_name
FROM user_cons_columns col, user_constraints con
WHERE col.constraint_name = con.constraint_name
AND con.constraint_type NOT LIKE 'R'
AND col.table_name = 'TCONS';













