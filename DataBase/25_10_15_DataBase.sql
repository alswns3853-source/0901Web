-- 인덱스 ( INDEX )
--	데이터를 목록화 하는 방법
--	조회 시에 성능을 좋게 하기 위해서 사용하는 객체

-- Table Full Scan : 데이터를 찾기 위해 모든 데이터를 스캔해서 검색한다.

-- INDEX는 중간 데이터를 기준으로 양 옆으로 가지치기를 해서 데이터를 저장한다.
-- (B-Tree 인덱스 기준)

-- 읽어올 때는 root block - branch block - leaf block 순으로 읽음
-- 인덱스 생성할 때는 읽어올 때와 반대순서로 생성하게 된다.

-- 인덱스의 종류
-- 1. B-tree 인덱스
--		Root - Branch - Leaf 형식으로 Tree 구조를 이루어서 만들어지게 된다.
--		저장되어있는 데이터는 Leaf Block 에 저장되어있고,
--		Leaf Block 의 정보들이 Branch Block 에 저장되어있고,
--		Branch Block의 정보들이 Root Block에 저장되어있다.
--		인덱스 생성 : Leaf - Branch - Root
--		데이터 조회 : Root - Branch - Leaf
--		Root를 기준으로 양 옆의 균형이 가장 잘 맞아있을 때가 가장 좋은 성능을 낸다.
--		그래서 Tree 앞에 적힌 B 의 개념이 Balance(균형)으로 B-Tree가 된다.

--	  1-1. UNIQUE INDEX
--		Index를 만드는 Key(데이터) 중에 중복되는 데이터가 없다.
--		테이블 컬럼에 Unique 제약조건이나 Primary Key 제약조건을 사용하면 
--		자동으로 만들어진다.
--		생성 코드
--		Create Unique Index 인덱스명
--		On 테이블명( 컬럼명 Asc 또는 Desc[, 컬럼명 Asc 또는 Desc, ...]  )
--		생성 예제
CREATE UNIQUE INDEX IDX_DEPT2_DNAME
ON dept2(dname); -- 기본적으로 오름차순 정렬되어서 인덱스가 만들어진다.

-- 아래의 쿼리문은 dname(temp01)이 중복이 없어서 정상적으로 들어가게 됨 
INSERT INTO dept2 values(9100, 'temp01', 1006, 'Seoul Branch');
-- 아래의 쿼리문을 실행시키면 위의 dname(temp01) 데이터가 중복이 되기때문에 에러를 출력
INSERT INTO dept2 values(9101, 'temp01', 1006, 'Busan Branch');

-- Unique Index 같은 경우에는 데이터 중복이 없어서 성능은 가장 좋지만
-- 	이후에 중복된 데이터가 들어올 경우에는 사용할 수가 없다.

--	  1-2. Non-Unique Index
--		일반적으로 사용하는 인덱스, 중복되는 컬럼에 인덱스를 생성할 경우 사용한다.
--		생성 코드
--		Create Index 인덱스명
--		On 테이블명(컬럼명 Asc 또는 Desc [, 컬럼명 Asc 또는 Desc,...)
--		생성 예제
CREATE INDEX idx_dept2_area
ON dept2(area);

--	  1-3. Function Based INDEX(FBI - 함수기반인덱스)
--		보통 인덱스를 where 절에 조건이나 조인 조건으로 등록될때 사용한다.
--		where pay = 1000 이라고 한다면 pay 컬럼에 인덱스를 등록해야한다.
--		하지만, where pay+1000 = 2000 이라고 한다면 pay 컬럼에 인덱스를 등록해도
--		소용이없다. pay+1000 이라는 형태로 인덱스를 등록해야한다.
--		** 일반 인덱스를 사용하려면 where절의 조건을 절대로 다른 형태로 가공해서는 안된다 !
--		꼭 가공을 해서 사용해야할 때는 아래의 예제처럼 인덱스를 가공한 형태로 생성해야한다.
--		FBI 생성 예제
CREATE INDEX idx_prof_pay_fbi
ON professor(pay+1000);

--	  1-4. DESCENDING INDEX(내림차순 인덱스)
--		기본적으로 오름차순인 인덱스를 내림차순으로 인덱스를 생성한다.
--		보통 날짜(큰날짜 - 옛날, 작은날짜 - 최근) / 매출 상위 매장 등 예제에서 사용
--		생성 예제
CREATE INDEX idx_prof_pay
ON Professor(pay desc);

--	  1-5. 결합 인덱스(Composite INDEX)
--		두 개 이상의 컬럼을 합쳐서 인덱스를 생성
--		예제 ) 이름 중에 SMITH(남,여)라는 사람 중 남자인 사람을 조회하겠다. 라고 가정
--		아래의 예제코드는 예제이기 때문에 조회가 되지 않음(에러)
SELECT ename, sal
FROM EMP
WHERE ename = 'SMITH'
AND gender = 'M';
--		위의 쿼리문을 빠르게 찾으려고 한다면, ename과 gender 에 인덱스를 걸어야한다.
--		아래의 코드처럼 만들 수 있다. ( 아래의 코드도 예제이기 때문에 조회X 에러출력 )
CREATE INDEX idx_emp_comp
ON emp( ename, gender );

--		결합 인덱스의 경우에는 컬럼의 순서를 중요하게 생각해야한다.
--		만약, emp 테이블에서 총 100명 중 남자가 50명, SMITH가 남자1여자1일 때 가정
--		gender, ename 순이면
--		100개 -> 50개 -> 1개를 찾게 된다.
--		ename, gender 순서면
--		100개 -> 2개 -> 1개를 찾게 된다.

-- 2. BITMAP INDEX
--	데이터 값의 종류가 적고, 동일한 데이터가 많을 경우 주로 BITMAP INDEX를 사용
--	생성 코드
--	CREATE BITMAP INDEX 인덱스명
--	ON 테이블명(컬럼명)
--  단점 : 데이터가 추가될 경우 BITMAP 자체를 변경해야한다.

-- 3. 인덱스 시 주의사항
--	3-1. DML 에 취약하다.
--		- INSERT 작업 시 발생하는 현상
--			Index Split 현상
--				블록의 크기를 줄이고 그 줄인 공간에 새로운 데이터가 들어가게 된다.
--				하나의 블록에 저장되어 있던 데이터들이 빈자리가 없어서 
--				원래의 블록이 줄어들고 2개의 블록으로 옮겨지는 현상
--		- DELETE 작업 시 발생하는 현상
--			INDEX 는 원래의 데이터가 삭제되어도 INDEX는 삭제되지 않는다.
--			삭제되지 않고, 사용안함 표시만 나타낸다.
--			실제로 사용하는 인덱스는 일 만건이지만, 잡혀있는 인덱스는 십 만건이 될 수도 있다.
--			위와 같은 부분은 index Rebuild를 통해서 잡아줘야한다.
--		- Update 작업 시 발생하는 현상
--			원래의 데이터를 삭제하고, 새로운 데이터를 삽입한다.
--			위 DELETE , INSERT 작업 시 발생하는 현상 두가지 다 나타나게된다.
--  3-2. 인덱스가 있다는 게 무조건 성능이 좋아지는 것은 아니다.
--		- 다른 쿼리문에 다른 조건을 사용해서 인덱스를 만들었지만,
--		  무조건 성능이 좋아지는 것은 아니다.
--		- 그래서, 인덱스를 만들고 쿼리문을 실행해보고 좋아지면 사용하고, 
--		  안좋아지면 삭제해야한다. -> 인덱스를 만들고나서도 테스트를 해봐야한다.

-- 4. 인덱스를 조회하기
--		인덱스를 조회할 때는 USER_INDEXES 또는 USER_IND_COLUMNS 라는 데이터 사전을 찾으면 된다.
--		예제
SELECT TABLE_NAME, COLUMN_NAME, INDEX_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMP2';

SELECT TABLE_NAME, INDEX_NAME, INDEX_TYPE
FROM USER_INDEXES
WHERE TABLE_NAME = 'EMP2';

-- 5. 인덱스 사용 여부 모니터링 하기
--	5-1. 모니터링 시작하기
ALTER INDEX IDX_DEPT2_AREA MONITORING USAGE;
--  5-2. 모니터링 종료하기
ALTER INDEX IDX_DEPT2_AREA NOMONITORING USAGE;
--	5-3. 사용 유무 확인하기
SELECT INDEX_NAME, USED
FROM V$OBJECT_USAGE
WHERE INDEX_NAME = 'IDX_DEPT2_AREA';

SELECT * -- 인덱스명, 테이블명, 모니터링 유무, 사용유무, 모니터링시작, 모니터링종료
FROM V$OBJECT_USAGE
WHERE INDEX_NAME = 'IDX_DEPT2_AREA';

-- 6. INDEX REBUILD 하기
--	데이터가 삭제되어도 인덱스는 삭제되지 않는다.
--	인덱스 블록이 비워져있는 상태를 고쳐주는 행위
--	인덱스는 만들고나서 끝이 아니라 계속 관리를 해주어야한다.
--	예제
--		1. 예제 테이블 만들기
CREATE TABLE INX_TEST(
	NO NUMBER
);
--		2. 예제 테이블에 데이터 넣기( PL/SQL 사용 )
--		1부터 10000까지 데이터를 넣는 PL/SQL 입니다.
BEGIN
	FOR i IN 1..10000 LOOP
		INSERT INTO inx_test VALUES (i);
	END LOOP;
	COMMIT;
END;
--		3. 예제 테이블에 인덱스 생성하기
CREATE INDEX idx_inxtest_no ON inx_test(no);
--		4. 인덱스 상태 조회하기
ANALYZE INDEX idx_inxtest_no VALIDATE STRUCTURE;

SELECT (del_lf_rows_len / lf_rows_len) * 100 AS BALANCE
FROM index_stats
WHERE name='IDX_INXTEST_NO'; -- 인덱스 이름은 대문자로 작성
-- 위의 SELECT 문에서 0에 가까울 수록 좋은 상태를 의미한다.

--		5. 원본 데이터 삭제하기
DELETE FROM INX_TEST 
WHERE NO BETWEEN 1 AND 4000;

SELECT COUNT(*) FROM INX_TEST;

--		6. 삭제한 이후에 인덱스 상태 조회하기
ANALYZE INDEX idx_inxtest_no VALIDATE STRUCTURE;

SELECT (del_lf_rows_len / lf_rows_len) * 100 AS BALANCE
FROM index_stats
WHERE name = 'IDX_INXTEST_NO';

--		7. REBUILD 작업
ALTER INDEX idx_inxtest_no REBUILD;

-- 		8. REBUILD 이후에 인덱스 상태 조회하기
ANALYZE INDEX IDX_INXTEST_NO VALIDATE STRUCTURE;

SELECT (DEL_LF_ROWS_LEN / LF_ROWS_LEN) * 100 AS BALANCE
FROM INDEX_STATS
WHERE NAME = 'IDX_INXTEST_NO';

-- 7. INVISIBLE INDEX ( 인비저블 인덱스 )
--		인덱스를 실제로 삭제하기 전에 "사용안함" 상태로 만들어서 
--		테스트를 해볼 수 있는 기능
--		예제
--		1. 예제 인덱스를 생성
CREATE INDEX IDX_EMP_SAL ON EMP(SAL);
--		2. 인덱스를 조회
SELECT TABLE_NAME, INDEX_NAME, VISIBILITY
FROM USER_INDEXES
WHERE TABLE_NAME = 'EMP';
--		3. 인덱스를 INVISIBLE 상태로 만들기
ALTER INDEX IDX_EMP_SAL INVISIBLE;
--		4. 인덱스 조회
SELECT TABLE_NAME, INDEX_NAME, VISIBILITY
FROM USER_INDEXES
WHERE TABLE_NAME = 'EMP';
--		5. 다시 인덱스를 VISIBLE 상태로 만들기
ALTER INDEX IDX_EMP_SAL VISIBLE;
--		6. 인덱스 조회
SELECT TABLE_NAME, INDEX_NAME, VISIBILITY
FROM USER_INDEXES
WHERE TABLE_NAME = 'EMP';

-- 8. 인덱스를 활용한 여러가지 방법들
--		1. 인덱스를 활용해서 정렬한 효과 내기
--			ORDER BY 구문을 이용하면 쿼리문 실행할때마다 정렬과정이 들어간다.
--			대신 인덱스를 정해놓으면 인덱스에 따라서 쿼리문을 출력한다.
--			a. 예제 테이블 만들기
CREATE TABLE test_idx1(
	NO NUMBER,
	name varchar2(10),
	sal NUMBER 
);
--			b. 예제 테이블에 데이터 넣기
INSERT INTO test_idx1 values(1000, 'SMITH', 300);
INSERT INTO test_idx1 values(1001, 'ALLEN', 250);
INSERT INTO test_idx1 values(1002, 'KING', 430);
INSERT INTO test_idx1 values(1003, 'BLAKE', 220);
INSERT INTO test_idx1 values(1004, 'JAMES', 620);
INSERT INTO test_idx1 values(1005, 'MILLER', 810);

SELECT * FROM TEST_IDX1;
--			c. name 에 인덱스 달아주기
CREATE INDEX idx_testidx1_name ON test_idx1(name);

SELECT table_name, COLUMN_NAME, index_name 
FROM user_ind_columns
WHERE TABLE_NAME = 'TEST_IDX1';
--			d. 일반 데이터 조회하기 (인덱스 사용 x)
SELECT name
FROM test_idx1;
--			e. 인덱스를 사용해서 조회하기
--	where 절에 조건으로 name 컬럼이 쓰였기 때문에 index가 작동해서
--  자동으로 정렬되어 나온다.
SELECT name
FROM TEST_IDX1
WHERE name > '0';

--		2. 인덱스를 활용하여 최대, 최소값 확인하기
--			a. 인덱스 활용 x 최소값 확인하기
--				- 쿼리문을 실행할 때마다 정렬을 해서 최소값을 찾는다.
SELECT min(name)
FROM test_idx1;
--			b. 인덱스 활용 o 최소값 확인하기
SELECT name
FROM test_idx1
WHERE name > '0'
AND rownum = 1;
--			c. 인덱스 활용 x 최대값 확인하기
--				- 쿼리문을 실행할 때마다 정렬을 해서 최대값을 찾는다.
SELECT max(name)
FROM test_idx1;
--			d. 인덱스 활용 o 최대값 확인하기
--				- 인덱스는 기본적으로 오름차순으로 저장이 되어있다.
--				- 반대로 읽어오는 힌트 구문을 사용해야한다.
SELECT /*+ INDEX_DESC(i IDX_TESTIDX1_NAME) */ name
FROM test_idx1 i
WHERE name > '0'
AND rownum = 1;
--		** 주의사항
--			인덱스가 문제 없을 때는 정상적으로 작동하지만
--			원본 데이터가 삭제되어서 빈칸이 있을 경우에는 정상적으로 작동 안할 수도 있다.
--			그래서, 아래의 쿼리처럼 써줘야 제대로 안나올 경우 
--			max 함수를 실행해서 정상적으로 출력한다.
SELECT /*+ INDEX_DESC(i IDX_TESTIDX1_NAME) */ max(name)
FROM test_idx1 i
WHERE name > '0'
AND rownum = 1;

-- 9. 인덱스 삭제하기 (DROP)
--	사용법 : DROP INDEX 인덱스명;
DROP INDEX idx_testidx1_name;

SELECT TABLE_name, index_name
FROM user_indexes
WHERE table_name = 'TEST_IDX1';

-- 10. ROWID 에 대해서
--	  기본적으로 프로그래밍에서 데이터를 저장하고 찾으려면 
--		"주소"를 찾아온다 라는 용어를 많이쓴다.
--	  위에서 말하는 "주소"가 데이터베이스에서 ROWID로 쓰인다.
--	  ROWID 총 10byte 로 이루어져 있다.
SELECT rowid, empno, ename
FROM emp
WHERE empno = 7902;
--	  ROWID : AAAR6SAAOAAAAGdAAM
--	  AAAR6S - 데이터 오브젝트 번호
--	  AAO	 - 파일 번호
--	  AAAAGd - BLOCK 번호
--	  AAM	 - ROW 번호


-- VIEW(뷰)
--	VIEW ? 가상 테이블을 의미한다.
--		하나 이상의 테이블을 조회하는 SELECT 쿼리문을 저장한 객체
--		사용 목적 : 보안, 편리성
--			편리성 : 자주 사용하는 쿼리문 저장해놓고 한 번에 확인 가능
--			보안 : 남에게 보여주기 힘든 데이터를 보여주지 않는다

--	EMP 테이블에서 이름과 부서번호만 타인에게 보여주고 싶다.
--		1. 이름과 부서번호만 따로 테이블을 만들어서 그 테이블을 보여준다.
--			> EMP테이블을 수정하게 되면, 복사한 테이블에는 반영되지 않는다.
--		2. VIEW로 이름과 부서번호만 쿼리문을 작성해서 보여준다.

--	VIEW의 주요 용도로는 조회하는 경우에 많이 사용한다.

--	1. 단순 뷰 (Simple View)
--		VIEW를 생성하기 위해서는 사용자 권한이 필요하다.
--		시스템 계정에 가서 SCOTT 계정에 VIEW를 생성하는 권한을 부여한다.
--		CMD 창에서 SYSTEM 계정으로 로그인해서 권한 부여 코드를 작성한다.
--		권한 부여 코드 : GRANT CREATE VIEW TO SCOTT;
--		- 뷰 생성 문법
--			CREATE [OR REPLACE] [FORCE|NOFORCE] VIEW 뷰이름
--			AS SELECT쿼리문
--			[ WITH CHECK OPTION ]
--			[ WITH READ ONLY ]
--			생략가능한 옵션 기능
--			OR REPLACE : 같은 이름의 VIEW가 존재할 때 삭제 후 다시 생성
--			FORCE : 기본 테이블의 존재 여부에 상관없이 VIEW를 생성
--			NOFORCE : 기본 테이블이 존재해야만 VIEW를 생성
--			WITH CHECK OPTION : 주어진 제약조건에 맞는 데이터만 입력 및 수정이 가능
--			WITH READ ONLY : SELECT만 가능한 읽기 전용 VIEW를 생성

--		뷰 생성 예제 ) EMP 테이블의 EMPNO, ENAME, HIREDATE 
--					컬럼으로 이루어진 VIEW를 생성
CREATE OR REPLACE VIEW V_EMP1
AS
	SELECT EMPNO, ENAME, HIREDATE
	FROM EMP;

SELECT * FROM V_EMP1;

--		뷰의 경우에는 직접적인 데이터를 저장한 게 아니라서 인덱스를 만들 수 없다.
CREATE INDEX IDX_V_EMP_ENAME ON V_EMP1(ENAME);

--		VIEW를 통해서 데이터를 변경하기
--			보통 조회용으로 많이 쓰이지만, 데이터도 변경할 수 있다.
--		1. 예제 테이블 만들기
CREATE TABLE VIEW_TEST1(
	A NUMBER,
	B NUMBER
);
--		2. 예제 뷰 만들기
CREATE VIEW VT1_VIEW
AS
	SELECT A, B
	FROM VIEW_TEST1;
--		3. 예제로 만든 뷰에다가 데이터 넣기
INSERT INTO VT1_VIEW VALUES (1, 2);

SELECT * FROM VT1_VIEW;
SELECT * FROM VIEW_TEST1;
--		4. 뷰의 데이터를 수정해보기
UPDATE VT1_VIEW
SET B = 3
WHERE A = 1;

SELECT * FROM VT1_VIEW;
SELECT * FROM VIEW_TEST1;
--		5. 뷰의 데이터를 삭제해보기
DELETE FROM VT1_VIEW 
WHERE A = 1;

SELECT * FROM VT1_VIEW;
SELECT * FROM VIEW_TEST1;
--		결론 : VIEW 의 데이터를 변경하면, 원본 테이블의 데이터도 변경이된다.

--		VIEW 의 데이터를 변경하지 못하게 읽기전용으로 생성
CREATE VIEW VT1_VIEW2
AS
	SELECT A,B
	FROM VIEW_TEST1
WITH READ ONLY;
--		읽기 전용인 뷰에다가 데이터 넣어보기 ( 읽기 전용이기 때문에 에러 출력 )
INSERT INTO VT1_VIEW2 VALUES (4, 5);

--		읽기 전용이 아닌 뷰에 데이터를 넣고 읽기 전용이 뷰를 조회해보기
INSERT INTO VT1_VIEW VALUES (4,5);

SELECT * FROM VT1_VIEW2; -- SELECT쿼리문을 불러오기 때문에 데이터 조회 가능

-- 		옵션 중 WITH CHECK OPTION 예제 보기
--		 예제 데이터 삽입
INSERT INTO VIEW_TEST1 VALUES(3,4);
INSERT INTO VIEW_TEST1 VALUES(5,6);

SELECT * FROM VIEW_TEST1;
--		 뷰 생성
CREATE VIEW VT1_VIEW3
AS
	SELECT A, B
	FROM VIEW_TEST1
	WHERE A = 3
WITH CHECK OPTION;
--		뷰 조회
SELECT * FROM VT1_VIEW3;
--		뷰를 통해서 데이터를 수정해보기
--		A = 3 이라는 조건이 있기 때문에 A를 수정할 수 없다.
UPDATE VT1_VIEW3
SET A = 5
WHERE B = 4;
--		A = 3 의 데이터를 수정하지 않고 다른 컬럼을 수정했기 때문에 가능하다.
UPDATE VT1_VIEW3
SET B = 10
WHERE A = 3;

SELECT * FROM VT1_VIEW3;
SELECT * FROM VIEW_TEST1;
--		A = 3 인 데이터를 삭제해보기
DELETE FROM VT1_VIEW3
WHERE A = 3;

SELECT * FROM VT1_VIEW3;
SELECT * FROM VIEW_TEST1;
--		WITH CHECK OPTION을 사용 시에는 변경은 할 수 없지만, 삭제는 가능

--  복합 뷰 ( COMPLEX VIEW )
--		AS 이후에 쿼리문을 작성하는 부분에 여러 TABLE이 JOIN되어 생성되는 뷰
--		예제 ) EMP 테이블의 ENAME과 DEPT 테이블의 DNAME을 보여주는 뷰
CREATE OR REPLACE VIEW EMP_DEPT_VIEW
AS
	SELECT e.ename, d.dname
	FROM emp e, dept d
	WHERE e.deptno = d.deptno;

SELECT * FROM emp_dept_view;
--	복합 뷰의 주의 사항
--		위의 뷰에서 ename만 조회할 경우, 뷰 자체는 테이블 두 개가 
--		JOIN되어 있으므로 하나만 조회하더라도 테이블 두 개에 접근하게 된다.
SELECT ENAME FROM EMP_DEPT_VIEW;
--		위 쿼리처럼 ENAME의 컬럼을 조회하고 싶다면,
--		EMP테이블만 접근하면 되지만 VIEW 자체의 쿼리문이 JOIN한 상태이기때문에
--		불필요하게 다른 테이블도 접근을 해야한다. ( 성능이 저하될 수 있다. )

--	INLINE VIEW(인라인 뷰)
--		SQL 문장의 FROM 절에 VIEW의 SELECT쿼리문을 바로 작성해서 사용한다.
--	예제 ) EMP테이블과 DEPT 테이블을 조회하여, 부서 번호와 부서별 최대 급여 및 부서명을 출력
--		1. 인라인뷰를 사용하지 않았을 경우
CREATE VIEW EMP_MAX_VIEW
AS	
	SELECT DEPTNO, MAX(SAL) AS SAL
	FROM EMP
	GROUP BY DEPTNO;

SELECT * FROM EMP_MAX_VIEW;

SELECT e.deptno, d.dname, e.sal
FROM EMP_MAX_VIEW e, dept d
WHERE e.deptno = d.deptno;

--		2. 인라인뷰를 사용해서 조회할 경우
SELECT e.deptno, d.dname, e.sal
FROM dept d,
	 ( SELECT deptno, max(sal) sal
	   FROM EMP e 
	   GROUP BY deptno ) e
WHERE e.deptno = d.deptno;
-- 위 from 절에서 소괄호() 안에 쿼리문을 작성하는 방법을 인라인 뷰라고 한다.

-- VIEW : 필요할 때 생성해서 다른 쿼리에서 반복적으로 사용할 때.
-- inline VIEW : 일시적으로 한 번만 사용할 때.

--	예제 2 ) LAG함수와 INLINE VIEW를 사용해서 중복되는 항목을
--			제거하고 보여주는 쿼리문
--			LAG 함수 : 이전 행의 값을 가져오는데 사용하는 함수
--			LAG 함수를 사용한 쿼리문
SELECT LAG(DEPTNO) OVER (ORDER BY DEPTNO) AS NDEPTNO,
	   DEPTNO, PROFNO, NAME
FROM PROFESSOR;
--			인라인 뷰를 통해 전체적인 결과물 보기
SELECT DECODE(DEPTNO, NDEPTNO, NULL, DEPTNO) AS DEPTNO,
	   PROFNO, NAME
FROM (SELECT LAG(DEPTNO) OVER (ORDER BY DEPTNO) AS NDEPTNO,
	   		 DEPTNO, PROFNO, NAME
	  FROM PROFESSOR);

-- VIEW 조회 및 삭제하기
--	 VIEW 조회하기 : USER_VIEWS 데이터사전을 조회
SELECT VIEW_NAME, TEXT, READ_ONLY
FROM USER_VIEWS;
--		TEXT 컬럼 : VIEW 에 작성된 SELECT 쿼리문을 나타낸다.
--		READ_ONLY 컬럼 : Y(YES) / N(NO)를 통해서 읽기 전용인지 아닌지 출력

--	 VIEW 삭제하기 : DROP VIEW 뷰이름
DROP VIEW V_EMP1;

-- 구체화된 뷰 ( Materialized View - MVIEW )
--	일반적인 뷰 : 데이터를 가지고 있지 않고 쿼리문을 가지고 있다.
--	구체화된 뷰 : 데이터를 가지고 있는 뷰

--	일반적인 뷰를 사용하면 여러 사용자가 뷰를 
--	조회할 때 계속 테이블에 접근해야하기 때문에, 부하가 걸릴 수 있다.
--	반면에, 구체화된 뷰는 한 번 생성할 때 테이블에 접근한 이후 
--	데이터를 가지고 있는 뷰이기 때문에 여러 사용자가 조회해도 테이블에 부하가 없다.
--	그래서 사용자가 많고, 데이터가 많을수록 MVIEW를 사용하는 것이 효율적이다.

--	MVIEW를 생성할 때는 권한이 필요하다.
--	QUERY REWRITE 와 CREATE MATERIALIZED VIEW 라는 권한이 필요

-- 	생성 예제 ) PROFESSOR 테이블에서 PROFNO, NAME, PAY를 가져오는 MVIEW

CREATE MATERIALIZED VIEW m_prof -- 1행
BUILD IMMEDIATE					-- 2행
REFRESH							-- 3행
ON DEMAND						-- 4행
COMPLETE						-- 5행
ENABLE QUERY REWRITE			-- 6행
AS								-- 7행
	SELECT PROFNO, NAME, PAY
	FROM PROFESSOR;
-- 1행 : MVIEW를 만드는 CREATE 구문
-- 2행 : 생성하면서 즉시 AS 이후의 SELECT 쿼리문을 수행해서 데이터를 가져오라 라는 뜻
-- 3행~5행 : 데이터 동기화 방법
--		3행 : 데이터 동기화 (REFRESH 새로고침)
--		4행 : 언제 동기화할지 결정 
--			( ON DEMAND(수동 동기화) / ON COMMIT(COMMIT 될때 자동 동기화) )
--			**** 원본 테이블에 변경이 많을 경우에 ON COMMIT을 사용하면  
--			COMMIT이 발생할 때마다 동기화를 하기 때문에 성능이 많이 떨어질 수 있다.
--		5행 : 동기화 하는 방법(4가지)
--			COMPLETE : 데이터 전체를 원본 테이블과 동기화
--			FAST : 새로운 데이터가 입력될 경우 그 부분만 동기화
--			FORCE : FAST 방법이 가능한지 살펴보고 안되면 COMPLETE방법으로 동기화
--			NEVER : 동기화를 하지 않음
-- 6행 : 쿼리를 변경할 수 있다. -- 조금 심오한 관계로 다루지 않음.

-- MVIEW 는 실제 데이터를 가지고 있기 때문에 인덱스가 생성 가능
CREATE INDEX IDX_M_PROF_PAY ON M_PROF(PAY);

-- MVIEW 관리하기
--	1. 수동으로 원본 테이블과 데이터 동기화하기
--		원본 테이블의 데이터를 삭제하고 원본 테이블과 MVIEW의 데이터 갯수 확인하기
DELETE FROM PROFESSOR WHERE PROFNO = 4007;

SELECT COUNT(*) FROM PROFESSOR; -- 데이터 16개중 하나를 삭제해서 15개 출력
SELECT COUNT(*) FROM M_PROF; -- 원본 테이블과 동기화 하지 않아서 16개 출력
--		MVIEW 동기화하기 ( PL/SQL을 사용 )
BEGIN
	DBMS_MVIEW.REFRESH('M_PROF');
END;

SELECT COUNT(*) FROM PROFESSOR;
SELECT COUNT(*) FROM M_PROF; -- 원본 테이블과 동기화 되어서 15개로 출력

--	2. MVIEW 조회하기
--		USER_MVIEWS 라는 데이터 사전에서 조회가 가능하다.
SELECT MVIEW_NAME, QUERY
FROM USER_MVIEWS
WHERE MVIEW_NAME = 'M_PROF';

SELECT * FROM USER_MVIEWS WHERE MVIEW_NAME = 'M_PROF';

--	3. MVIEW 삭제하기
--   DROP MATERIALIZED VIEW 구체화된뷰이름;
DROP MATERIALIZED VIEW M_PROF;

-- 연습문제 1. PROFESSOR 테이블과 DEPARTMENT 테이블을 조인하여 교수 번호와
--			 교수이름, 소속 학과이름을 조회하는 VIEW를 생성하라
--			 VIEW이름은 V_PROF_DEPT2 로 하세요.
SELECT * FROM PROFESSOR;
SELECT * FROM DEPARTMENT;
-- 교수번호 : P.PROFNO / 교수명 : P.NAME / 학과이름 : D.DNAME
-- 학과번호 : DEPTNO(조인조건)
CREATE OR REPLACE VIEW V_PROF_DEPT2
AS
	SELECT  p.profno, p.name, d.dname
	FROM	PROFESSOR p, DEPARTMENT d
	WHERE	p.deptno = d.deptno;

SELECT * FROM v_prof_dept2;

-- 연습 문제 2. inline view를 사용하여 아래의 그림과 같이 student 테이블과
--			  department 테이블을 사용하여 학과별로 학생들의 최대 키와
--			  최대 몸무게, 학과 이름을 출력하세요.
SELECT * FROM student;
SELECT * FROM department;
-- 키 : s.height / 몸무게 : s.weight / 학과 이름 : d.dname
-- 조인조건 : s.deptno1 = d.deptno
SELECT  d.dname, s.max_height, s.max_weight
FROM 	department d,
	   (SELECT deptno1, MAX(height) AS max_height, 
			   MAX(weight) AS max_weight
		FROM student
		GROUP BY deptno1) s
WHERE	s.deptno1 = d.deptno;









