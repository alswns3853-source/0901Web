-- 주석 작성 ( -- ) : 하이펀 2개 작성 후 작성하면 주석으로 인식된다.

-- 모든 데이터를 조회하기
-- select 구문 : 내가 조회할 컬럼을 지정한다.
-- from 구문 : 데이터가 저장되어있는 테이블을 지정한다.
select * from emp;
select * from dept;

-- 원하는 컬럼만 지정해서 조회하기
-- emp 테이블에서 empno컬럼과 ename컬럼 2가지만 조회
select empno, ename from emp;
-- dept 테이블에서 deptno 컬럼과 dname 컬럼 2가지만 조회
select deptno, dname from dept;

-- 중간에 표현식(문자열) 넣기
select empno, '의 번호를 가진 사람 : ', ename from emp;
-- 표현식에 특수문자 사용(문자열 안에 홑따옴표를 사용할 때)
select empno, '의 번호를 가진 사람 '' ', ename from emp;
select empno, q'[번호를가진사람'''']', ename from emp; -- 오라클 문자열 사용법(다른DB에서는 불가능할 수도 있다.)

-- 컬럼에 별칭달기( 띄어쓰기나 특수문자를 사용할 경우에는 쌍따옴표로 묶어주기 )
select empno as "사원 번호", ename as "사원 이름"
from emp;

-- 중복 제거하는 명령어 (Distinct)
select deptno from emp; -- 중복 제거 x
select distinct deptno from emp; -- 중복 제거 o
-- 여러 열을 중복 제거해서 조회할 때 ( 행 자체가 중복되면 제거한다. )
select job, deptno from emp;
select distinct job, deptno from emp;

-- 연결 연산자 ( || ) : 컬럼 또는 표현식(문자열)을 연결해서 조회한다.
select ename, job from emp;
select ename || '의 직업은 ' || job as "사원의 직업" from emp;

-- emp 테이블에서 ename(사원이름)과 sal(급여)를 연결해서 (ename)'s sal is (sal) 의 형식으로 출력하시오.
select ename || '''s sal is ' || sal as "사원의 급여" from emp;
select ename || q'['s sal is ]' || sal as "사원의 급여" from emp;

-- 조건에 의해서 데이터를 조회하기 ( where 절 )
-- where 구문 : 조건을 추가해서 그 조건에 맞는 데이터만 조회한다.
select *
from emp
where deptno = 30;

-- 여러 개의 조건을 사용해서 조회하기 ( and , or )
-- 1. emp 테이블에서 부서 번호가 30 이고, 직업이 salesman인 데이터를 조회
select *
from emp
where deptno = 30
and job = 'SALESMAN';
-- 2. emp 테이블에서 부서번호가 30 이거나, 직업이 salesman 인 데이터를 조회
select *
from emp
where deptno = 30
or job = 'SALESMAN';
-- 3. emp 테이블에서 hiredate 가 80/12/17 일 데이터를 조회
select *
from emp
where hiredate = '80/12/17';

-- where 절에서 사용하는 연산자 ( 산술 연산자 + - * / )
-- emp 테이블에서 sal * 12 = 36000 이 되는 sal을 가진 데이터를 출력
select *
from emp
where sal * 12 = 36000;

-- where 절에서 사용하는 연산자 ( 비교 연산자 > , >= , < , <= )
-- emp 테이블에서 sal 이 3000 이상인 데이터를 출력
select *
from emp
where sal >= 3000;
-- emp 테이블에서 직원 이름이 F 보다 높거나 같은 이름을 가진 데이터를 출력
select *
from emp
where ename > 'F'; -- FORD 가 F 보다 크다

-- where 절에서 사용하는 연산자 ( 비교 연산자 = , != , <> )
-- emp 테이블에서 sal 이 3000 인 데이터를 조회
select *
from emp
where sal = 3000;
-- emp 테이블에서 sal 이 3000이 아닌 데이터를 조회
select * 
from emp
where sal != 3000;
select *
from emp
where sal <> 3000;

-- 논리 부정 연산자 ( NOT )
-- emp 테이블에서 sal이 3000이 아닌 데이터를 조회
select * from emp
where not sal = 3000;

-- IN 연산자 ( OR 연산자 대신 사용 가능 )
-- emp 테이블에서 job(직업)이 MANAGER , SALESMAN, CLERK 인 데이터를 조회
-- 1. or 연산자 사용했을 때
select * from emp
where job = 'MANAGER'
or job = 'SALESMAN'
or job = 'CLERK';
-- 2. IN 연산자
select * from emp
where job in('MANAGER', 'SALESMAN', 'CLERK');
-- IN 연산자의 부정 ( AND 연산자로 동작 )
select * from emp
where job not in('MANAGER', 'SALESMAN', 'CLERK');

-- BETWEEN a AND b 연산자 ( a 이상 b 이하의 데이터를 조회 )
-- emp 테이블에서 sal(급여)이 2000 이상 3000 이하인 데이터를 조회
-- 1. between을 사용 안하고 작성
select * from emp
where sal >= 2000 and sal <= 3000;
-- 2. between 연산자를 사용해서 작성
select * from emp
where sal between 2000 and 3000;

-- LIKE 연산자 ( 특정 패턴을 가지고 있는 문자열 데이터를 조회 )
-- %  : 글자 수 제한 없이 어떠한 글자가 와도 상관이 없다. 
-- _  : 글자 수 한 글자만 올 수 있고 어떠한 글자가 와도 상관이 없다.
-- emp 테이블에서 두번째 문자로 L을 가지는 직원의 이름을 출력하여라
select ename
from emp
where ename like '_L%';
-- emp 테이블에서 S 로 시작하는 사원의 이름을 출력하여라
select ename
from emp
where ename like 'S%';
-- emp 테이블에서 AM 을 포함하는 사원의 이름을 출력하여라
select ename
from emp
where ename like '%AM%';
-- like 의 부정 ( not like )
-- emp 테이블에서 AM 을 포함하지 않는 사원의 이름을 출력하여라
select ename
from emp
where ename not like '%AM%';

-- IS NULL / IS NOT NULL 연산자
-- NULL 이란 ? 저장된 값(데이터)이 없음을 뜻한다.
-- 그래서, NULL 과 관련된 모든 연산은 FALSE가 나온다.
-- emp 테이블에서 comm(수당) 컬럼이 NULL인 사원의 이름을 조회하여라
select ename, comm
from emp
where comm is null;
-- emp 테이블에서 comm(수당) 컬럼이 NULL이 아닌 사원의 이름을 조회하여라
select ename, comm
from emp
where comm is not null;

-- NULL 과 AND, OR 연산
-- 1번 조건 : SAL > NULL   - FALSE
-- 2번 조건 : COMM IS NULL - 10개의 row 가 조회됨
-- AND 연산과 OR 연산 차이점
select * from emp
where sal > null and comm is null; -- 모든 결과에 대해서 1번 조건이 false 라서 출력되는 조건 없음
select * from emp
where sal > null or comm is null;
-- 모든 결과에 대해서 1번 조건이 false 지만, 2번 조건이 true가 되는게 있기 때문에 출력값이 있다.

-- 쿼리 조회문을 정렬하기 ( ORDER BY 절 )
-- ORDER BY 조회기준이되는컬럼 asc(오름차순)/desc(내림차순)
-- emp 테이블에서 sal(급여)을 기준으로 내림차순 정렬된 결과물을 조회하여라
select *
from emp
order by sal desc;
-- emp 테이블에서 sal(급여)을 기준으로 오름차순 정렬된 결과물을 조회하여라
select *
from emp
order by sal asc;
-- 여러가지 컬럼을 기준으로 정렬
select *
from emp
order by deptno, sal;
-- 여러가지 컬럼을 기준으로 정렬하면서 각각의 다른 방식으로 정렬
select * from emp
order by deptno, sal desc;

-- select / from / where / order by 구문 순서
select *
from emp
where sal = 3000
order by sal;

-- 집합 연산자 ( UNION , UNION ALL , INTERSECT , MINUS )
-- UNION : 중복이 제거되는 합집합
-- UNION ALL : 중복을 허용하는 합집합
-- INTERSECT : 교집합
-- MINUS : 차집합
-- 집합연산자는 2개의 쿼리문으로 나오는 결과값을 중심으로 집합을 연산한다.
-- UNION ( 중복이 제거된 합집합 ) - OR 연산
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select empno, ename, sal, deptno
from emp
where deptno = 10;
-- UNION ALL ( 중복을 허용하는 합집합 ) - OR 연산
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION ALL
select empno, ename, sal, deptno
from emp
where deptno = 10;
-- INTERSECT ( 교집합 ) - AND 연산
select empno, ename, sal, deptno
from emp
INTERSECT
select empno, ename, sal, deptno
from emp
where deptno = 10;
-- MINUS ( 차집합 )
select empno, ename, sal, deptno
from emp
MINUS
select empno, ename, sal, deptno
from emp
where deptno = 10;

-- 1. EMP 테이블에서 JOB(직업)을 중복 없이 출력하여라
select distinct job
from emp;

-- 2. EMP 테이블의 모든 데이터를 출력하고, 각 컬럼의 별칭을 지정한다.
-- empno -> employee_no / ename -> employee_name / mgr -> manager / sal -> salary
-- 부서 번호를 기준으로 내림차순 정렬하되, 부서 번호가 같으면 사원 이름을 기준으로 오름차순 하라.
select empno as "employee_no", ename as "employee_name", job, mgr as "manager", 
       hiredate, sal as "salary", comm, deptno
from emp
order by deptno desc, ename asc;

-- 3. EMP 테이블에서 사원이름이 S 로 끝나는 사원 데이터를 모두 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';
-- 4. EMP 테이블에서 30번 부서에 근무하는 사원중에 직책(JOB)이 SALESMAN인 사원의
--      사원번호(EMPNO), 이름(ENAME), 직책(JOB), 급여(SAL), 부서번호(DEPTNO)를 조회하라
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

-- 5. EMP 테이블에서 20번, 30번 부서에서 근무하는 사원 중 
--      급여가 2000 초과인 사원의 사원번호, 사원이름, 직책, 급여를 조회하라
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE DEPTNO IN(20, 30)
AND SAL > 2000;

SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE DEPTNO = 20
AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE DEPTNO = 30
AND SAL > 2000;

-- 6. EMP 테이블에서 급여 값이 2000 이상 3000 이하 범위 외의 값을 가진 사원의 이름, 급여를 조회하라
SELECT ENAME, SAL
FROM EMP
WHERE SAL < 2000 OR SAL > 3000;

SELECT ENAME, SAL
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- 7. 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중
--      급여가 1000 이상 2000 이하가 아닌 사원의 이름, 번호, 급여, 부서번호를 출력
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%'
AND DEPTNO = 30
AND SAL NOT BETWEEN 1000 AND 2000;

-- 8. 추가 수당(COMM)이 존재하지 않고, 상급자(mgr)가 존재하며, 직책(JOB)이 MANAGER, CLERK 인 사원 중
--      사원 이름의 두 번째 글자가 L 이 아닌 사원의 모든 정보를 출력하여라
SELECT *
FROM EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL
AND JOB IN('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%';


 







