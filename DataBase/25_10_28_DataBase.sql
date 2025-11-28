--	PL/SQL
--		SQL문을 프로그래밍 언어처럼 사용
--		변수, 상수를 이용해서 조건문, 반복문을 사용할 수 있다.
--		PL/SQL은 선언부, 실행부, 예외처리부로 구성
--		각각은 하나의 블록으로 이루어진다.

--	PL/SQL의 구성
--		DECLARE		선언부 : 변수나 상수를 선언 및 초기화
--		BEGIN		실행부 : 변수나 상수에 값을 할당, 조건문 및 반복문을 사용
--		EXCEPTION	예외처리부 : 예상할 수 있는 예외를 코드로 처리
--		END;		PL/SQL 구문의 끝을 알린다.
--		선언부나 예외처리부는 생략이 가능, 실행부는 반드시 작성해야한다.

--	서버에 문자열 출력하기
SET SERVEROUTPUT ON;
--		서버에 문자열을 출력하기 위해 환경변수를 변경하는 명령어
--		계정 로그인할 때마다 작성을 해줘야한다.
--		위 명령어를 실행할 때, 옆에 주석을 작성하면 안된다.
--		DBEAVER 에서는 의미없지만, SQLPLUS(CMD창) 또는 SQL DEVELOPER 에서는 가능.
--		예제 ) HELLO, PL/SQL! 을 출력해보기
BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO, PL/SQL!');
END;
--	서버에 데이터 입력받기
--	1. SQL DEVELOPER / SQLPLUS(CMD창)
--		ACCEPT 변수명 PROMPT '프롬프트내용' --> 미리 값을 입력 받아서 변수에 저장
--		DECLARE
--			V_SCORE NUMBER(4) := &변수명; --> 저장된 변수 값을 사용하거나, 값을 입력받는 부분
--	2. DBEAVER
--		DECLARE
--			V_SCORE NUMBER(4) := ${내용}; --> DBEAVER에서 팝업창을 띄워 값을 입력받게됨.
DECLARE
	V_SCORE NUMBER(4) := ${점수};
BEGIN
	DBMS_OUTPUT.PUT_LINE(V_SCORE);
END;

--	선언부 ( DECLARE )
--		변수 및 상수를 선언, 값을 초기화하는 부분
--		변수 : 설정한 값을 계속 변경이 가능
--		변수 선언 > 변수명 자료형(크기) := 값(DATA);
--		예제 ) 변수에 값을 넣고 그 변수를 출력
DECLARE
	V_EMPNO NUMBER(4) := 7788;
	V_ENAME VARCHAR2(10);
BEGIN
	V_ENAME := 'SCOTT';
	DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
	DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
--		상수 : 한 번 설정한 값을 변경할 수 없음
--		상수 선언 > 변수명 CONSTANT 자료형(크기) := 값;
--		예제 ) 상수 값을 선언하고 초기화하여 출력
DECLARE
	V_TAX CONSTANT NUMBER(3) := 3;
BEGIN
	DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
--		** 변수에 기본값 지정 > 변수명 자료형(크기) DEFAULT 값
DECLARE
	V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
	DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
--		** 변수에 NOT NULL 지정 > 변수명 자료형(크기) NOT NULL := 값
--			> NOT NULL을 지정해준다면, 값이 무조건 있어야하기 때문에
--			> := 또는 DEFAULT를 사용해서 초기화를 해줘야한다.
DECLARE
	V_DEPTNO NUMBER(2) NOT NULL := 15;
BEGIN
	DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

--	변수명명법 ( 테이블 명명법과 동일 )
--	1. 같은 블록 안에서 고유한 변수명을 가져야하며, 중복될 수 없다.
--	2. 변수명으로 대소문자는 구분하지 않는다.
--	3. 테이블 명명법과 동일한 규칙을 따른다.
--		문자로 시작 / 30BYTE 이하 / 영문자,숫자,특수문자($,#,_) 사용
--		키워드(SELECT, FROM, WHERE 등)는 사용불가

--	변수의 자료형
--	1. 스칼라형 > NUMBER, VARCHAR2, DATE, BOOLEAN -> 기본적인 자료형
--	2. 참조형 > 테이블의 열 또는 행의 자료형을 참조
--			> 테이블의 열 참조 : 테이블.컬럼%TYPE
--			> 테이블의 행 참조 : 테이블%ROWTYPE
--		예제 ) 테이블의 열을 참조할 때 PLSQL 코드
DECLARE
	V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
	DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
--		예제 ) 테이블의 행을 참조할 때 PLSQL 코드
DECLARE
	V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
	SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
	-- INTO 구문을 이용해서 결과값 ROW를 변수에 저장
	FROM DEPT
	WHERE DEPTNO = 40;
	DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
	DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
	DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
--	3. 복합형
--		> 컬렉션(TABLE) : 한 가지 자료형의 데이터를 여러 개 저장( 테이블의 열, 배열과 유사 )
--		> 레코드(RECORD): 여러 종류 자료형의 데이터를 저장( 테이블의 행, 클래스와 유사 )
--	4. LOB > 대용량의 텍스트, 이미지, 동영상, 사운드 등을 저장하기 위한 자료형

--	실행부 ( BEGIN )
--		선언부에서 작성한 변수를 사용하거나, 조건제어문 또는 반복문을 사용
--		조건 제어문 ( IF / CASE )
--		1. IF-THEN-ELSIF-THEN-ELSE
--			IF 조건1 THEN 실행문1		1번 조건에 의한 실행 (필수)
--			ELSIF 조건2 THEN 실행문2	2번 조건에 의한 실행 (선택)
--			ELSIF 조건n THEN 실행문n	n번 조건에 의한 실행 (선택)
--			ELSE 실행문				위 조건이 아닐 때 실행(선택)
--			END IF;					IF문의 종료를 알림(필수)
--			예제 ) 학생 점수(V_SCORE)가 90 이상 A, 80 이상 B, 70 이상 C
--				  60 이상 D, 그 미만은 F를 출력하는 PLSQL 코드를 작성하시오.
DECLARE
--	V_SCORE NUMBER(3) := 87;
	V_SCORE NUMBER(3) := ${점수};
BEGIN
	IF V_SCORE >= 90 THEN DBMS_OUTPUT.PUT_LINE('A');
	ELSIF V_SCORE >= 80 THEN DBMS_OUTPUT.PUT_LINE('B');
	ELSIF V_SCORE >= 70 THEN DBMS_OUTPUT.PUT_LINE('C');
	ELSIF V_SCORE >= 60 THEN DBMS_OUTPUT.PUT_LINE('D');
	ELSE DBMS_OUTPUT.PUT_LINE('F');
	END IF;
END;
--		2. CASE-WHEN-THEN-ELSE
--			CASE문 같은 경우에는 두 가지 방법(단순,검색)으로 조건을 확인할 수 있다.
--			1. 단순 CASE : 기준 데이터를 두고 값으로 조건을 확인한다.
--			CASE 비교기준변수
--				WHEN 값1 THEN 실행문1
--				WHEN 값2 THEN 실행문2
--				WHEN 값n THEN 실행문n
--				ELSE 실행문
--			END CASE;
--			예제 ) 학생 점수를 입력받아 점수 / 10을 한 후 나온 점수가 10과 9면 A
--				  8이면 B, 7이면 C, 6이면 D, 그 외에는 F를 출력하라.
--				  단, 나눈 후의 소수점은 모두 삭제한다.
DECLARE
	V_SCORE NUMBER(3) := ${점수};
BEGIN
	DBMS_OUTPUT.PUT_LINE('단순 ) 점수 : ' || V_SCORE);
	CASE TRUNC(V_SCORE/10)
		WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A');
		WHEN 9  THEN DBMS_OUTPUT.PUT_LINE('A');
		WHEN 8  THEN DBMS_OUTPUT.PUT_LINE('B');
		WHEN 7  THEN DBMS_OUTPUT.PUT_LINE('C');
		WHEN 6  THEN DBMS_OUTPUT.PUT_LINE('D');
		ELSE DBMS_OUTPUT.PUT_LINE('F');
	END CASE;
END;

--			2. 검색 CASE : IF문처럼 조건식을 이용해 조건을 확인
--			CASE
--				WHEN 조건1 THEN 실행문1
--				WHEN 조건2 THEN 실행문2
--				WHEN 조건n THEN 실행문n
--				ELSE 실행문
--			END CASE;
--			예제 ) IF문의 예제를 똑같이 CASE문으로 작성
DECLARE
	V_SCORE NUMBER(3) := ${점수};
BEGIN
	DBMS_OUTPUT.PUT_LINE('검색 ) 점수 : ' || V_SCORE);
	CASE
		WHEN V_SCORE >= 90 THEN DBMS_OUTPUT.PUT_LINE('A');
		WHEN V_SCORE >= 80 THEN DBMS_OUTPUT.PUT_LINE('B');
		WHEN V_SCORE >= 70 THEN DBMS_OUTPUT.PUT_LINE('C');
		WHEN V_SCORE >= 60 THEN DBMS_OUTPUT.PUT_LINE('D');
		ELSE DBMS_OUTPUT.PUT_LINE('F');
	END CASE;
END;

--		반복문 ( 기본 LOOP , WHILE LOOP , FOR LOOP )
--		1. 기본 LOOP
--			LOOP
--				반복 수행 작업;
--			END LOOP;
--			예제 ) V_NUM 을 선언하고 0 부터 4 까지 출력하여라.
DECLARE
	V_NUM NUMBER := 0;
BEGIN
	DBMS_OUTPUT.PUT_LINE('기본 LOOP');
	LOOP
		DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
		V_NUM := V_NUM + 1;
--		EXIT WHEN V_NUM > 4;
		IF V_NUM > 4 THEN EXIT;
		END IF;
	END LOOP;
END;
--			** 반복문을 빠져나가는 방법
--			1. EXIT WHEN [조건식] 을 통해서 조건이 맞으면 EXIT 명령 실행
--			2. IF 문을 사용해서 EXIT 명령 실행
--			위 방식처럼 EXIT을 사용하여 종료하지 않으면 시작과 끝을 지정하지 않기 때문에
--			무한루프로 빠질 수 있다.

--		2. WHILE LOOP
--			> 조건을 확인하고 TRUE 이면 반복 수행 작업을 실행
--			> 위 조건이 FALSE가 되면 반복 수행 작업이 종료된다.
--			WHILE 조건식 LOOP
--				반복 수행 작업;
--			END LOOP;
--			예제 ) WHILE LOOP을 사용해서 V_NUM을 0 부터 4 까지 출력하여라.
DECLARE
	V_NUM NUMBER := 0;
BEGIN
	DBMS_OUTPUT.PUT_LINE('WHILE LOOP');
	WHILE V_NUM <= 4 LOOP
		DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
		V_NUM := V_NUM + 1;
	END LOOP;
END;

--		3. FOR LOOP
--			> 조건이 아닌 시작과 끝이 명확할 때 사용.
--			> 시작 값부터 종료 값까지 1씩 증가한다.
--			FOR 카운터변수 IN 시작값 .. 종료값 LOOP
--				반복 수행 작업;
--			END LOOP;
--			예제 ) 0부터 4까지 출력하는 FOR LOOP를 작성
BEGIN
	DBMS_OUTPUT.PUT_LINE('FOR LOOP');
	FOR i IN 0..4 LOOP
		DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
	END LOOP;
END;
--			** FOR LOOP 에서 i 의 값을 1씩 감소시키려면?
--				IN 옆에다가 REVERSE 를 작성하면 종료값 -> 시작값으로 동작한다.
--			예제 ) 4 부터 0까지 출력하는 FOR LOOP를 작성
BEGIN
	DBMS_OUTPUT.PUT_LINE('FOR REVERSE LOOP');
	FOR i IN REVERSE 0..4 LOOP
		DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
	END LOOP;
END;
--			FOR LOOP 같은 경우에는 1씩 증감되기 때문에
--			레코드나 컬렉션 같이 여러 개의 데이터를 가지고 있는 자료형에서 
--			데이터 출력할 때 사용

--			** LOOP문을 건너뛸 때 사용하는 CONTINUE
--				1. IF문을 사용하여 CONTINUE 명령어를 실행시키기
--				2. CONTINUE WHEN [조건식] 을 이용하여 
--				   조건식이 맞으면 CONTINUE 명령어를 실행시키기
--			예제 ) FOR LOOP 를 사용해서 0부터 10까지 홀수만 출력하기
BEGIN
	DBMS_OUTPUT.PUT_LINE('CONTINUE WHEN');
	FOR i IN 0..10 LOOP
--		CONTINUE WHEN MOD(i, 2) = 0;
		IF MOD(i,2) = 0 THEN CONTINUE;
		END IF;
		DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
	END LOOP;
END;

--	문제 1 ) 숫자 1부터 30까지 숫자 중 5의 배수만 출력하는 PLSQL문을 작성하여라
--			단, 반복문은 기본 LOOP, WHILE LOOP, FOR LOOP 3가지 버전으로 작성하라
--		1. 기본 LOOP
DECLARE
	V_NUM NUMBER := 1;
BEGIN
	LOOP
	  IF MOD(V_NUM, 5) = 0 THEN DBMS_OUTPUT.PUT_LINE('5의배수 : ' || V_NUM);
	  END IF;
	  V_NUM := V_NUM + 1;
	  EXIT WHEN V_NUM > 30;
	END LOOP;
END;
--		2. WHILE LOOP
DECLARE
	V_NUM NUMBER := 1;
BEGIN
	WHILE V_NUM <= 30 LOOP
		IF MOD(V_NUM,5)=0 THEN DBMS_OUTPUT.PUT_LINE('5의 배수:' || V_NUM);	
		END IF;
		V_NUM := V_NUM + 1;
	END LOOP;
END;
--		3. FOR LOOP
BEGIN
	FOR i IN 1..30 LOOP
		IF MOD(i,5)=0 THEN DBMS_OUTPUT.PUT_LINE('5의배수 :' || i);
		END IF;
	END LOOP;
END;

--	문제 2 ) v_deptno 변수를 선언하고 자료형은 dept 테이블의 deptno 컬럼과 동일하게,
--			부서번호를 입력받게 한다. 입력받은 번호에 따라서 아래의 이름을 출력한다.
--			10-accounting / 20-research / 30-sales / 40-operations
--			10,20,30,40이 아니라면 n/a를 출력한다.
--			작성은 if 문과 case 문 2가지 버전으로 작성
--		1. if 문
DECLARE
	V_DEPTNO DEPT.DEPTNO%TYPE := ${부서번호};
BEGIN
	IF V_DEPTNO = 10 THEN DBMS_OUTPUT.PUT_LINE('ACCOUNTING');
	ELSIF V_DEPTNO = 20 THEN DBMS_OUTPUT.PUT_LINE('RESEARCH');
	ELSIF V_DEPTNO = 30 THEN DBMS_OUTPUT.PUT_LINE('SALES');
	ELSIF V_DEPTNO = 40 THEN DBMS_OUTPUT.PUT_LINE('OPERATIONS');
	ELSE DBMS_OUTPUT.PUT_LINE('N/A');
	END IF;
END;

--		2. case 문
DECLARE
	V_DEPTNO DEPT.DEPTNO%TYPE := ${부서번호};
BEGIN
	CASE V_DEPTNO
		WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('ACCOUNTING');
		WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('RESEARCH');
		WHEN 30 THEN DBMS_OUTPUT.PUT_LINE('SALES');
		WHEN 40 THEN DBMS_OUTPUT.PUT_LINE('OPERATIONS');
		ELSE		 DBMS_OUTPUT.PUT_LINE('N/A');
	END CASE;
END;

--	레코드와 컬렉션

--	레코드 ( RECORD )
--		각기 다른 자료형을 가진 데이터를 하나의 변수에 저장
--		TYPE 레코드이름 IS RECORD(
--			변수명 자료형(크기) [NOT NULL] [DEFAULT 또는 := 값];
--			변수명 자료형(크기) [NOT NULL] [DEFAULT 또는 := 값];
--			...
--		)

--		예제 ) 레코드를 이용해서 변수 값 할당하고 출력하기
DECLARE
	TYPE REC_DEPT IS RECORD(
		DEPTNO NUMBER(2) NOT NULL := 99,
		DNAME  DEPT.DNAME%TYPE,
		LOC	   DEPT.LOC%TYPE
	);
	V_DEPT_REC REC_DEPT;
BEGIN
	V_DEPT_REC.DEPTNO := 50;
	V_DEPT_REC.DNAME := 'DATABASE';
	V_DEPT_REC.LOC := 'BUSAN';
	DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_REC.DEPTNO);
	DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_REC.DNAME);
	DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_REC.LOC);
END;

--		예제 ) 레코드를 이용해서 테이블에 데이터 INSERT, UPDATE
--			1. 예제 테이블 생성
CREATE TABLE DEPT_RECORD AS SELECT * FROM DEPT;
SELECT * FROM DEPT_RECORD;
--			2. RECORD를 이용해서 INSERT 하기
DECLARE
	TYPE REC_DEPT IS RECORD(
		DEPTNO NUMBER(2) NOT NULL := 99,
		DNAME  DEPT.DNAME%TYPE,
		LOC	   DEPT.LOC%TYPE
	);
	V_DEPT REC_DEPT;
BEGIN
	V_DEPT.DEPTNO := 50;
	V_DEPT.DNAME := 'JAVA';
	V_DEPT.LOC := 'SEOUL';
	INSERT INTO DEPT_RECORD VALUES V_DEPT;
END;

SELECT * FROM DEPT_RECORD;

--			3. 레코드를 이용해서 UPDATE 하기
DECLARE
	TYPE REC_DEPT IS RECORD(
		DEPTNO NUMBER(2) NOT NULL := 99,
		DNAME  DEPT.DNAME%TYPE,
		LOC	   DEPT.LOC%TYPE
	);
	V_DEPT REC_DEPT;
BEGIN
	V_DEPT.DEPTNO := 60;
	V_DEPT.DNAME := 'DB';
	V_DEPT.LOC := 'BUSAN';
	UPDATE DEPT_RECORD
	SET ROW = V_DEPT
	WHERE DEPTNO = 50;
END;

SELECT * FROM DEPT_RECORD;

--		예제 ) 중첩 레코드를 작성해보기
DECLARE
	TYPE REC_DEPT IS RECORD(
		DEPTNO	DEPT.DEPTNO%TYPE,
		DNAME	DEPT.DNAME%TYPE,
		LOC		DEPT.LOC%TYPE
	);
	TYPE REC_EMP IS RECORD(
		EMPNO 		EMP.EMPNO%TYPE,
		ENAME 		EMP.ENAME%TYPE,
		DEPT_INFO 	REC_DEPT
	);
	V_EMP_DEPT REC_EMP;
BEGIN
	SELECT 	E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
		INTO V_EMP_DEPT.EMPNO, V_EMP_DEPT.ENAME,
			 V_EMP_DEPT.DEPT_INFO.DEPTNO, V_EMP_DEPT.DEPT_INFO.DNAME,
			 V_EMP_DEPT.DEPT_INFO.LOC
	FROM 	EMP E, DEPT D
	WHERE 	E.DEPTNO = D.DEPTNO
	AND		E.EMPNO = 7788;
	DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_EMP_DEPT.EMPNO);
	DBMS_OUTPUT.PUT_LINE('ENAME : ' || V_EMP_DEPT.ENAME);
	DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_EMP_DEPT.DEPT_INFO.DEPTNO);
	DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_EMP_DEPT.DEPT_INFO.DNAME);
	DBMS_OUTPUT.PUT_LINE('LOC : ' || V_EMP_DEPT.DEPT_INFO.LOC);
END;

--	컬렉션 ( COLLECTION, TABLE )
--		> 자료형이 같은 여러 개의 데이터를 저장 ( 배열 )
--		TYPE 컬렉션이름 IS TABLE OF 자료형(크기) [NOT NULL]
--		INDEX BY 인덱스형;
--			> 자료형에는 스칼라형, 참조형이 들어갈 수 있다.
--			> 인덱스형에는 BINARY_INTEGER(숫자), PLS_INTEGER(숫자)
--				VARCHAR2(문자)가 들어갈 수 있다.
--			> 위의 INDEX는 데이터베이스 객체 INDEX가 아니라 
--			  배열할 때 저장되는 숫자 INDEX를 말한다.
--				EX) 자바에서 배열의 ARR[1] 에서 [1] 을 말한다.  

--		예제 ) 인덱스형이 숫자인 경우 컬렉션 생성
DECLARE
	TYPE COL_EX IS TABLE OF VARCHAR2(20)
	INDEX BY PLS_INTEGER;
	TEXT_ARR COL_EX;
BEGIN
	TEXT_ARR(1) := '1ST';
	TEXT_ARR(2) := '2ND';
	DBMS_OUTPUT.PUT_LINE('TEXT_ARR(1) : ' || TEXT_ARR(1));
	DBMS_OUTPUT.PUT_LINE('TEXT_ARR(2) : ' || TEXT_ARR(2));
END;
--		예제 ) 인덱스형이 문자인 경우 컬렉션 생성
DECLARE
	TYPE COL_EX IS TABLE OF VARCHAR2(20)
	INDEX BY VARCHAR2(10); -- > 문자형 인덱스를 할 때는 크기를 작성해야한다.
	TEXT_ARR COL_EX;
BEGIN
	TEXT_ARR('A') := 'AAA';
	TEXT_ARR('B') := 'BBB';
	DBMS_OUTPUT.PUT_LINE('TEXT_ARR(''A'') : ' || TEXT_ARR('A'));
	DBMS_OUTPUT.PUT_LINE('TEXT_ARR(''B'') : ' || TEXT_ARR('B')); 
END;

--		레코드를 활용한 컬렉션
DECLARE
	TYPE REC_DEPT IS RECORD(
		DEPTNO DEPT.DEPTNO%TYPE,
		DNAME DEPT.DNAME%TYPE
	);
	TYPE COL_DEPT IS TABLE OF REC_DEPT
	INDEX BY PLS_INTEGER;
	DEPT_ARR COL_DEPT;
	IDX NUMBER := 0;
BEGIN
	FOR i IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP
	-- ()안의 쿼리문의 결과 ROW 가 하나씩 카운터변수 i 에 대입된다.
		idx := idx+1;
		DEPT_ARR(idx).DEPTNO := i.DEPTNO;
		DEPT_ARR(idx).DNAME := i.DNAME;
		DBMS_OUTPUT.PUT_LINE(
			DEPT_ARR(IDX).DEPTNO || ' : ' || DEPT_ARR(IDX).DNAME);
	END LOOP;
END;

--		%ROWTYPE으로 컬렉션 자료형 지정하기
DECLARE
	TYPE COL_DEPT IS TABLE OF DEPT%ROWTYPE
	INDEX BY PLS_INTEGER;
	DEPT_ARR COL_DEPT;
	IDX NUMBER := 0;
BEGIN
	FOR I IN (SELECT * FROM DEPT) LOOP
		IDX := IDX+1;
		DEPT_ARR(IDX).DEPTNO := I.DEPTNO;
		DEPT_ARR(IDX).DNAME := I.DNAME;
		DEPT_ARR(IDX).LOC := I.LOC;
		DBMS_OUTPUT.PUT_LINE(
			DEPT_ARR(IDX).DEPTNO || ' : ' ||
			DEPT_ARR(IDX).DNAME || ' : ' ||
			DEPT_ARR(IDX).LOC
		);
	END LOOP;
END;

--		컬렉션 내부에 있는 메소드
--			EXISTS	> 지정한 INDEX가 존재하는지 TRUE / FALSE
--			COUNT	> 컬렉션에 몇 개의 INDEX가 저장되어있는지
--			FIRST	> 첫번째 INDEX가 무엇인지
--			LAST	> 마지막 INDEX가 무엇인지
--			PRIOR	> 지정한 INDEX 직전의 INDEX가 무엇인지
--			NEXT	> 지정한 INDEX 다음의 INDEX가 무엇인지
--			LIMIT	> 현재 컬렉션의 최대 크기를 반환, 크기가 없다면 NULL 반환
--			DELETE	> 컬렉션에 저장된 요소를 지운다
--				DELETE		> 컬렉션에 저장된 데이터 모두 삭제
--				DELETE(n)	> n인덱스의 컬렉션 데이터를 삭제
--				DELETE(n,m)	> n인덱스부터 m인덱스까지 데이터를 삭제
--			EXTEND	> 컬렉션의 크기를 증가 시킴
--			TRIM	> 컬렉션의 크기를 감소 시킴
DECLARE
	TYPE COL_EX IS TABLE OF VARCHAR2(20)
		INDEX BY PLS_INTEGER;
	TEXT_ARR COL_EX;
BEGIN
	TEXT_ARR(1) := '1ST DATA';
	TEXT_ARR(2) := '2ND DATA';
	TEXT_ARR(3) := '3RD DATA';
	TEXT_ARR(50) := '50TH DATA';
	TEXT_ARR(7) := '7TH DATA';
	IF TEXT_ARR.EXISTS(4) THEN DBMS_OUTPUT.PUT_LINE('있다!!');
	ELSE DBMS_OUTPUT.PUT_LINE('없다ㅜㅜ');
	END IF;
	DBMS_OUTPUT.PUT_LINE('TEXT_ARR.COUNT : ' || TEXT_ARR.COUNT);
	DBMS_OUTPUT.PUT_LINE('TEXT_ARR.FIRST : ' || TEXT_ARR.FIRST);
	DBMS_OUTPUT.PUT_LINE('TEXT_ARR.LAST : ' || TEXT_ARR.LAST);
	DBMS_OUTPUT.PUT_LINE('TEXT_ARR.PRIOR(50) : ' || TEXT_ARR.PRIOR(50));
	DBMS_OUTPUT.PUT_LINE('TEXT_ARR.NEXT(7) : ' || TEXT_ARR.NEXT(7));
END;

--	문제 1 ) EMP 테이블을 복사해서 연습용 테이블 EMP_RECORD 명으로 데이터 없이 구조만 생성
CREATE TABLE EMP_RECORD 
AS SELECT * FROM EMP WHERE 1 <> 1;

SELECT * FROM EMP_RECORD;
--	문제 2 ) 레코드를 사용해서 새로운 사원 정보를 삽입하는 PLSQL 코드를 작성
--			EMPNO : 1111 / ENAME : TEST_USER / JOB : TEST_JOB /
--			MGR : NULL / HIREDATE : 2018-03-01 / SAL : 3000 /
--			COMM : NULL / DEPTNO : 40
DECLARE
	TYPE REC_EMP IS RECORD(
		EMPNO		EMP.EMPNO%TYPE NOT NULL := 9999,
		ENAME		EMP.ENAME%TYPE,
		JOB			EMP.JOB%TYPE,
		MGR			EMP.MGR%TYPE,
		HIREDATE	EMP.HIREDATE%TYPE,
		SAL			EMP.SAL%TYPE,
		COMM		EMP.COMM%TYPE,
		DEPTNO		EMP.DEPTNO%TYPE
	);
	EMP_REC REC_EMP;
BEGIN
	EMP_REC.EMPNO := 1111;
	EMP_REC.ENAME := 'TEST_USER';
	EMP_REC.JOB := 'TEST_JOB';
	EMP_REC.HIREDATE := TO_DATE('20180301', 'YYYYMMDD');
	EMP_REC.SAL := 3000;
	EMP_REC.DEPTNO := 40;
	INSERT INTO EMP_RECORD VALUES EMP_REC;
END;

SELECT * FROM EMP_RECORD;

--	문제 3 ) EMP 테이블을 구성하는 모든 컬럼을 저장할 수 있는 컬렉션을 만들어서 저장하고
--			모든 컬렉션의 데이터를 출력하세요.
DECLARE
	TYPE COL_EMP IS TABLE OF EMP%ROWTYPE
	INDEX BY PLS_INTEGER;
	EMP_ARR COL_EMP;
	IDX NUMBER := 0;
BEGIN
	FOR I IN (SELECT * FROM EMP) LOOP
		IDX := IDX+1;
		EMP_ARR(IDX).EMPNO := I.EMPNO;
		EMP_ARR(IDX).ENAME := I.ENAME;
		EMP_ARR(IDX).JOB := I.JOB;
		EMP_ARR(IDX).MGR := I.MGR;
		EMP_ARR(IDX).HIREDATE := I.HIREDATE;
		EMP_ARR(IDX).SAL := I.SAL;
		EMP_ARR(IDX).COMM := I.COMM;
		EMP_ARR(IDX).DEPTNO := I.DEPTNO;
		DBMS_OUTPUT.PUT_LINE(
			EMP_ARR(IDX).EMPNO || ' : ' || EMP_ARR(IDX).ENAME || ' : ' ||
			EMP_ARR(IDX).JOB || ' : ' || EMP_ARR(IDX).MGR || ' : ' ||
			EMP_ARR(IDX).HIREDATE || ' : ' || EMP_ARR(IDX).SAL || ' : ' ||
			EMP_ARR(IDX).COMM || ' : ' || EMP_ARR(IDX).DEPTNO
		);
	END LOOP;
END;

--	예외처리부
--		> 여러가지의 예상가능한 예외를 미리 지정해서 에러가 안나게끔 만들어주는 블록
--		EXCEPTION
--			WHEN 예외이름1 [OR 예외이름2 ...] THEN 실행문1
--			WHEN 예외이름3 [OR 예외이름4 ...] THEN 실행문2
--			WHEN OTHERS THEN 실행문
--		1번예외 [또는 2번예외]가 발생하면 실행문1을 실행한다.
--		3번예외 [또는 4번예외]가 발생하면 실행문2를 실행한다.
--		위에 적힌 에러말고 다른 에러가 발생하면 실행문을 실행한다.

--		예제 ) NUMBER 타입에 VARCHAR2 타입 데이터를 넣어서 예외를 일으키기.
DECLARE
	V_WRONG NUMBER;
BEGIN
	SELECT DNAME INTO V_WRONG
	FROM DEPT
	WHERE DEPTNO = 10;
	DBMS_OUTPUT.PUT_LINE('예외가 발생하면 이 문장은 실행 X');
EXCEPTION
	WHEN VALUE_ERROR THEN 
		DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;

--	에러 코드와 에러 메세지를 확인하는 방법
--		SQLCODE - 에러 번호를 반환하는 함수
--		SQLERRM - 에러 메세지를 반환하는 함수
--		** 위 두가지 함수는 PLSQL 에서만 사용가능하다
--		** 기본적인 쿼리문, DDL, DML 등등에서는 사용 불가능하다.
DECLARE
	V_WRONG NUMBER;
BEGIN
	SELECT DNAME INTO V_WRONG
	FROM DEPT
	WHERE DEPTNO = 10;
	DBMS_OUTPUT.PUT_LINE('예외가 발생하면 이 문장은 실행 X');
EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;

--	문제 1 ) v_deptno 변수를 선언하고 자료형은 dept 테이블의 deptno 컬럼과 동일하게,
--			부서번호를 입력받게 한다. 입력받은 번호에 따라서 쿼리문을 실행하고
--			쿼리문을 실행한 값 중 DNAME을 출력하라.
--			10을 입력하면 -> ACCOUNTING
--			DEPTNO가 없는 값을 입력하면 에러가 출력된다. -> NO_DATA_FOUND로 예외처리
--			예외처리해주면서 N/A 를 출력 

--			변수 2개 필요 -> 부서번호 입력받는 변수와 쿼리문 실행하고 받을 행 타입 변수
DECLARE
	V_DEPTNO DEPT.DEPTNO%TYPE := ${부서번호};
	V_DEPT	DEPT%ROWTYPE;
BEGIN
	SELECT * INTO V_DEPT
	FROM DEPT WHERE DEPTNO = V_DEPTNO;
	DBMS_OUTPUT.PUT_LINE('부서이름 : ' || V_DEPT.DNAME);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('부서이름 : N/A');
	WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;












