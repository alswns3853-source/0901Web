-- 그룹화 관련된 함수
-- 1. ROLLUP 함수 - 그룹화한 컬럼들의 소계를 나타내는 함수
--          N+1개의 그룹화가 이루어진다.
--          예를들어, DEPTNO, JOB 을 그룹화 했다면 
--              DEPTNO, JOB 그룹1개
--              DEPTNO 그룹 1개
--              전체 그룹 1개 
--  예제 ) 부서와 직업별 평균 급여 및 사원 수와 부서별 평균 급여와 사원수,
--          전체 사원의 평균 급여와 사원 수를 나타내시오.
--          1. 부서와 직업별 평균 급여 및 사원 수
--          2. 부서별 평균 급여와 사원 수
--          3. 전체 사원의 평균 급여와 사원 수
SELECT DEPTNO, JOB, ROUND(AVG(SAL),1) AS "AVG_SAL", 
       COUNT(*) AS "CNT_EMP"
FROM EMP
GROUP BY DEPTNO, JOB
UNION ALL
SELECT DEPTNO, NULL JOB, ROUND(AVG(SAL),1) AS "AVG_SAL",
       COUNT(*) AS "CNT_EMP"
FROM EMP
GROUP BY DEPTNO
UNION ALL
SELECT NULL DEPTNO, NULL JOB, ROUND(AVG(SAL),1) AS "AVG_SAL",
       COUNT(*) AS "CNT_EMP"
FROM EMP
ORDER BY DEPTNO, JOB;
-- 위 코드를 ROLLUP으로 사용
--     N+1개의 그룹으로 소계를 낸다. 순서대로. 
SELECT DEPTNO, JOB, ROUND(AVG(SAL),1) AS "AVG_SAL", 
       COUNT(*) AS "CNT_EMP"
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);
--  예제 ) 교수(PROFESSOR) 테이블에서 부서별(DEPTNO), 직책별(POSITION)
--        인원 수와 급여 합계, 부서별 인원수와 급여 합계, 
--        전체 인원수와 급여합계를 나타내시오
SELECT DEPTNO, POSITION, COUNT(*) AS "CNT_PROF", SUM(PAY) AS "SUM_PAY"
FROM PROFESSOR
GROUP BY ROLLUP(DEPTNO, POSITION)
ORDER BY DEPTNO;
-- 위의 쿼리문에서 직책별 소계만 보고싶다.
SELECT DEPTNO, POSITION, COUNT(*), SUM(PAY)
FROM PROFESSOR
GROUP BY POSITION, ROLLUP(DEPTNO);

-- 2. CUBE 함수 - 소계를 나타내는 함수
--      2의 N제곱 개의 그룹을 나타낸다.
--  예제 ) 부서별 평균 급여와 사원수, 직급별 평균 급여와 사원수,
--         부서-직급별 평균 급여와 사원수, 전체 평균급여와 사원수
SELECT DEPTNO, JOB, ROUND(AVG(SAL),1), COUNT(*)
FROM EMP
GROUP BY DEPTNO, JOB
UNION ALL
SELECT DEPTNO, NULL JOB, ROUND(AVG(SAL),1), COUNT(*)
FROM EMP
GROUP BY DEPTNO
UNION ALL
SELECT NULL DEPTNO, JOB, ROUND(AVG(SAL),1), COUNT(*)
FROM EMP
GROUP BY JOB
UNION ALL
SELECT NULL DEPTNO, NULL JOB, ROUND(AVG(SAL),1), COUNT(*)
FROM EMP
ORDER BY DEPTNO, JOB;
--  CUBE 함수 :  2의 N제곱만큼 소계를 낸다. 모든 경우의 수.
SELECT DEPTNO, JOB, ROUND(AVG(SAL),1), COUNT(*)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

-- 기준 데이터 3개로 ROLLUP 과 CUBE 실습
--  1. ROLLUP 의 경우
SELECT DEPTNO, JOB, MGR, COUNT(*)
FROM EMP
WHERE ENAME NOT LIKE 'KING'
GROUP BY ROLLUP(DEPTNO, JOB, MGR);
-- 2. CUBE 의 경우
SELECT DEPTNO, JOB, MGR, COUNT(*)
FROM EMP
WHERE ENAME NOT LIKE 'KING'
GROUP BY CUBE(DEPTNO, JOB, MGR)
ORDER BY DEPTNO, JOB, MGR;

-- 3. GROUPING SETS 함수 : 소계가 아닌 여러가지를 그룹화할 때 깔끔하게 볼 수 있다.
--  예제 ) 학생 테이블에서 학년별 인원수와 전공별 인원수를 출력하라
SELECT GRADE, DEPTNO1, COUNT(*)
FROM STUDENT
GROUP BY GROUPING SETS(GRADE, DEPTNO1)
ORDER BY GRADE, DEPTNO1;
--  예제 ) EMP테이블에서 부서번호별 인원수와 직급별 인원수를 출력하라
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY GROUPING SETS(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

-- 4. LISTAGG함수 : 그룹화의 내용을 연결시켜서 나타내는 함수
--      ***주의할 점 : 출력되는 값이 4000BYTE가 넘어가면 오류가 발생
--      첫번째 인수 : 연결시켜 나타낼 컬럼명
--      두번째 인수 : 컬럼의 데이터를 연결시켜 나타낼 때 사용하는 구분자
--  예제 ) EMP테이블에서 부서별 인원의 이름을 나타내어라.
SELECT DEPTNO, LISTAGG(ENAME, '->')
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--      EMP테이블에서 부서별 인원의 이름을 순서대로 나타내어라.
--          LISTAGG(컬럼, 구분자) WITHIN GROUP(ORDER BY 정렬기준)
SELECT DEPTNO, LISTAGG(ENAME, '->') WITHIN GROUP(ORDER BY ENAME)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 5. PIVOT 함수 : ROW 단위를 COLUMN 단위로 변경해준다.
SELECT DEPTNO, JOB, MAX(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
-- 먼저, PIVOT을 사용하지 않고 작성하는 방법
SELECT DEPTNO,
       MAX(DECODE(JOB, 'CLERK', SAL)) AS CLERK,
       MAX(DECODE(JOB, 'SALESMAN', SAL)) AS SALESMAN,
       MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS PRESIDENT,
       MAX(DECODE(JOB, 'MANAGER', SAL)) AS MANAGER,
       MAX(DECODE(JOB, 'ANALYST', SAL)) AS ANALYST
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--  PIVOT 함수를 이용해서 만들어보기
SELECT * FROM ( SELECT DEPTNO, JOB, SAL FROM EMP )
PIVOT ( MAX(SAL)
            FOR JOB IN ('CLERK', 'SALESMAN', 
                        'PRESIDENT','MANAGER', 'ANALYST')
)
ORDER BY DEPTNO;
-- ROW 가 JOB이 되고 COLUMN이 DEPTNO 가 되게끔 변경
SELECT * FROM ( SELECT DEPTNO, JOB, SAL FROM EMP )
PIVOT ( MAX(SAL)
        FOR DEPTNO IN('10' AS "10", '20' AS "20", '30' AS "30")
)
ORDER BY JOB;
-- CAL 테이블을 이용해서 달력 만들기
SELECT WEEKNO, DAY, DAYNO FROM CAL;
-- PIVOT 함수 사용 안하고 만들기
SELECT WEEKNO,
        MAX(DECODE(DAY,'SUN',DAYNO)) AS SUN,
        MAX(DECODE(DAY,'MON',DAYNO)) AS MON,
        MAX(DECODE(DAY,'TUE',DAYNO)) AS TUE,
        MAX(DECODE(DAY,'WED',DAYNO)) AS WED,
        MAX(DECODE(DAY,'THU',DAYNO)) AS THU,
        MAX(DECODE(DAY,'FRI',DAYNO)) AS FRI,
        MAX(DECODE(DAY,'SAT',DAYNO)) AS SAT
FROM CAL
GROUP BY WEEKNO
ORDER BY WEEKNO;
-- PIVOT 함수를 사용해서 만들어보기
SELECT * FROM (SELECT WEEKNO, DAY, DAYNO FROM CAL)
PIVOT( MAX(DAYNO)
        FOR DAY IN ('SUN' AS SUN, 'MON' AS MON,
                    'TUE' AS TUE, 'WED' AS WED,
                    'THU' AS THU, 'FRI' AS FRI,
                    'SAT' AS SAT)
)
ORDER BY WEEKNO;

-- 6. RANK 함수 : 순위를 출력해주는 함수
--  예제 ) EMP테이블에서 SMITH 라는 이름이 이름순으로 했을 때 몇 번째 인지 나타내시오.
--      ** 주의 : RANK 안의 데이터와 ORDER BY 에 작성할 컬럼은 같아야한다.
SELECT RANK('SMITH') WITHIN GROUP(ORDER BY ENAME) AS "RANK"
FROM EMP;
SELECT ENAME FROM EMP ORDER BY ENAME;
--  예제 ) 전체 순위를 확인하기
SELECT ENAME, RANK() OVER(ORDER BY ENAME DESC) AS "ENAME_RANK"
FROM EMP;
--  예제 ) 전체 순위에서 그룹화 하기
SELECT ENAME, DEPTNO, SAL, 
       RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL)
FROM EMP;

-- 7. DENSE_RANK 함수 : 순위를 출력해주는 함수
--      사용하는 방법은 위 RANK 함수와 동일
--      RANK와의 차이점 : 동일한 순위의 갯수를 쳐주지 않는다.
--                      공동 2위가 2명 있다면 다음이 4등이아니라 3등이다.
SELECT EMPNO, ENAME, SAL,
        RANK() OVER(ORDER BY SAL DESC) SAL_RANK,
        DENSE_RANK() OVER(ORDER BY SAL DESC) SAL_DENSE_RANK
FROM EMP;

-- 8. ROW_NUMBER 함수 : 순서를 매겨주는 함수
--      RANK, DENSE_RANK 와 사용법이 동일
--      차이점 : 데이터가 동일하더라도 지정된 ROW_ID를 이용해서 순위를 매김
SELECT EMPNO, ENAME, SAL,
        RANK() OVER(ORDER BY SAL DESC) SAL_RANK,
        DENSE_RANK() OVER(ORDER BY SAL DESC) SAL_DENSE_RANK,
        ROW_NUMBER() OVER(ORDER BY SAL DESC) SAL_ROW_NUMBER
FROM EMP;

-- RANK 와 DENSE_RANK, ROW_NUMBER 에 정렬기준을 여러 개 지정하기
SELECT EMPNO, ENAME, SAL,
        RANK() OVER(ORDER BY SAL DESC, EMPNO) SAL_RANK,
        DENSE_RANK() OVER(ORDER BY SAL DESC, EMPNO) SAL_DENSE,
        ROW_NUMBER() OVER(ORDER BY SAL DESC, EMPNO) SAL_ROW
FROM EMP;

-- 9. SUM() OVER 함수 : 누적된 총 합을 구한다.
--  예제 ) 판매(PANMAE) 테이블에서 판매점코드(P_STORE)가 1000번인
--         지점의 날짜순으로 일별 매출과 누적 합을 구하여라
SELECT P_DATE, P_CODE, P_QTY, P_TOTAL,
       SUM(P_TOTAL) OVER(ORDER BY P_DATE) "TOTAL"
FROM PANMAE
WHERE P_STORE = 1000;
--  예제 ) 판매 테이블에서 판매점코드가 1000번인 지점의 판매 내역을
--          제품코드별로 분류한 후 판매일자, 제품코드, 판매량, 판매금액
--          누적판매금액을 출력하라.
SELECT P_DATE, P_CODE, P_QTY, P_TOTAL,
        SUM(P_TOTAL) OVER(PARTITION BY P_CODE ORDER BY P_DATE) AS "TOTAL"
FROM PANMAE
WHERE P_STORE = 1000;

-- 1번 문제 ) EMP테이블에서 각 부서별 급여(SAL)의 평균, 최대, 최소 및 
--           부서 인원을 나타내어라.
SELECT DEPTNO, TRUNC(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
-- 2번 문제 ) EMP테이블에서 각 직책의 사원 수가 3명 이상인 직책과 사원수를
--           나타내어라.
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

-- 문제 3. 사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 출력.
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
        DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
ORDER BY TO_CHAR(HIREDATE, 'YYYY');
-- 문제 4. 추가수당(COMM)이 있는 사람과 없는 사람의 수를 출력.
SELECT NVL2(COMM, 'O', 'X') AS "EXIST_COMM",
        COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM, 'O','X');
-- 문제 5. 각 부서의 입사 연도별 사원수, 최고급여, 급여합, 평균급여를 출력
--        각 부서별 사원수, 최고급여, 급여합, 평균급여 출력
--        전체 사원수, 최고급여, 급여합, 평균급여 출력
--        위 3가지 사항을 한 쿼리로 출력하시오.
SELECT DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
        COUNT(*) AS CNT, MAX(SAL) AS MAX_SAL,
        SUM(SAL) AS SUM_SAL, TRUNC(AVG(SAL),1) AS AVG_SAL
FROM EMP
GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE,'YYYY'));

-- 책P212 문제 5번. EMP테이블을 사용하여 직원들의 급여와 전체 급여의
--                  누적급여 금액을 출력하라. 단, 급여를 오름차순 정렬.
SELECT DEPTNO, ENAME, SAL, SUM(SAL) OVER(ORDER BY SAL) AS "TOTAL"
FROM EMP;
-- 책P213 문제 8번. 부서별로 급여 누적 합계가 나오도록 작성.
--                  단, 부서 번호로 오름차순 정렬
SELECT DEPTNO, ENAME, SAL, 
        SUM(SAL) OVER(PARTITION BY DEPTNO ORDER BY SAL, ENAME) AS "TOTAL"
FROM EMP;
-- 책P212. 6번문제. FRUIT 테이블을 참고해서 아래와 같이 만드세요.
SELECT * FROM FRUIT;
SELECT * FROM ( SELECT NAME, PRICE FROM FRUIT)
PIVOT ( MAX(PRICE)
        FOR NAME IN ('apple' as "APPLE", 'grape' AS "GRAPE",
                     'orange' as "ORANGE")
);
-- 책P210. 2번문제
SELECT BIRTHDAY FROM STUDENT;

SELECT SUBSTR(BIRTHDAY, 6,2) AS "BIR_MON" FROM STUDENT;

SELECT * FROM (SELECT SUBSTR(BIRTHDAY, 6,2) AS "BIR_MON" FROM STUDENT)
PIVOT ( COUNT(BIR_MON)
        FOR BIR_MON IN ( '01' AS "JAN", '02' AS "FEB", '03' AS "MAR",
                         '04' AS "APR", '05' AS "MAY", '06' AS "JUN",
                         '07' AS "JUL", '08' AS "AUG", '09' AS "SEP",
                         '10' AS "OCT", '11' AS "NOV", '12' AS "DEC")
);

-- 책P210. 3번문제
SELECT TEL FROM STUDENT;
-- 지역번호 추출
SELECT REGEXP_SUBSTR(TEL, '[^)]+', 1, 1) AS "LOCALNUM" FROM STUDENT;
-- PIVOT 을 사용해서 각 지역별 인원을 체크
SELECT * FROM (SELECT REGEXP_SUBSTR(TEL, '[^)]+', 1, 1) AS "LOCALNUM" FROM STUDENT)
PIVOT ( COUNT(LOCALNUM)
        FOR LOCALNUM IN ('02' SEOUL, '031' GYEONGGI, '051' BUSAN,
                         '052' ULSAN, '053' DAEGU, '055' GYEONGNAM)
);

-- JOIN : 수평적 결합으로 테이블 두 개를 붙인다.
--		외래키(fk)를 이용해서 다른 테이블의 정보를 불러올 때 많이 사용
--	1. JOIN 조건 없이 그냥 출력 ( EMP : 14개 / DEPT : 4개 )
--		1-1) 데카르트 곱 ( 카테시안 곱 : cartesian product )
--			교차조인 / 크로스조인
SELECT * FROM emp, dept ORDER BY empno;

--	2. JOIN 조건을 추가해서 출력
SELECT ename, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno -- join 조건
ORDER BY empno;

--	3. JOIN 할 때 테이블에 별칭 붙이기
--		select구문에서 하나의 테이블에만 있는 컬럼은 테이블을 지정하지 않아도 된다.
SELECT ename, e.deptno, dname
FROM emp e, dept d
WHERE e.deptno = d.DEPTNO 
ORDER BY empno;
--		select 구문에 모든 컬럼에 작성해주는거를 추천한다.
SELECT e.ename, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.DEPTNO 
ORDER BY e.empno;
-- tip ) 보통은 select 구문에 * 을 작성하지 않고, 모든 컬럼을 명시하는게 좋다.
--		쿼리 결과문이 어떤 순서로 나올지도 모르고,
--		특정 열이 추가 또는 수정, 삭제될 수 있기 때문에
SELECT * FROM emp;
SELECT empno, ename, sal, hiredate
FROM  emp;















