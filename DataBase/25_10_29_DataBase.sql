--	커서( CURSOR )
--		SELECT문 또는 데이터 조작어 같은 SQL문을 실행했을 때
--		해당 SQL문을 처리하는 정보를 저장한 메모리 공간
--		SELECT문의 결과로 여러행이 나왔을 때,
--		각 행별로 특정 작업을 수행하도록 기능을 구현할 수 있다.
--		사용방법에 따라서 명시적 커서와 묵시적 커서가 있다.

--	SELECT .. INTO .. 구문과 비교
--		커서와 비슷하게 SELECT문의 결과를 변수에 넣는 구문
--		단일행만 출력해야하는 단점이 있다.

--	명시적 커서
--		사용자가 직접 커서를 선언하고 사용
--		4단계에 걸쳐서 사용
--			1. 커서 선언 : 커서명을 지정하여 SQL문과 함께 선언한다
--			2. 커서 열기 : 커서를 선언할 때 작성한 SQL문을 실행
--				이 때, 실행한 SQL문에 영향을 받는 행을 ACTIVE SET 이라고 한다.
--			3. 커서에서 읽어온 데이터를 사용
--				SQL문의 결과 행 정보를 하나씩 읽어와서 변수에 저장한 후 작업을 수행
--				각 행별로 공통 작업을 수행할 때는 반복문과 함께 사용할 수 있다.
--			4. 커서 닫기 : 모든 행의 사용이 끝나고 커서를 종료

--		코드로 보는 명시적 커서 단계
--		DECLARE
--			CURSOR 커서이름 IS SQL문; -- 커서 선언
--		BEGIN
--			OPEN 커서이름 ; -- 커서 열기
--			FETCH 커서이름 INTO 변수; -- 커서에서 읽어온 데이터를 사용
--			CLOSE 커서이름; -- 커서 닫기
--		END;

--		예제 ) 단일행 데이터를 조회하는 커서 사용
DECLARE
	V_DEPT_ROW DEPT%ROWTYPE;
	CURSOR C1 IS
		SELECT DEPTNO, DNAME, LOC
		FROM DEPT
		WHERE DEPTNO = 40;
BEGIN
	OPEN C1;
	FETCH C1 INTO V_DEPT_ROW;
	DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
	DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
	CLOSE C1;
END;
--		예제 ) 복수행 데이터를 조회하는 커서
DECLARE
	V_DEPT_ROW DEPT%ROWTYPE;
	CURSOR C1 IS
		SELECT DEPTNO, DNAME, LOC
		FROM DEPT;
BEGIN
	OPEN C1;
	LOOP
		FETCH C1 INTO V_DEPT_ROW; --> 반복이 진행될 때마다 하나의 ROW가 변수에 대입
		EXIT WHEN C1%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO ||
							 'DNAME : ' || V_DEPT_ROW.DNAME);
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('C1%ROWCOUNT : ' || C1%ROWCOUNT);
	IF C1%ISOPEN THEN
		DBMS_OUTPUT.PUT_LINE('C1%ISOPEN : TRUE');
	ELSE
		DBMS_OUTPUT.PUT_LINE('C1%ISOPEN : FALSE');
	END IF;
	CLOSE C1;
	IF C1%ISOPEN THEN
		DBMS_OUTPUT.PUT_LINE('C1%ISOPEN : TRUE');
	ELSE
		DBMS_OUTPUT.PUT_LINE('C1%ISOPEN : FALSE');
	END IF;
END;

--		위 예제에 적힌 %NOTFOUND 처럼 또 다른 속성
--		커서이름%NOTFOUND
--			> 수행된 FETCH문을 통해 추출된 행이 있으면 FALSE 없으면 TRUE 반환
--		커서이름%FOUND
--			> 수행된 FETCH문을 통해 추출된 행이 없으면 FALSE 있으면 TRUE 반환
--		커서이름%ROWCOUNT
--			> 현재까지 FETCH문을 통해 추출된 행의 수를 반환
--		커서이름%ISOPEN
--			> 커서가 열려있으면 TRUE, 닫혀있으면 FALSE

--		예제 ) 복수행 데이터를 조회하는 커서 ( FOR LOOP )
--			FOR 카운터변수 IN 커서이름 LOOP
--			> 커서에 저장된 여러개의 ROW가 카운터변수에 한 개씩 대입된다.
--			> 따로 OPEN / FETCH / CLOSE를 안해줘도 된다.
DECLARE
	CURSOR C1 IS
		SELECT DEPTNO, DNAME, LOC
		FROM DEPT;
BEGIN
	FOR C1_REC IN C1 LOOP
		DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO);
	END LOOP;
END;

--		예제 ) 커서에 파라미터 사용하기
DECLARE
	V_DEPT_ROW DEPT%ROWTYPE;
	CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
		SELECT DEPTNO, DNAME, LOC
		FROM DEPT
		WHERE DEPTNO = P_DEPTNO;
BEGIN
	OPEN C1(10);
		LOOP	
			FETCH C1 INTO V_DEPT_ROW;
			EXIT WHEN C1%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE('10번 부서 : ' || V_DEPT_ROW.DNAME);
		END LOOP;
	CLOSE C1;
	OPEN C1(20);
		LOOP	
			FETCH C1 INTO V_DEPT_ROW;
			EXIT WHEN C1%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE('20번 부서 : ' || V_DEPT_ROW.DNAME);
		END LOOP;
	CLOSE C1;
END;
--		예제 ) 커서에 사용할 파라미터를 직접 입력받기
DECLARE
	V_DEPTNO DEPT.DEPTNO%TYPE;
	CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
		SELECT DEPTNO, DNAME, LOC
		FROM DEPT
		WHERE DEPTNO = P_DEPTNO;
BEGIN
	V_DEPTNO := ${부서번호};
	FOR DEPT_ROW IN C1(V_DEPTNO) LOOP
		DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO ||
							 'DNAME : ' || DEPT_ROW.DNAME);
	END LOOP;
END;

--	묵시적 커서
--		별다른 선언 없이 SQL문을 실행했을 때 오라클에서 자동으로 선언되는 커서
--		OPEN, FETCH, CLOSE를 따로 지정 X
--		PLSQL문 내부에서 DML 명령이나 SELECT INTO 문 등이 실행될 때 자동으로 생성 및 처리

--		묵시적 커서의 속성을 사용하여 커서의 정보를 알 수 있다.
--		SQL%NOTFOUND
--			> 묵시적 커서 안에 추출한 행이 있으면 FALSE 없으면 TRUE
--			> DML 명령어로 영향을 받은 행이 없을 경우에도 TRUE
--		SQL%FOUND
--			> 묵시적 커서 안에 추출한 행이 없으면 FALSE 있으면 TRUE
--			> DML 명령어로 영향을 받은 행이 있을 경우에 TRUE
--		SQL%ROWCOUNT
--			> 묵시적 커서에 현재까지 추출한 행 수 또는 DML 명령어로 영향받은 행 수
--		SQL%ISOPEN
--			> 묵시적 커서는 SQL 실행 후 자동으로 CLOSE 되기 때문에 항상 FALSE

--		예제 ) 묵시적 커서의 속성 사용하기
BEGIN
	UPDATE DEPT_RECORD SET DNAME = 'DATABASE'
	WHERE DEPTNO = 60;
	DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : ' || SQL%ROWCOUNT);
	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : TRUE');
	ELSE
		DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : FALSE');
	END IF;
	IF SQL%ISOPEN THEN
		DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : TRUE');
	ELSE
		DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : FALSE');
	END IF;
END;









