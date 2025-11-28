--	서브쿼리
--		: 하나의 쿼리 안에 또 다른 하나의 쿼리가 담겨있는 것.
--		SELECT 절에 들어가는 sub query	: 스칼라(scalar) 서브쿼리
--		FROM 절에 들어가는 sub query	: 인라인 뷰(inline view)
--		WHERE 절에 들어가는 sub query	: 서브 쿼리

--		예제 ) EMP 테이블에서 'FORD' 보다 급여를 많이 받는 사람을 조회하세요.
--		1. 서브쿼리를 사용하지 않을 경우
--			FORD의 급여를 한 번 찾고, 그 급여를 가지고 더 많이 받는 사람을 찾는다.
SELECT SAL
FROM   EMP
WHERE  ENAME = 'FORD';

SELECT EMPNO, ENAME, SAL
FROM   EMP
WHERE  SAL > 3000;
--		2. 서브쿼리를 사용할 경우
SELECT EMPNO, ENAME, SAL
FROM   EMP
WHERE  SAL > ( SELECT SAL 
			   FROM EMP
			   WHERE ENAME = 'FORD' );
--		전체 쿼리문 > 본 쿼리문 / 삽입된 쿼리문
--			본 쿼리문 - MAIN QUERY / OUTER QUERY
--			삽입된 쿼리문 - SUB QUERY / INNER QUERY

--		SUB QUERY 작성 시 주의 사항
--			1. WHERE절에 연산자 오른쪽에 위치해야하며, 반드시 소괄호로 묶어야한다.
--			2. WHERE절에 쓰이는 SUB QUERY절에는 ORDER BY를 사용할 수 없다.
--			  > 순서가 아닌 데이터가 중요하기 때문에
--			  > ORDER BY는 출력 순서를 지정하는 구문인데, 출력을 하지 않기 때문에
--			  > 특정한 상황에서는 사용이 가능하다.
--			3. 단일행 서브쿼리와 다중행 서브쿼리에 따라서 연산자를 잘 선택해야한다.

--	서브쿼리의 종류 ( 단일행, 다중행, 다중컬럼, 상호 연관 )
--		1. 단일행 SUB QUERY : SUB QUERY 의 수행 결과 값이 1개의 행만 출력되는 것
--			서브 쿼리의 수행 결과 값 1개를 메인 쿼리로 전달해서 메인 쿼리를 수행하게 된다.
--			단일행 SUB QUERY 경우, WHERE 절에서 사용되는 연산자
--				=	: 같다
--				<>	: 다르다
--				>	: 크다
--				>=	: 크거나 같다
--				<	: 작다
--				<=	: 작거나 같다

--		예제 1 ) STUDENT 테이블과 DEPARTMENT 테이블을 사용하여 'Anthony Hopkins' 학생과
--				1전공(deptno1)이 동일한 학생들의 이름과 1전공 이름을 출력하시오.
--				HINT ) 'Anthony Hopkins'학생의 1전공번호를 먼저 구한 후
--						그 전공번호와 같은 학생들의 이름을 찾고, 어떤 학과인지
--						department 테이블과 join하여 답을 찾으면 된다.
--			1. 'Anthony Hopkins' 학생의 1전공 번호를 구하기
SELECT deptno1
FROM student
WHERE name = 'Anthony Hopkins';
--			2. 얻은 1전공 번호를 이용해서 main query를 작성
SELECT 	s.name AS STUD_NAME, d.dname AS DEPT_NAME
FROM	student s, department d
WHERE	s.deptno1 = d.deptno
AND		s.deptno1 = ( SELECT deptno1 
					  FROM student
					  WHERE name = 'Anthony Hopkins' );

--		문제 1 ) Professor 테이블과 Department 테이블을 조회하여 'Meg Ryan'교수보다
--			    나중에 입사한 사람의 이름과 입사일, 학과명을 출력하세요
--				HINT ) 'Meg Ryan'교수의 입사일을 먼저 구한 후 그 날짜보다 큰 입사일을
--						가진 교수들을 찾고, 그 교수들의 학과번호를 Department테이블과
--						join하여 학과명을 구하면 됩니다.
--			1. 'Meg Ryan' 교수의 입사일을 구하기
SELECT	hiredate
FROM	professor
WHERE	name = 'Meg Ryan';
--			2. 구한 입사일을 가지고 Main Query 작성
SELECT	p.name AS PROF_NAME, p.hiredate AS HIREDATE, 
		d.dname AS DEPT_NAME
FROM	professor p, department d
WHERE	p.deptno = d.deptno
AND		p.hiredate > ( SELECT hiredate 
					   FROM PROFESSOR
					   WHERE name = 'Meg Ryan');	

--		문제 2 ) Student 테이블에서 1전공(deptno1)이 201번인 학과의 평균 몸무게보다
--				몸무게가 많은 학생들의 이름과 몸무게를 출력하세요.
--				1. 1전공이 201번인 학생들의 평균 몸무게를 구하기
SELECT avg(weight)
FROM student
WHERE deptno1 = 201;
--				2. 구한 평균 몸무게를 이용하여 Main query를 작성하기
SELECT	name, weight
FROM	student
WHERE	weight > ( SELECT avg(weight)
				   FROM student
				   WHERE deptno1 = 201 );

--		2. 다중행 sub query : sub query 의 수행 결과 값이 2개의 행 이상 출력되는 것
--			결과가 2개 행 이상이기 때문에 단일행 연산자를 사용할 수 없다.
--			다중행 sub query 경우, where절에서 사용되는 연산자
--				IN		: 서브쿼리의 결과와 같은 값을 찾는다.
--				EXISTS	: 서브쿼리의 결과 값이 있을 경우에 메인 쿼리를 수행
--				< ANY	: 서브 쿼리 결과 중 최대값을 반환하며 그보다 작은	(OR)
--				> ANY	: 서브 쿼리 결과 중 최소값을 반환하며 그보다 큰		(OR)
--				< ALL	: 서브 쿼리 결과 중 최소값을 반환하며 그보다 작은	(AND)
--				> ALL	: 서브 쿼리 결과 중 최대값을 반환하며 그보다 큰		(AND)
--				ANY 와 ALL 의 예시. ( 서브쿼리의 결과 값이 100, 200, 300 이라고 가정 )
--					SAL > ANY(100,200,300) ---> SAL > 100
--					SAL > ALL(100,200,300) ---> SAL > 300

--		예제 1 ) EMP2 테이블과 DEPT2 테이블을 참조하여 근무지역(DEPT2.AREA)이
--				'Pohang Main Office'인 모든 사원들의 사번과 이름, 부서번호를 출력
--			1. 근무지역이 'Pohang Main Office'인 부서 번호를 조회하기
SELECT dcode
FROM dept2
WHERE area = 'Pohang Main Office';
--			2. 얻은 부서 번호를 이용해서 사원정보를 출력하기(Main query 작성)
SELECT empno, name, deptno
FROM EMP2
WHERE deptno IN ( SELECT dcode
				  FROM DEPT2
				  WHERE area = 'Pohang Main Office' );
--		예제 2 )IN 연산자와 EXISTS 연산자의 차이 보기
--			1. IN 연산자 사용
SELECT * FROM dept
WHERE deptno IN (SELECT deptno FROM dept WHERE deptno = 20);
--			2. EXISTS 연산자 사용
SELECT * FROM DEPT
WHERE EXISTS (SELECT deptno FROM dept WHERE deptno = 20);
--			EXISTS는 결과 값이 1건이라도 있으면 메인쿼리를 실행, 없으면 실행하지 않는다.
--			IN은 결과 값을 메인쿼리의 조건으로 사용하게 된다.

--		문제 1 ) EMP2 테이블을 사용하여 전체 직원 중 'Section head' 직급의
--				최소 연봉자보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하세요.
--				단, 연봉 출력 형식은 천 단위 구분 기호와 $ 표시를 하세요.
--					to_char 사용
--			1. 직급이 Section head 인 사람들의 연봉을 구하기
SELECT pay
FROM emp2
WHERE POSITION LIKE 'Section head';
--			2. 다중행 연산자를 이용하여 메인쿼리 작성하기
SELECT name, POSITION, to_char(pay, '$999,999,999')
FROM EMP2
WHERE pay > ANY(SELECT pay
			    FROM emp2
			    WHERE POSITION LIKE 'Section head');
--			3. 단일행 서브쿼리로 변경해서 단일행 연산자를 이용하여 메인쿼리를 작성해보기
SELECT name, POSITION, to_char(pay, '$999,999,999')
FROM emp2
WHERE pay > ( SELECT min(pay)
			  FROM emp2
			  WHERE POSITION LIKE 'Section head');

--		문제 2 ) Student 테이블 조회하여 전체 학생 중에서 체중이 2학년 학생들의 체중에서
--				가장 적게 나가는 학생보다 몸무게가 적은 학생의 이름,학년,몸무게를 출력하세요.
--			1. 2학년 학생들의 체중을 조회하기
SELECT weight
FROM student
WHERE grade = 2;
--			2. 다중행 연산자를 이용하여 메인쿼리 작성하기
SELECT	name, grade, weight
FROM 	student
WHERE	weight < ALL( SELECT WEIGHT 
				   	  FROM student
				      WHERE grade = 2 );
--			3. 단일행 연산자를 이용하여 메인쿼리 작성하기
SELECT 	name, grade, weight
FROM 	student
WHERE	weight < ( SELECT min(weight)
				   FROM student
				   WHERE grade = 2 );

--		문제 3 ) EMP2 테이블과 DEPT2 테이블을 조회하여 각 부서별 평균 연봉을 구하고,
--				그 중에서 평균 연봉이 가장 적은 부서의 평균 연봉보다 적게 받는 직원들의
--				부서명, 직원명, 연봉을 출력하세요.
--			1. 각 부서별 평균 연봉을 구하기
SELECT avg(pay), deptno -- 서브쿼리 사용할 때는 확인용인 deptno를 빼고 작성한다.
FROM emp2
GROUP BY deptno;
--			2. 다중행 연산자를 이용해서 메인쿼리를 작성하기
SELECT	d.dname, e.name, e.pay
FROM	emp2 e, dept2 d
WHERE	e.deptno = d.dcode
AND		pay < ALL ( SELECT avg(pay)
					FROM emp2
					GROUP BY deptno );

--		3. 다중 컬럼 SUB QUERY ( MULTI COLUMN SUB QUERY )
--			SUB QUERY의 결과가 여러 컬럼일 경우

--		예제 1 ) Student 테이블을 조회하여 각 학년별로 최대 몸무게를 가진 학생들의
--				학년, 이름, 몸무게를 출력하세요.
SELECT	grade, name, weight
FROM	student
WHERE	(grade, weight) IN ( SELECT grade, max(weight)
							 FROM student
							 GROUP BY grade );

--		문제 1 ) Professor 테이블과 Department 테이블을 조회하여 각 학과별로
--				입사일이 가장 오래된 교수의 교수번호, 이름, 학과명을 출력하세요.
--				단, 입사일을 순으로 오름차순 정렬하세요.
--			1. 각 학과별로 입사일이 가장 오래된 교수의 학과번호와 입사일을 구하기
SELECT deptno, min(hiredate)
FROM professor
GROUP BY deptno;
--			2. 구한 학과번호와 입사일을 사용해서 메인쿼리를 작성하기
SELECT	p.profno, p.name AS PROF_NAME, d.dname AS DEPT_NAME
FROM	professor p , department d
WHERE 	p.deptno = d.deptno
AND		( p.deptno, p.hiredate) IN ( SELECT deptno, min(hiredate)
									 FROM professor
									 GROUP BY deptno )
ORDER BY p.hiredate;

--		문제 2 ) EMP2 테이블을 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의
--				이름, 직급, 연봉을 출력하세요. 단, 연봉 순으로 오름차순 정렬하세요.
--			1. 해당 직급별 최대 연봉을 구하기
SELECT POSITION, max(pay)
FROM EMP2 e 
GROUP BY POSITION;
--			2. 해당 직급에서 최대 연봉을 받는 직원의 이름,직급,연봉을 출력하기.
SELECT 	name, POSITION, pay
FROM	emp2
WHERE	( POSITION, pay ) IN ( SELECT POSITION, max(pay)
							   FROM emp2
							   GROUP BY POSITION )
ORDER BY pay;

--		4. 상호 연관 sub query
--			MAIN QUERY 값을 SUB QUERY에 주고 SUB QUERY를 수행한 후
--			그 결과를 다시 MAIN QUERY에 반환해서 수행하는 SUB QUERY
--			즉, MAIN 과 SUB 가 서로 데이터를 주고 받는 형태
--				> 성능이 매우 나쁘므로 주의해야함.

--		예제 1 ) EMP2 테이블을 조회해서 직원들 중에서 자신의 직급의 평균 연봉과 같거나
--				많이 받는 사람들의 이름, 직급, 현재 연봉을 출력하세요.
SELECT NAME, POSITION, PAY
FROM EMP2 A
WHERE PAY >= ( SELECT AVG(PAY)
			   FROM EMP2 B
			   WHERE A.POSITION = B.POSITION );

--	스칼라 서브쿼리 ( SCALAR SUB QUERY )
--		: SELECT 절에 오는 서브쿼리 -> 한 번에 결과를 1행씩 반환
--		예제 ) EMP 테이블의 사원 번호, 사원 이름, 사수 번호, 사수의 이름을 출력하세요.
SELECT 	EMPNO, ENAME, MGR,
	    ( SELECT ENAME FROM EMP E2
	   	  WHERE E1.MGR = E2.EMPNO ) AS MGR_NAME
FROM	EMP E1
ORDER BY MGR, ENAME;
--		데이터 중 KING 의 MGR 이 NULL 값을 나타내며, 서브쿼리에서도 값이 없으면 NULL을 출력
--			> OUTER JOIN 과 동일하다.
SELECT	E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS MGR_NAME
FROM 	EMP E1, EMP E2
WHERE 	E1.MGR = E2.EMPNO(+)
ORDER BY MGR, ENAME;

--		** JOIN 과 SCALAR 서브쿼리 사용 방법
--			데이터 양이 적을 경우 -> 스칼라 서브쿼리 ( 성능이 좋다 )
--			그렇지 않을 경우 -> JOIN ( 성능이 좋다 )

--		** 스칼라 서브쿼리의 작동 원리
--			1. MAIN 수행한 후 SCALAR 에 값을 제공
--			2. SCALAR를 수행하기 위해 필요한 데이터가 있는 블록을 메모리에 올린다.
--			3. MAIN에서 주어진 조건을 가지고 필요한 값을 찾음
--				-> 그 값을 입력(MAIN의 조건)과 출력(SCARLR의 결과)로 메모리에 저장
--			4. 다음 조건이 들어오면 메모리 확인 후 있으면 메모리에서 출력 없으면 위 과정을 반복

--		** 작동원리를 식당으로 예를 들어보면,
--			식당의 메뉴가 1개만 있다면 많은 손님이 와도 메뉴를 미리 만들어 놓을 수 있다.
--			식당의 메뉴가 100개가 있다면 많은 손님이 오면 메뉴를 만들어 내는 것이 느릴 거다.

--		스칼라 서브쿼리와 조인의 차이점
--		1. 연습용 테이블 T3 와 T4 생성
CREATE TABLE T3(
	NO		NUMBER,
	NAME	VARCHAR2(10),
	DEPTNO	NUMBER
);
CREATE TABLE T4(
	DEPTNO	NUMBER,
	DNAME	VARCHAR2(10)
);

INSERT INTO T3 VALUES(1, 'AAA', 100);
INSERT INTO T3 VALUES(2, 'BBB', 200);
INSERT INTO T3 VALUES(3, 'CCC', 300);

INSERT INTO T4 VALUES(100, 'DDD');
INSERT INTO T4 VALUES(100, 'EEE');
INSERT INTO T4 VALUES(200, 'FFF');
INSERT INTO T4 VALUES(300, 'GGG');

SELECT * FROM T3;
SELECT * FROM T4;

--		2. 중복된 데이터를 받아올 경우
--			2-1. JOIN 의 경우
SELECT T3.NO, T3.NAME, T4.DNAME
FROM T3, T4
WHERE T3.DEPTNO = T4.DEPTNO;
--			2-2. SCALAR 서브쿼리의 경우
--				> 단일 행이어야하는데 2개 이상의 행이 반환된다 -> 에러 발생
SELECT 	T3.NO, T3.NAME,
	    ( SELECT DNAME FROM T4 WHERE T3.DEPTNO = T4.DEPTNO )
FROM	T3;
--				문제가 되는 100, 'EEE' 데이터를 400, 'EEE' 데이터로 변경
UPDATE T4
SET DEPTNO = 400
WHERE DNAME = 'EEE';
--				변경 후에 2-2 쿼리문을 실행하면 정상적으로 수행한다.
--			따라서, 중복된 데이터가 있을 때는 스칼라 서브쿼리를 사용할 수 없다.

--		3. 2개 이상의 컬럼을 조회할 경우
--			3-1. JOIN 의 경우
SELECT T3.NO, T3.NAME, T4.DNAME, T4.DEPTNO
FROM T3, T4
WHERE T3.DEPTNO = T4.DEPTNO;
--			3-2. SCALAR 서브쿼리의 경우
SELECT T3.NO, T3.NAME,
	   ( SELECT DNAME, DEPTNO FROM T4 WHERE T3.DEPTNO = T4.DEPTNO )
FROM T3;
--				> 값의 수가 너무 많습니다. -> 에러 발생
--			따라서, SCALAR 서브쿼리의 결과 컬럼은 하나만 출력되어야 한다.

--	WITH 절 : 인라인뷰의 서브쿼리를 따로 먼저 지정한 후 별칭으로 사용.
--			  FROM절의 서브쿼리를 따로 먼저 지정한 후 별칭으로 사용.
WITH
E10 AS ( SELECT * FROM EMP WHERE DEPTNO = 10 ),
D	AS ( SELECT * FROM DEPT )
SELECT  E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM 	E10, D
WHERE	E10.DEPTNO = D.DEPTNO;

--	시퀀스 ( SEQUENCE )
--		: 연속적인 번호를 만들어주는 객체
--		생성법
--		CREATE SEQUENCE 시퀀스명
--		INCREMENT BY n			-증가분
--		START WITH n			-시작 번호
--		MAXVALUE n | NOMAXVALUE	-최대값
--		MINVALUE n | NOMINVALUE	-최소값
--		CYCLE | NOCYCLE			-최대값까지 갔으면 다시 돌아서 시작하는가?
--		CACHE n | NOCACHE		-생성 속도를 개선하기 위해 메모리에 얼마나 저장하는가?

--	예제 ) 시퀀스를 생성하고 각종 옵션을 테스트하기

--		1. 제품 주문번호를 생성하기 위해 사용할 시퀀스 만들기
--			시퀀스명 : JNO_SEQ
--			시작번호 : 100
--			끝 번호 : 110
--			증가 값 : 1
--			반복될 것이며 캐싱은 2개씩 ( 다시 시작할 땐 90부터 시작 )
CREATE SEQUENCE jno_seq
START WITH 100
MAXVALUE 110
INCREMENT BY 1
CYCLE
cache 2
MINVALUE 90;

--		2. 시퀀스를 사용할 테스트 테이블 만들기
CREATE TABLE s_order(
	ord_no		number(4),
	ord_name	varchar2(10),
	p_name		varchar2(20),
	p_qty		number
);

--		3. 시퀀스를 사용해서 테스트 테이블에 데이터 넣기
INSERT INTO s_order VALUES(jno_seq.nextval, 'JAMES', 'APPLE', 5);
INSERT INTO s_order values(jno_seq.nextval, 'FORD', 'BERRY', 3);

SELECT * FROM s_order;
--			시퀀스.nextval : 자동으로 다음 번호를 넣어주는 역할.
--				>> 주의 : 어디든 작성하기만하면 시퀀스 값이 증가 또는 감소한다.
--			시퀀스.currval : nextval 출력한 마지막 번호를 알려준다.
SELECT jno_seq.currval FROM dual;

--		4. 시퀀스를 이용해서 maxvalue / minvalue / cycle 확인하기
BEGIN 
	FOR i IN 1..9 LOOP
		INSERT INTO s_order VALUES(jno_seq.nextval, 'Allen', 'Banana', 5);
	END LOOP;
	COMMIT;
END;

SELECT * FROM s_order;

INSERT INTO s_order values(jno_seq.nextval, 'SMITH', 'Grape', 3);

SELECT * FROM s_order;

--		5. 값이 감소하는 시퀀스 생성 및 사용
CREATE SEQUENCE jno_seq_rev
INCREMENT BY -2
MINVALUE 0
MAXVALUE 20
START WITH 10;
--	 	cycle과 cache를 지정하지 않았다.
--			-> cycle은 nocycle이 기본값, cache는 cache 20 이 기본값(오라클 기준)

CREATE TABLE s_rev1(NO number);

INSERT INTO s_rev1 VALUES (jno_seq_rev.nextval);
--	6번까지는 수행하며, 7번째에는 에러를 출력한다.
--		> 10 에서 -2 씩 10,8,6,4,2,0 까지 뽑고 cycle이 아니기 때문에 
--		  minvalue 이하로 갈 수 없다 라는 에러.

--		시퀀스 조회, 수정, 삭제하기
--			조회 : user_sequences 데이터 사전을 이용해서 조회
SELECT sequence_name, min_value, max_value, increment_by, cycle_flag,
	   order_flag, cache_size, last_number
FROM 	user_sequences
WHERE sequence_name = 'JNO_SEQ'; --> 시퀀스 이름은 대문자로 작성해야한다.

--			수정 : ALTER SEQUENCE 시퀀스명 아래에 수정할 조건을 작성하면 된다.
--			예제 ) 기존의 jno_seq 의 최대값을 120으로 변경하고, cache를 10으로 수정
ALTER SEQUENCE jno_seq
MAXVALUE 120
cache 10;
--			수정되었는지 확인
SELECT sequence_name, min_value, max_value, increment_by, cycle_flag,
	   order_flag, cache_size, last_number
FROM 	user_sequences
WHERE sequence_name = 'JNO_SEQ';

--			삭제 : DROP SEQUENCE 시퀀스명
--			예제 ) jno_seq_rev 시퀀스를 삭제
DROP SEQUENCE jno_seq_rev;

--		시퀀스를 초기화 하는 방법 2가지
--			1. 삭제 후 재생성 ( 제일 확실한 방법 )
--				DROP SEQUENCE 시퀀스명
--				CREATE SEQUENCE 시퀀스명
--			2. INCREMENT BY 조정
--				예제 ) 현재 시퀀스가 105 인데 1부터 다시 시작하고 싶을 때
--				INCREMENT BY -104 수정 후
--				시퀀스.NEXTVAL ---> 시퀀스 값이 1로 바뀐다.
--				이후에 INCREMENT BY 1 로 재수정
--		** 캐시 문제 방지 - 메모리에 남은 값이 있어서 초기화 효과가 안보일 수 있기 때문에
--						옵션을 NOCACHE로 변경해준 다음 초기화를 해야한다.

--	SYNONYM ( 시노님 - 동의어 )
--		: 별명을 붙이는 객체
--		: SYNONYM을 사용할 때는 권한이 필요하다.
--			> CREATE SYNONYM, CREATE PUBLIC SYNONYM
--			권한은 SYSTEM 계정에서 부여할 수 있으므로 명령 프롬프트 창에서 진행

--		예제 ) EMP 테이블에 E 라는 이름으로 동의어(SYNONYM) 만들기
CREATE SYNONYM E FOR EMP;

SELECT * FROM E;

--		예제 ) DEPT 테이블에 D 라는 이름으로 동의어를 생성하되, 
--			  모든 사용자가 접근할 수 있도록 생성
--			** 이 때 생성된 D 라는 SYNONYM은 SCOTT 계정이 아닌 DBA 계정에 저장된다.
CREATE PUBLIC SYNONYM D FOR DEPT;

SELECT * FROM D;

--		SYNONYM 조회하기
--			: user_synonyms 데이터 사전을 이용해서 조회
SELECT synonym_name, table_owner, table_name
FROM user_synonyms
WHERE TABLE_OWNER = 'SCOTT';
--			** PUBLIC으로 만든 동의어는 DBA 권한을 가진 계정으로 조회해야한다.

--		SYNONYM 삭제하기
--			DROP SYNONYM 동의어이름;
DROP SYNONYM E;

SELECT * FROM E;

--		서브쿼리 문제 1 ( EMP 테이블과 DEPT 테이블을 사용 )
--			전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의 직책, 사원번호, 사원명,
--			급여, 부서번호, 부서명을 조회하세요.
--			1. ALLEN 의 직책 구하기
SELECT JOB
FROM EMP
WHERE ENAME = 'ALLEN';
--			2. DEPT 테이블과 JOIN 하여 메인쿼리 작성하기
SELECT	E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM 	EMP E, DEPT D
WHERE	E.DEPTNO = D.DEPTNO
AND		E.JOB = ( SELECT JOB
				  FROM EMP
				  WHERE ENAME = 'ALLEN' );

--		서브쿼리 문제 2 ( EMP , DEPT , SALGRADE )
--			전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사원들의 사원번호, 이름,
--			부서명, 입사일, 근무위치, 급여, 급여등급을 출력하세요.
--			단, 급여가 많은 순으로 정렬하되, 같으면 사원번호를 기준으로 오름차순 정렬하세요.
--			1. 전체 사원의 평균 급여 구하기
SELECT AVG(SAL) FROM EMP;
--			2. EMP, DEPT, SALGRADE 를 JOIN 하여 메인쿼리 작성
SELECT	E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC,
		E.SAL, S.GRADE
FROM	EMP E, DEPT D, SALGRADE S
WHERE	E.DEPTNO = D.DEPTNO
AND		E.SAL BETWEEN S.LOSAL AND S.HISAL
AND		E.SAL > ( SELECT AVG(SAL) FROM EMP );

--		서브쿼리 문제 3 ( EMP , DEPT )
--			10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의
--			사원번호, 사원이름, 직책, 부서번호, 부서명, 근무위치를 출력하세요.
--			1. 30번 부서에 존재하는 직책을 구하기 ( 중복 없이 )
SELECT DISTINCT JOB
FROM EMP
WHERE DEPTNO = 30;
--			2. EMP 테이블과 DEPT 테이블을 JOIN하여 메인쿼리를 작성
SELECT	E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM 	EMP E, DEPT D
WHERE	E.DEPTNO = D.DEPTNO
AND		E.DEPTNO = 10
AND		E.JOB NOT IN ( SELECT DISTINCT JOB
				  	   FROM EMP
				   	   WHERE DEPTNO = 30 );

--		서브쿼리 문제 4 ( EMP , SALGRADE )
--			직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의
--			사원번호, 사원이름, 급여, 급여등급을 출력하세요.
--			단, 사원번호를 기준으로 오름차순 정렬하세요.
--			1. SALESMAN 직책의 급여들을 구하기
SELECT DISTINCT SAL
FROM EMP
WHERE JOB = 'SALESMAN';
--			2. 다중행 연산자를 사용하여 MAIN QUERY 작성하기
SELECT	E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM	EMP E, SALGRADE S
WHERE	E.SAL BETWEEN S.LOSAL AND S.HISAL
AND		E.SAL > ALL( SELECT DISTINCT SAL 
				     FROM EMP
				     WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;
--			3. 단일행 연산자를 사용하여 MAIN QUERY 작성하기
SELECT	E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM	EMP E, SALGRADE S
WHERE	E.SAL BETWEEN S.LOSAL AND S.HISAL
AND		E.SAL > ( SELECT MAX(SAL) 
				  FROM EMP
				  WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

--		시퀀스 문제
--		1 ) DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 생성하세요.
CREATE TABLE DEPTSEQ
AS SELECT * FROM DEPT;
--		2 ) 아래 조건과 같은 시퀀스를 생성하세요.
--			시퀀스명 : DEPTNO_SEQ
--			시작 값 : 1
--			증가 값 : 1
--			최대 값 : 99
--			최소 값 : 1
--			최대 값에 도달하면 생성 중단
--			캐시 없음
CREATE SEQUENCE DEPTNO_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99
MINVALUE 1
NOCYCLE
NOCACHE;
--		3 ) 생성한 시퀀스를 이용하여 아래와 같이 세 개 부서를 추가한 후 데이터 확인하세요.
--			DEPTNO : 시퀀스 | DNAME : DATABASE | LOC : SEOUL
--			DEPTNO : 시퀀스 | DNAME : WEB	 	 | LOC : BUSAN
--			DEPTNO : 시퀀스 | DNAME : MOBILE	 | LOC : ILSAN
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC)
VALUES(DEPTNO_SEQ.NEXTVAL, 'DATABASE', 'SEOUL');
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC)
VALUES(DEPTNO_SEQ.NEXTVAL, 'WEB', 'BUSAN');
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC)
VALUES(DEPTNO_SEQ.NEXTVAL, 'MOBILE', 'ILSAN');

SELECT * FROM DEPTSEQ;








