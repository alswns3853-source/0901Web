-- JOIN : 수평적 결합으로 테이블 두 개를 합한다.
--		집합연산자를 사용했을 때는 수직적 결합
--	1. 데카르트 곱(카테시안 곱 : CARTESIAN PRODUCT)
--		교차 조인 / 크로스 조인
--		- 조인에 대한 조건이 없을 때 모든 데이터를 조인함.
SELECT * 
FROM emp e, dept d
ORDER BY empno;

SELECT * FROM emp;
SELECT * FROM dept;

-- 2. 조인 조건을 달아주기.
SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno -- join 조건.
ORDER BY e.empno;

-- 3. 테이블에 별칭 달아주기
--		조인하는 테이블 중에 하나만 있는 컬럼명이라면 별칭(테이블명)을 작성하지 않아도 된다.
--		하지만, 각 컬럼에 모든 테이블명(별칭)을 다 작성해주는 것을 추천한다.
SELECT e1.empno AS "사원번호", e1.ename, e1.DEPTNO , d1.dname
FROM emp e1, dept d1
WHERE e1.deptno = d1.deptno -- join 조건.
ORDER BY e1.empno;

-- tip) 보통 모든 select문에 * 작성하지 않고 모든 컬럼명을 나열하는게 좋다.
--		-> 쿼리 결과문이 항상 똑같은 순서로 나오지는 않을 수도 있기 때문

-- JOIN 의 종류
--	1. 등가 조인 : 조인의 조건이 ( = ) 조건으로 붙이는 조인
--	2. 비등가 조인 : 조인의 조건이 ( >=, >, <=, < 등 ) 같다가 아닌 조건으로 붙이는 조인
--	3. 셀프 조인 : 하나의 테이블을 조인
--		등가, 비등가, 셀프 조인은 inner join 이라고 한다.
--		inner join : 데이터가 있어야 출력하는 조인
--	4. 외부 조인(outer join) : 데이터가 없어도 출력하는 조인

-- 등가 조인
-- 예제 ) 각 사원들의 사원번호, 사원명, 부서번호, 부서명을 출력하여라.
--		 사원 정보는 emp 테이블, 부서 정보는 dept 테이블을 사용

-- ORACLE JOIN 문법 ( ORACLE 문법 )
SELECT e.EMPNO , e.ENAME , e.DEPTNO , d.DNAME
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
ORDER BY e.EMPNO ;

-- ANSI JOIN 문법 ( 표준 문법 )
SELECT e.EMPNO , e.ENAME , e.DEPTNO , d.DNAME 
FROM emp e JOIN dept d ON ( e.DEPTNO = d.deptno )
ORDER BY e.EMPNO ;

-- 예제 ) 각 학생들의 이름과 지도교수의 이름을 출력하세요.
--		 학생 정보는 student 테이블 , 교수 정보는 professor 테이블을 사용
SELECT * FROM student;
SELECT * FROM professor;

-- ORACLE JOIN 문법
SELECT s.name AS "student_name", p.NAME AS "professor_name" 
FROM student s, professor p
WHERE s.PROFNO = p.PROFNO; 

-- ANSI JOIN 문법
SELECT s.name AS "student_name", p.NAME AS "professor_name" 
FROM student s JOIN professor p ON ( s.PROFNO = p.PROFNO );

-- 테이블 3개를 활용해서 조인하기
-- 예제 ) 학생 이름과 학과 이름과 지도교수 이름을 출력하여라
--	학생정보(student), 학과정보(department), 교수정보(professor)
SELECT * FROM department;
-- ORACLE JOIN 문법
SELECT s.name, d.dname, p.name 
FROM student s, department d, professor p
WHERE s.deptno1 = d.DEPTNO 
AND	  s.profno = p.profno;
-- ANSI JOIN 문법
--	2개 이상의 테이블을 JOIN 할 때는 하나씩 이어서 JOIN - on 작성하면 된다.
SELECT s.name, d.dname, p.name
FROM student s JOIN department d ON ( s.deptno1 = d.deptno )
			   JOIN professor p ON ( s.profno = p.profno );

-- 조인 조건이 아닌 다른 조건이 있을 때
--	예제 ) 학생들 중 학과1의 번호가 101번인 학생들의 이름과 지도교수 이름을 출력
-- ORACLE JOIN 문법
SELECT s.name, p.name
FROM student s, professor p
WHERE s.profno = p.profno -- JOIN 조건
AND s.deptno1 = 101; -- 일반 조건
-- ANSI JOIN 문법
SELECT s.name, p.name
FROM student s JOIN professor p ON ( s.profno = p.profno )
WHERE s.deptno1 = 101;
-- 일반 조건을 on 안에다가 작성해도 상관없다.
SELECT s.name, p.name
FROM student s JOIN professor p 
ON ( s.profno = p.profno 
	 AND s.deptno1 = 101 );

-- 비등가 조인
-- 예제 ) 각 사원들의 급여와 그 급여의 등급을 출력하시오.
--		사원 정보(emp), 급여등급정보(salgrade)
SELECT * FROM emp;
SELECT * FROM salgrade;

-- ORACLE JOIN 문법
SELECT e.ename, e.sal, s.grade
FROM emp e, salgrade s
--WHERE e.sal >= s.losal AND e.sal <= s.hisal
WHERE e.sal BETWEEN s.losal AND s.hisal -- 위 주석 where절과 동일
ORDER BY e.sal;

-- ANSI JOIN 문법
SELECT e.ename, e.sal, s.grade
FROM emp e JOIN salgrade s 
			 ON ( e.sal BETWEEN s.losal AND s.hisal )
ORDER BY e.sal;
--		BETWEEN 사용X
SELECT e.ename, e.sal, s.grade
FROM emp e JOIN salgrade s
			 ON ( e.sal >= s.losal
			 	  AND e.sal <= s.hisal );

-- 예제 ) 고객별로 마일리지 포인트를 조회한 후 해당 마일리지 점수로 받을 수 있는
--		 상품을 조회하라.
--		고객(customer), 상품(gift)
SELECT * FROM customer;
SELECT * FROM gift;
-- ORACLE JOIN 문법
SELECT c.GNAME , c.POINT , g.GNAME 
FROM customer c, gift g
WHERE c.point >= g.G_START
AND   c.point <= g.G_END;
-- ANSI JOIN 문법
SELECT c.GNAME , c.POINT , g.GNAME 
FROM customer c JOIN gift g
				  ON ( c.POINT >= g.g_start 
				  	   AND c.point <= g.g_end );

-- 테이블 3개를 활용해서 비등가 조인하기
-- 예제 ) 학생들의 이름과 학생들의 점수, 그 점수에 따른 등급을 출력
--		학생정보(student) 점수정보(score) 점수등급정보(hakjum)
SELECT * FROM student;
SELECT * FROM score;
SELECT * FROM hakjum;
-- ORACLE JOIN 문법
SELECT st.NAME , sc.TOTAL , h.GRADE 
FROM student st, score sc, hakjum h
WHERE st.STUDNO = sc.STUDNO 
AND	  sc.TOTAL >= h.MIN_POINT
AND   sc.TOTAL <= h.MAX_POINT;
-- ANSI JOIN 문법
SELECT st.NAME , sc.TOTAL , h.GRADE 
FROM student st JOIN score sc ON ( st.studno = sc.studno )
			    JOIN hakjum h ON ( sc.TOTAL >= h.MIN_POINT
			    				 AND sc.TOTAL <= h.MAX_POINT);

-- 셀프 조인 ( 자체 조인 )
--	예제 ) 사원들의 이름, 사원번호, 직속상관의 번호와 직속상관의 이름을 출력
--		사원테이블(emp)
SELECT * FROM emp;
-- ORACLE JOIN 문법
SELECT e1.EMPNO , e1.ENAME , e1.MGR , e2.ENAME
FROM emp e1, emp e2
WHERE e1.MGR = e2.EMPNO ;
-- ANSI JOIN 문법
SELECT e1.EMPNO , e1.ENAME , e1.MGR , e2.ENAME
FROM emp e1 JOIN emp e2 ON ( e1.MGR = e2.EMPNO );

-- 외부조인 ( 아우터 조인 )
-- 왼쪽 외부 조인(LEFT OUTER JOIN) / 오른쪽 외부 조인(RIGHT OUTER JOIN)
-- 왼쪽 외부 조인
--	예제 ) 사원의 번호와 이름을 출력하고, 그 사원의 직속상관의 번호와 이름을 출력하라
--		  직속상관의 번호가 없는 사원도 출력하라.
-- ORACLE JOIN 문법
SELECT e1.EMPNO , e1.ENAME , e1.MGR , e2.ENAME 
FROM emp e1, emp e2
WHERE e1.MGR = e2.EMPNO(+);
-- ANSI JOIN 문법
SELECT e1.EMPNO , e1.ENAME , e1.MGR , e2.ENAME 
FROM emp e1 LEFT OUTER JOIN emp e2 ON ( e1.MGR = e2.EMPNO );

-- 오른쪽 외부 조인
--	예제 ) 사원의 번호와 이름을 출력하고, 그 사원의 직속상관의 번호와 이름을 출력하라
--		  부하직원이 없는 사원도 출력하라.
-- ORACLE JOIN 문법
SELECT e1.EMPNO , e1.ENAME , e1.MGR , e2.ENAME 
FROM emp e1, emp e2
WHERE e1.MGR(+) = e2.EMPNO;
-- ANSI JOIN 문법
SELECT e1.EMPNO , e1.ENAME , e1.MGR , e2.ENAME 
FROM emp e1 RIGHT OUTER JOIN emp e2 ON ( e1.MGR = e2.EMPNO );

-- 예제 ) 학생 이름과 지도 교수의 이름을 출력하세요
--		단, 지도교수가 없는 학생도 출력하여라.

-- ORACLE JOIN 문법
SELECT s.NAME , p.NAME
FROM student s, professor p
WHERE s.PROFNO = p.PROFNO(+) ;
-- ANSI JOIN 문법
SELECT s.name, p.name
FROM student s LEFT OUTER JOIN professor p ON (s.profno = p.profno );

-- 예제 ) 학생 이름과 지도 교수의 이름을 출력하세요
--		단, 지도학생이 없는 교수도 출력하여라.

-- ORACLE JOIN 문법
SELECT s.name, p.name
FROM student s, professor p
WHERE s.profno(+) = p.profno;
-- ANSI JOIN 문법
SELECT s.name, p.name
FROM student s RIGHT OUTER JOIN professor p ON ( s.profno = p.profno);

-- 양쪽 외부 조인
--	예제 ) 학생 이름과 지도교수 이름을 출력하여라
--		 지도교수가 없는 학생과 지도학생이 없는 교수 모두 출력하여라.

-- ORACLE JOIN 문법 ( 따로 없다, 집합 연산자를 사용 )
SELECT s.NAME , p.NAME
FROM student s, professor p
WHERE s.PROFNO = p.PROFNO(+)
UNION
SELECT s.NAME , p.NAME 
FROM student s, professor p
WHERE s.PROFNO(+) = p.PROFNO;
-- ANSI JOIN 문법
SELECT s.NAME , p.NAME 
FROM student s FULL OUTER JOIN  professor p 
							ON ( s.PROFNO = p.PROFNO );

-- ORACLE OUTER JOIN 에 대한 주의사항
--	1. WHERE 절에 적히는 OUTER JOIN 조건이 되는 모든 컬럼에 (+) 기호를 써야한다.
--	예제) 부서에 대한 정보를 모두 보여주고, 부서 번호가 '20'인 사원의 번호,이름,급여를 출력

--		기호를 작성하지 않았을 때
SELECT d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal
FROM dept d, emp e
WHERE d.deptno = e.DEPTNO(+)
AND e.deptno = 20;
--		기호를 작성했을 때
SELECT d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal
FROM dept d, emp e
WHERE d.deptno = e.DEPTNO(+)
AND e.deptno(+) = 20;

-- ANSI OUTER JOIN 주의사항
-- 1. 일반 조건과 조인 조건을 구분해야한다.
--	예제 ) 직업이 CLERK 인 사원 정보를 출력하고 그중에 CHICAGO에 위치한 부서에 소속된
--		  사원의 부서정보를 출력하라
--		사원정보 : 번호,이름,직업 // 부서정보 : 번호, 부서명, 위치

--	구분 했을 때
SELECT e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
FROM emp e LEFT OUTER JOIN dept d
						ON ( e.deptno = d.deptno 
							AND d.loc = 'CHICAGO' )
WHERE e.job = 'CLERK';

--	구분하지 않았을 때
SELECT e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
FROM emp e LEFT OUTER JOIN dept d
						ON ( e.deptno = d.deptno 
							AND d.loc = 'CHICAGO'
							AND e.job = 'CLERK');

-- 모든 문제는 ANSI JOIN 문법과 ORACLE JOIN 문법 두 가지 방식으로 작성하라.

-- 1번문제 ) 급여(SAL)가 2000 초과인 사원들의 부서 정보, 사원정보를 출력하라
--			부서정보(dept) : 부서번호(deptno), 부서이름(dname)
--			사원정보(emp) : 사원번호(empno), 사원이름(ename), 급여(sal)

-- ANSI JOIN 문법
SELECT d.DEPTNO , d.DNAME , e.EMPNO , e.ENAME , e.SAL 
FROM dept d JOIN emp e ON ( d.deptno = e.deptno )
WHERE e.sal > 2000;

-- 2번문제 ) 각 부서별 번호와 이름, 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하라.
--			부서정보(dept) : 부서번호 (deptno), 부서이름(dname)
--			사원정보(emp) : 급여(sal)

-- ANSI JOIN 문법
SELECT d.DEPTNO , d.DNAME , trunc(avg(e.SAL)) AS "AVG_SAL",
	   max(sal) AS "MAX_SAL", min(sal) AS "MIN_SAL", 
	   count(e.sal) AS "CNT"
FROM dept d JOIN emp e ON ( d.deptno = e.deptno )
GROUP BY d.deptno, d.dname;

-- 3번 문제 ) 모든 부서 정보와 사원정보를 출력하라
--			단, 부서번호, 사원이름 순으로 출력하라
--		    부서정보(dept) : 부서번호(deptno) 부서명(dname)
--			사원정보(emp)  : 사원번호(empno) 사원명(ename) 직책(job) 급여(sal)
-- ORACLE JOIN 문법
SELECT d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM dept d, emp e
WHERE d.deptno = e.deptno(+)
ORDER BY d.deptno, e.ename;
-- ANSI JOIN 문법
SELECT d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM dept d LEFT OUTER JOIN emp e ON( d.deptno = e.deptno )
ORDER BY d.deptno, e.ename;

-- 4번 문제 ) 학생 이름, 학과1 번호, 학과1 이름을 출력하시오
--			학생정보(student) : 이름(name) 학과1번호(deptno1)
--			학과정보(department) : 학과이름(dname)

-- ANSI JOIN 문법
SELECT s.NAME , s.DEPTNO1 , d.DNAME
FROM student s JOIN department d ON (s.DEPTNO1 = d.DEPTNO);

-- 5번 문제 ) 현재 직급이 있는 사원의 이름과 직급, 현재연봉,
--			해당 직급의 하한 금액과 상한 금액을 출력하라.
--			사원정보(emp2) : 이름(name), 직급(position), 연봉(pay)
--			연봉정봉(p_grade) : 직책(position) 하한금액(s_pay) 상한금액(e_pay)

--	ANSI JOIN 문법
SELECT e.name, e.POSITION, e.pay, p.s_pay, p.e_pay
FROM emp2 e JOIN  p_grade p ON ( e.POSITION = p.POSITION );

-- 6번 문제 ) 사원의 이름과 나이, 현재 직급, 예상 직급 출력
--			나이는 birthday 를 사용해서 현재 날짜와 계산 후 -12 를 한다.
--			출력은 나이순으로
--			사원정보 ( emp2 )
--			직급정보 ( p_grade ) : s_age , e_age를 이용해서 예상 직급을 나타낼 수 있다.

-- ORACLE JOIN 문법
SELECT e.NAME , 
	   trunc(MONTHS_BETWEEN(sysdate, e.birthday)/12)-12 AS "AGE",
	   e.POSITION AS "curr_position", p.position AS "be_position"
FROM emp2 e, p_grade p
WHERE trunc(MONTHS_BETWEEN(sysdate, e.birthday)/12)-12 >= p.s_age
AND	  trunc(MONTHS_BETWEEN(sysdate, e.birthday)/12)-12 <= p.e_age
ORDER BY AGE;

-- ANSI JOIN 문법
SELECT e.NAME , 
	   trunc(MONTHS_BETWEEN(sysdate, e.birthday)/12)-12 AS "AGE",
	   e.POSITION AS "curr_position", p.position AS "be_position"
FROM emp2 e JOIN p_grade p 
	ON (trunc(MONTHS_BETWEEN(sysdate, e.birthday)/12)-12 
			BETWEEN p.s_age AND p.e_age)
ORDER BY age;

-- 7번 문제 ) 고객이 자기 포인트보다 낮은 포인트의 상품 중 한 가지를 선택할 수 있다고 할 때,
--			Notebook 을 선택할 수 있는 고객의 이름과 포인트, 상품명을 출력하라.
--			고객정보(customer) : 이름(gname), 포인트(point)
--			상품정보(gift) : 최소포인트(g_start), 상품명(gname)
SELECT * FROM customer;
SELECT * FROM gift;

-- ORACLE JOIN 문법
SELECT c.GNAME AS "cust_name", c.point AS "point", 
	   g.gname AS "gift_name"
FROM customer c , gift g
WHERE c.point >= g.G_START
AND g.GNAME LIKE 'Notebook';

-- ANSI JOIN 문법
SELECT c.GNAME AS "cust_name", c.point AS "point", 
	   g.gname AS "gift_name"
FROM customer c JOIN gift g
				  ON ( c.point >= g.G_START
				  	  AND g.GNAME LIKE 'Notebook' );

-- 8번 문제 ) 교수 테이블에서 교수의 번호, 이름, 입사일, 
--			자신보다 입사일이 빠른 사람 수를 출력
--			단, 자신보다 입사일이 빠른 사람수를 오름차순으로 출력
--			교수(professor) : 번호(profno), 이름(name), 입사일(hiredate)

SELECT p1.profno, p1.name, p1.hiredate, count(p2.name) AS "count"
FROM professor p1, professor p2
WHERE p1.hiredate > p2.hiredate(+)
GROUP BY p1.profno, p1.name, p1.hiredate
ORDER BY count(p2.name);

-- 9번 문제 ) 모든 부서정보, 사원정보, 급여등급정보, 직속상관의 정보를 출력하라
--			단, 부서번호, 사원번호 순으로 출력
--			부서정보 ( dept ) : 부서번호, 부서이름
--			사원정보 ( emp ) : 사원번호, 사원이름, 급여, 직속상관번호(mgr)
--			급여등급정보 ( salgrade ) : 급여등급(salgrade)
--			직속상관의 정보 ( emp ) : 사원정보의 mgr 에 따른 직속상관이름(ename)

-- ORACLE JOIN 문법
SELECT d.deptno, d.dname, e1.empno, e1.ename, e1.sal, s.grade,
	   e1.mgr, e2.ename
FROM dept d, emp e1, salgrade s, emp e2
WHERE 	d.deptno = e1.deptno(+)
AND		e1.sal >= s.losal(+)
AND		e1.sal <= s.hisal(+)
AND		e1.mgr = e2.empno(+)
ORDER BY d.deptno, e1.empno;
-- ANSI JOIN 문법
SELECT d.deptno, d.dname, e1.empno, e1.ename, e1.sal, s.grade,
	   e1.mgr, e2.ename
FROM dept d LEFT OUTER JOIN emp e1 
					ON ( e1.deptno = d.deptno )
		    LEFT OUTER JOIN salgrade s 
		    		ON ( e1.sal >= s.losal AND e1.sal <= s.hisal )
		    LEFT OUTER JOIN emp e2 
		    		ON ( e1.mgr = e2.empno )
ORDER BY d.deptno, e1.empno;









