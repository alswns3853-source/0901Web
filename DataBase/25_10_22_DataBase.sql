-- 계층형 쿼리 
--		:상 하위 관계를 표시하여 보기 편하게 만들어주는 쿼리
--  LEVEL : 계층 간에 몇 단계인지를 알려주는 용어

-- 계층형 쿼리를 사용하지 않고 ,EMP 테이블의 Ename 를 보기
SELECT ename FROM emp;

-- 계층형 쿼리를 사용해서 EMP 테이블의 ENAME을 보기 
SELECT LPAD(ENAME,LEVEL * 4,'-')AS ENAMEM, LEVEL
FROM EMP
CONNECT BY PRIOR EMPNO = MGR
START WITH EMPNO = 7839;

SELECT EMPNO,ENAME,MGR
FROM EMP;

-- 쿼리 해석
-- SELECT 절의 LPAD (ENAME,LEVEL * 4 , '-')
--  > LEVEL * 4BYTE의 길이로 출력하되 , 왼쪽 빈자리는 '-' 으로 채워라
-- CONNECT BY PRIOR절
-- 	>각 행들이 어떤 형식으로 레벨이 결정되는지 조건을 지정
--  > PRIOR 은 '상위의' 라는 뜻을 지니고 있다.
--START WITH절
--      >데이터를 계층화하는 데 시작이되는 데이터의 조건을 지정
-- CONNET BY PRIOR 절 주의사항
-- 		PRIOR 의 위치가 중요하다

SELECT LPAD (ENAME, LEVEL*5,'-') AS ENAME
FROM EMP
CONNECT BY PRIOR EMPNO = MGR
START WITH EMPNO = 7839;

SELECT LPAD (ENAME,LEVEL*5,'-')AS ENAME
FROM EMP
CONNECT BY EMPNO = PRIOR MGR
START WITH EMPNO = 7369;

SELECT EMPNO , ENAME,MGR
FROM EMP;
--
--계층형 쿼리가 수행되는 순서 
--1.START WITH 절에 시작 데이터의 조건을 찾는다
--2.CONNECT BY 절에 연결조건을 찾는다.
--3. WHERE 절의 조건을 검색한다.

-- 계층형 쿼리를 작성할 떄의 주의사항
-- CONNECT BY 절에는 SUB QUERY를 사용할 수 없다.
-- >데이터가 많을 경우 시간이 오래걸릴 수 있으므로  START WITH절,
--CONNECT BY절 , WHERE 절의 컬럼에 적절히 인덱스가 설정되어 있어야 한다.
--부분처리기법 은 아쉽게도 계층형 쿼리에서 사용할 수 없다.

-- 예제로 보는 계층형 쿼리의 구조
SELECT 
  EMPNO,ENAME,JOB,MGR,
  PRIOR ENAME AS MGR_NAME,
  LEVEL,
  LPAD(' ', (LEVEL - 1) * 4) || ENAME AS DEPTH_ENAME,
  SYS_CONNECT_BY_PATH(ENAME, '-') AS ENAME_LIST
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR
ORDER SIBLINGS BY EMPNO;

-- START WITH 절 : MGR IS NULL
--  > 시작 데이터는 MGR을 NULL로 가지는 데이터로 시작
-- CONNECT BY 절 : PRIOR EMPNO = MGR
--	> 상위 단계의 EMPNO 는 다음 단계의 MGR 이 된다.
-- 	ORDER SIBLINGS BY 절 : EMPNO
--	>같은 단계에서의 정렬 방법을 EMPNO를 기준으로 출력한다.
-- SYS_CONNECT_BY_PATH(ENAME,'-')
--	> 각 단계를 1단계부터 현재 단계까지 '-'을 구분자로하여 보여준다.

-- 계층이 쌓이는 순서
-- .START WITH MGR IS NULL 부터 데이터가 시작
--  >> 7839 KING의 데이터부터 시작
--2. CONNECT BY 7893를 다음 단계의 mgr로 가지는 데이터를 찾는다
-->> 7566 jONES | 7698 BLACKE | 7782 CLARK (levael 2)
-->> 상위 단계의 7566 을 다음 단계의 mgr로 가지는 데이터를 찾고,
-->> 상위 단계의 7698 을 다음 단계의 mgr로 가지는 데이터를 찾고,
-->> 상위 단계의 7782 을 다음 단계의 mgr로 가지는 데이터를 찾는다,(LEVEL 3)
--위 방식으로 계속 정리하게 되면 p484 의 트리 형식으로 정리가 된다.

-- 계층 구조에서 일부분만 계층화 하기
--	1. 계층 전체를 제외하기
SELECT empno,job,mgr,LEVEL,
lpad('',(LEVEL-1)*4,'')|| ename AS depth_ename,
SYS_CONNECT_BY_PATH(ename,'-')AS ename_list
FROM emp e
START WITH mgr IS NULL
CONNECT BY PRIOR empno = mgr AND ename<>'JONES'
ORDER SIBLINGS BY ename;
--	2. 계층 자체는 놔두고 하나의 노드만 제외하기
SELECT empno,job,mgr,LEVEL,
lpad('',(LEVEL-1)*4,'')|| ename AS depth_ename,
SYS_CONNECT_BY_PATH(ename,'-')AS ename_list
FROM emp e
WHERE ename<>'JONES'
START WITH mgr IS NULL
CONNECT BY PRIOR empno = mgr
ORDER SIBLINGS BY ename;
-- 따라서 , CONNECT BY 절에 조건을 달면 계층 구조 전개 조건이 되고 
--		WHERE 절에 조건을 달면 계층 구조를 다 생성한 후에 조건에 맞는 값만 보여준다.

-- 계층형 쿼리에서 사용할 수 있는 함수
--	1.CONNECT_BY_ISLEAF()함수
--	LEAF - > 나뭇잎 -> TREE 구조의 마지막 노드를 뜻한다.
--		0 과 1의 값을 반환하며
--		0 - > 자식(하위 단계)가(이) 있다.
--		1 - > 자식  (하위 단계)가(이) 없다.
--	예제 ) CONNECT_BY_ISFEAF() 사용하지 않고 전체 데이터 보기 
SELECT  LPAD(' ', (LEVEL-1)*4,' ') || ENAME AS ENAME,
  		SYS_CONNECT_BY_PATH(ENAME, '->') AS "ORDER (LOW -> HIGH)"
FROM EMP
START WITH EMPNO = 7369
CONNECT BY PRIOR MGR = EMPNO;
--	예제 ) CONNECT_BY_ISFEAF = 0 놓고 마지막 단계 데이터 없애기
SELECT  LPAD(' ', (LEVEL-1)*4,' ') || ENAME AS ENAME,
  		SYS_CONNECT_BY_PATH(ENAME, '->') AS "ORDER (LOW -> HIGH)"
FROM EMP
WHERE CONNECT_BY_ISLEAF = 0
START WITH EMPNO = 7369
CONNECT BY PRIOR MGR = EMPNO;
--	예제 ) CONNECT_BY_ISFEAF = 1 놓고 마지막 단계 데이터만 보기
SELECT  LPAD(' ', (LEVEL-1)*4,' ') || ENAME AS ENAME,
  		SYS_CONNECT_BY_PATH(ENAME, '->') AS "ORDER (LOW -> HIGH)"
FROM EMP
WHERE CONNECT_BY_ISLEAF = 1
START WITH EMPNO = 7369
CONNECT BY PRIOR MGR = EMPNO;

-- 2.CONNECT_BY_ROOT() 함수
--  현재 단계에서 최상위 단계의 값을 찾아주는 함수
SELECT EMPNO, ENAME, CONNECT_BY_ROOT EMPNO AS ROOT_EMPNO,
CONNECT_BY_ROOT ENAME AS ROOT_ENAME,
SYS_CONNECT_BY_PATH(ENAME,'<-') AS "ROOT <- LEAF"
FROM EMP
WHERE LEVEL > 1  
AND EMPNO = 7369   
CONNECT BY PRIOR EMPNO = MGR;
-- 2단계
SELECT EMPNO, ENAME, CONNECT_BY_ROOT EMPNO AS ROOT_EMPNO,
CONNECT_BY_ROOT ENAME AS ROOT_ENAME,
SYS_CONNECT_BY_PATH(ENAME,'<-') AS "ROOT <- LEAF"
FROM EMP
WHERE LEVEL = 2 
AND EMPNO = 7369   
CONNECT BY PRIOR EMPNO = MGR;

-- 3단계
SELECT EMPNO, ENAME, CONNECT_BY_ROOT EMPNO AS ROOT_EMPNO,
CONNECT_BY_ROOT ENAME AS ROOT_ENAME,
SYS_CONNECT_BY_PATH(ENAME,'<-') AS "ROOT <- LEAF"
FROM EMP
WHERE LEVEL = 3  
AND EMPNO = 7369   
CONNECT BY PRIOR EMPNO = MGR;

-- 계층형 쿼리 문제 1) EMP2 테이블과 DEPT2 테이블을 사용
--	사원명,부서,직급을 합쳐서 출력하되 부서와 직급별로 계층형 쿼리를 사용하여 출력
--  단 , 직급이 없는 사람들은 직급을 'Team-Worker'로 출력          
--  LPAD(' ',(level-1)*4,' ') || 이름 || 부서 || 직급 AS name_and_position
SELECT	lpad(' ', (level-1)*4, ' ') || e.name || '-' || d.dname || 
		'-' || NVL(e.POSITION, 'Team-Worker') AS NAME_AND_POSITION
FROM	emp2 e, dept2 d
WHERE	e.deptno = d.dcode
CONNECT BY PRIOR e.empno = e.pempno
START WITH pempno IS NULL
ORDER SIBLINGS BY e.name;
--	계층형 쿼리 문제 2) EMP2 테이블과 DEPT2 테이블 사용
--		EMP2 테이블에서 Kevin Bacon-Engineering division-Department head"
--		아래에 속한 부하직원만 계층 쿼리로 조회해서 출력하세요.
--  	단 , 직급이 없는 사람들은 직급을 'Team-Worker'로 출력          
SELECT	lpad(' ', (level-1)*4, ' ') || e.name || '-' || d.dname || 
		'-' || NVL(e.POSITION, 'Team-Worker') AS NAME_AND_POSITION
FROM	emp2 e, dept2 d
WHERE	e.deptno = d.dcode
CONNECT BY PRIOR e.empno = e.pempno
START WITH e.name = 'Kevin Bacon'
ORDER SIBLINGS BY e.name;
--	계층형 쿼리 문제 3) EMP2 테이블과 DEPT2 테이블 사용
--		Kevin Constner 사원의 상사들을 계층 쿼리로 출력하세요.
SELECT	lpad(' ', (level-1)*4, ' ') || e.name || '-' || d.dname || 
		'-' || NVL(e.POSITION, 'Team-Worker') AS NAME_AND_POSITION
FROM	emp2 e, dept2 d
WHERE	e.deptno = d.dcode
CONNECT BY e.empno = PRIOR e.PEMPNO
START WITH e.name = 'Kevin Costner';
--	계층형 쿼리 문제 4) EMP2 테이블 사용
--		사원의 이름과 그 상사의 이름이 함께 나오도록 계층형 쿼리를 작성하세요.
SELECT	name, PRIOR name
FROM 	emp2
CONNECT BY PRIOR empno = pempno
START WITH pempno IS NULL;
--	계층형 쿼리 문제 5) 2번 문제의 쿼리에 계층 전체 리스트를 추가해서 출력하세요.
SELECT	lpad(' ', (level-1)*4, ' ') || e.name || '-' || d.dname || 
		'-' || NVL(e.POSITION, 'Team-Worker') AS NAME_AND_POSITION,
		sys_connect_by_path(e.name, '-') AS path
FROM	emp2 e, dept2 d
WHERE	e.deptno = d.dcode
CONNECT BY PRIOR e.empno = e.pempno
START WITH e.name = 'Kevin Bacon'
ORDER SIBLINGS BY e.name;
--	계층형 쿼리 문제 6) EMP2 테이블과 DEPT2 테이블을 사용
--		사원 번호, 사원이름-부서-직급, 부하직원의 수를 출력하라
--		스칼라 서브 쿼리를 이용해서 작성할 것임.
SELECT	EMPNO, 
		E1.NAME || '-' || D.DNAME || '-' || 
		NVL(E1.POSITION, 'TEAM-WORKER') AS NAME_AND_POSITION,
		( SELECT COUNT(*) FROM EMP2 E2
		  CONNECT BY PRIOR E2.EMPNO = E2.PEMPNO
		  START WITH E2.EMPNO = E1.EMPNO ) -1 AS COUNT
FROM 	EMP2 E1, DEPT2 D
WHERE	E1.DEPTNO = D.DCODE
ORDER BY COUNT DESC;


------------ 이 이후로는 SYSTEM 계정과 CMD창으로 진행했습니다.----------------

--	사용자, 권한, 롤
--	사용자 = 계정
--	사용자는 보통 SYSTEM(DBA) 계정에서 만들도록 되어있다.

--	계정을 생성하는 문법
--	(필수) CREATE USER 사용자이름					> 유저명을 지정		
--	(필수) IDENTIFIED BY 비밀번호					> 비밀번호를 지정
--	(선택) DEFAULT TABLESPACE 테이블스페이스이름		> 데이터를 저장할 공간을 지정
--	(선택) TEMPORARY TABLESPACE 테이블스페이스그룹이름	> 임시 데이터를 저장할 임시 공간 지정
--	(선택) QUOTA 테이블스페이스크기 ON 테이블스페이스이름	> 테이블스페이스에 얼만큼 용량을 사용할 수 있는 지정
--	(선택) PROFILE 프로파일이름						> 사용자에게 리소스 제한, 비밀번호 정책 등을 정의한 규칙을 지정
--	(선택) PASSWORD EXPIRE						> 첫 로그인 시 무조건 비밀번호를 변경하게 함
--	(선택) ACCOUNT [LOCK / UNLOCK]				> 계정을 잠금 / 잠금 해제

CREATE USER test_orcl
IDENTIFIED BY 1234;
--	이름이 부적합하다 라는 에러가 뜬다
--		> 오라클 12c 버전 이후에는 C##유저이름의 형식으로 만들어야한다.

--	C## 을 붙이기 싫으면 하나의 코드를 실행하면 된다.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 	사용자 계정 생성
CREATE USER test_orcl
IDENTIFIED BY 1234;

--	CMD 창으로 test_orcl 에 접속. --> 권한이 없어서 로그인 불가
--		CMD 창에 로그인할 때 > SQLPLUS 사용자이름/비밀번호

--	데이터베이스 사용자에 대해서는 CREATE SESSION 이라는 권한이 있어야 로그인이 가능하다.
GRANT CONNECT, RESOURCE TO TEST_ORCL;

--	권한을 부여한 뒤 CMD 창에 로그인하면 로그인이 정상적으로 된다.

--	사용자 정보 조회
--		ALL_USERS 또는 DBA_USERS 또는 DBA_OBJECTS 데이터 사전을 이용하여 조회
--		ALL_USERS 또는 DBA_USERS 데이터사전은 USER 관련해서 정보를 제공
SELECT * FROM ALL_USERS
WHERE USERNAME = 'TEST_ORCL'; -- USERNAME 작성시에는 대문자로 작성
SELECT * FROM DBA_USERS
WHERE USERNAME = 'TEST_ORCL';
--		DBA_OBJECTS 데이터사전은 USER가 가지고 있는 객체의 정보를 제공
SELECT * FROM DBA_OBJECTS
WHERE OWNER = 'SCOTT';

--	사용자 계정의 비밀번호를 변경하기 ( 사용자 정보 변경하기 )
--	사용자 계정을 변경 또는 수정할 때
--		>> ALTER USER 사용자명
--		>> 변경할 사용자 옵션들을 작성
ALTER USER TEST_ORCL
IDENTIFIED BY 1111;

--	변경 후에 CMD 창에 변경이 되었는지 확인
--	CMD 창에서 패스워드를 입력하면 아무것도 안적히니, 정확하게 작성하고 엔터치면 로그인된다.

--	CMD창에 로그인한 후에 테이블 생성
--	CREATE TABLE TEST01(
--	NO NUMBER
--	);

--	TEST_ORCL 계정의 객체 확인
SELECT * FROM DBA_OBJECTS
WHERE OWNER = 'TEST_ORCL';

--	사용자 삭제
--		> 현재 접속중인 사용자는 삭제할 수 없다.
--		> 사용자가 객체를 가지고 있으면 삭제할 수 없다.
DROP USER TEST_ORCL;

--		> 객체가 있을 경우 그 객체까지 다 같이 삭제하는 명령어
DROP USER TEST_ORCL CASCADE;

--	권한
--	계정 접속, 테이블 생성, 시퀀스 생성, 뷰 생성, 동의어 생성 등등의 많은 권한
--	권한의 종류 ( 시스템권한 / 객체 권한 )
--		1. 시스템 권한
--			CREATE SESSION	> 계정이 접속 가능하게 만드는 권한
--			CREATE TABLE	> 테이블,인덱스,제약조건을 생성, 수정, 삭제
--			CREATE VIEW		> 뷰 생성, 수정, 삭제
--			CREATE SEQUENCE	> 시퀀스 생성, 수정, 삭제
--			CREATE SYNONYM	> 시노님(동의어) 생성, 수정, 삭제
--			CREATE ROLE		> 롤 생성, 수정, 삭제

--			CREATE ANY TABLE
--			ALTER ANY TABLE
--			DROP ANY TABLE
--			CREATE ANY VIEW 등등 ANY 가 붙으면 
--			본인의 계정 이외의 계정에도 만들 수 있는 권한을 준다.

--			시스템 권한을 부여하는 방법
--			GRANT [시스템권한] TO [사용자이름 / 롤이름 / PUBLIC]
--			[WITH ADMIN OPTION]
--			 > 시스템권한
--				위에 적힌 권한의 이름을 작성한다. 
--				여러개를 작성하려면 , 로 이어서 작성하면 된다.
--			 > 사용자이름 / 롤이름 / PUBLIC
--				권한을 부여할 대상 ( 사용자이름, 롤이름 )
--				여러 이름을 작성할 때에는 , 로 이어서 작성하면 된다.
--				PUBLIC - 데이터베이스에 등록된 모든 사용자에게 권한을 부여한다.
--			 > WITH ADMIN OPTION
--				부여받은 권한을 다른 사용자에게 부여할 수 있는 권한도 함께 준다.

--			테스트 계정 생성
CREATE USER TEST01
IDENTIFIED BY 0000;
--			테스트 계정에 접속권한과 테이블 만드는 권한을 부여
GRANT CREATE SESSION, CREATE TABLE TO TEST01;
--			CMD 창에 TEST01 로 접속해서
--			테이블을 하나 만들겠습니다.
--			SQLPLUS TEST01/0000   -> CMD창에서 계정 접속

--			CREATE TABLE TT01(
--			NO NUMBER
--			);    				  -> 테이블 생성

--			INSERT INTO TT01 VALUES (1); -> 데이터 삽입

--			에러 발생 ! TABLESPACE 에 대한 권한이 없다.
GRANT UNLIMITED TABLESPACE TO TEST01;

--			TABLESPACE 에 대한 용량을 늘려주는 방법
ALTER USER TEST01
QUOTA 2M ON USERS;

--			GRANT로 권한을 주는 방식은 용량 상관없이 테이블 스페이스를 사용하는 방법,
--			ALTER USER를 통해서 테이블 스페이스의 사용할 크기를 지정하는 방법

--		2. 객체 권한
--			테이블, 인덱스, 뷰, 시퀀스, 동의어 등에 관한 권한
--			테이블 - INSERT, UPDATE, DELETE, INDEX, REFERENCES, SELECT
--			뷰 - INSERT, DELETE, REFERENCES, SELECT, UPDATE
--			시퀀스 - ALTER, SELECT
--			등등 많은 객체 권한이 있다.

--			객체 권한 부여하는 기본 구문
--			GRANT [객체권한 / ALL PRIVILEGES] ON [유저명.객체이름]
--			TO [유저명/롤이름/PUBLIC] [WITH ADMIN OPTION]
--				> 객체권한 / ALL PRIVILEGES
--					부여할 객체 권한의 이름을 작성
--					ALL PRIVILEGES -> 객체에 관련한 모든 권한을 뜻함
--					여러 권한을 줄 때는 , 로 이어서 작성하면 된다.
--				> 유저명.객체이름
--					권한을 오픈해줄 사용자의 객체를 작성한다.
--					예) SCOTT의 EMP 테이블에 관한 권한을 준다 -> ON SCOTT.EMP
--				> 유저명 / 롤이름 / PUBLIC
--					받을 사용자의 이름 / 롤의 이름
--					여러 이름을 작성할 때에는 , 로 이어서 작성하면 된다.
--					PUBLIC -> 모든 사용자를 뜻한다.

--			예제) SCOTT 에게 TEST01 의 TT01 테이블을 조회할 수 있는 권한을 부여
GRANT SELECT ON TEST01.TT01 TO SCOTT;

--		권한 취소
--		1. 시스템 권한 취소
--			REVOKE [시스템권한] FROM [권한을가진사용자/롤/PUBLIC]
--			예제 ) TEST01 의 CREATE TABLE 권한을 취소
REVOKE CREATE TABLE FROM TEST01;
--		2. 객체 권한 취소
--			REVOKE [객체권한] ON [사용자명.객체명] FROM [권한을가진사용자/롤/PUBLIC]
--			예제 ) SCOTT가 가지고 있는 TEST01 사용자의 TT01 테이블을 SELECT하는 권한을 취소
REVOKE SELECT ON TEST01.TT01 FROM SCOTT;

--	롤 ( ROLE )
--		> 여러가지 권한을 묶은 그룹
--		> 대표적으로 쓰이는 기본적인 롤 ( CONNECT, RESOURCE )
--		CONNECT 롤 - CREATE SESSION
--		RESOURCE 롤 - CREATE TABLE, CREATE TYPE, CREATE SEQUENCE 등등
--			보통은 CONNECT, RESOURCE로 뷰, 동의어는 따로 권한을 부여해야한다. 

--		롤에 부여된 권한을 확인하는 방법
--			DBA_SYS_PRIVS 데이터사전을 이용한다.
--			예제 ) RESOURCE 롤에 부여된 권한을 확인하기
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE = 'RESOURCE';

--		사용자 롤을 만드는 과정
--			1. 롤을 생성 					> CREATE ROLE [롤 이름]
--			2. 롤에게 권한 부여				> GRANT [권한] TO [롤이름]
--			3. 권한을 가진 롤을 사용자에게 부여	> GRANT [롤이름] TO [사용자]
--			4. 권한이 필요없으면 권한 취소 		> REVOKE [롤이름] FROM [사용자]
--			5. 롤을 삭제					> DROP ROLE [롤이름]

--		예제 ) 롤을 생성하고 사용자에게 부여하고 부여한 롤을 취소하고 롤 삭제까지.
CREATE USER TEST02 IDENTIFIED BY 1111; -- 테스트 유저 생성

CREATE ROLE TEST_ROLE; -- 롤 생성
GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SYNONYM TO TEST_ROLE;
-- 생성한 롤에 담을 권한을 부여
GRANT TEST_ROLE TO TEST02; -- 생성한 테스트 유저에 롤을 부여

REVOKE TEST_ROLE FROM TEST02; -- 테스트 유저에 부여한 롤을 취소

DROP ROLE TEST_ROLE; -- 롤 삭제

--	롤에 등록된 권한을 수정하고 싶다면 ?
--		REVOKE 권한 FROM 롤이름	 --> 으로 취소하고
--		GRANT 권한 TO 롤이름	 --> 으로 다시 등록하면 된다.

--	사용자에게 부여된 권한(롤) 조회
SELECT * FROM USER_SYS_PRIVS;	-- 유저에게 부여된 시스템 권한 조회
SELECT * FROM USER_ROLE_PRIVS;	-- 유저에게 부여된 롤 조회
SELECT * FROM USER_TAB_PRIVS;	-- 유저에게 부여된 객체 권한 조회

--	문제 1 ) 시스템 계정으로 접속하여 PREV_HW 라는 계정을 생성하시오.
--			단, 비밀번호는 ORCL로 지정, 접속권한을 부여하고 
--			PREV_HW 계정으로 접속 확인하기

CREATE USER PREV_HW
IDENTIFIED BY ORCL;

GRANT CREATE SESSION TO PREV_HW;

--	문제 2 ) SCOTT 계정으로 접속하여 위에서 생성한 PREV_HW 계정에 
--			SCOTT 소유의 EMP, DEPT, SALGRADE 테이블에 
--			SELECT 권한을 부여하는 SQL문을 작성
--			권한을 부여했다면 PREV_HW 계정으로 SCOTT 의 
--			EMP, DEPT, SALGRADE 테이블이 잘 조회되는지 확인하시오.

GRANT SELECT ON EMP TO PREV_HW;
GRANT SELECT ON DEPT TO PREV_HW;
GRANT SELECT ON SALGRADE TO PREV_HW;

--	문제 3 ) SCOTT 계정으로 접속하여 PREV_HW 계정에 SALGRADE 테이블의 SELECT 권한을
--			취소하는 SQL문을 작성, 권한을 취소했다면, PREV_HW 계정으로 
--			SALGRADE 테이블을 조회하지 못하는 지 확인하시오.

REVOKE SELECT ON SALGRADE FROM PREV_HW;
