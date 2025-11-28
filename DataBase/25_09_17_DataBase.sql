-- 오라클의 내장함수
--      단일행 함수 : 쿼리 조회 결과의 하나의 행에게 함수를 적용하는 함수
--      복수행 함수 : 쿼리 조회 결과의 여러 행을 하나의 행으로 바꿔서 결과를 적용하는 함수

-- 문자 함수
-- 1. INITCAP() 함수 : 첫 글자만 대문자로 출력하고, 나머지는 전부 소문자로 출력
SELECT ENAME, INITCAP(ENAME)
FROM EMP
WHERE DEPTNO = 10;
-- 2. UPPER() 함수 : 적혀있는 모든 영문자를 대문자로 출력
SELECT 'aaaaa', UPPER('aaaaa')
FROM DUAL;
-- 3. LOWER() 함수 : 적혀있는 모든 영문자를 소문자로 출력
SELECT 'AAAAA', LOWER('AAAAA')
FROM DUAL;
-- EMP 테이블에서 SCOTT 이라는 데이터를 찾으려고 할 때 사용 가능
-- 사용자가 소문자로 적을지 대문자로 적을지 알 수 없기 때문에 UPPER 또는 LOWER로 일치 시켜준다.
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('scott');
-- 4. LENGTH() , LENGTHB() : 글자의 길이(바이트수)를 나타낸다.
-- 영어는 한 글자당 1BYTE 를 가지게 된다, 그래서 LENGTH 와 LENGTHB 값이 같다.
SELECT ENAME, LENGTH(ENAME), LENGTHB(ENAME)
FROM EMP
WHERE DEPTNO = 20;
-- 한글은 한 글자당 3BYTE 를 가지게 된다, 그래서 LENGTH 와 LENGTHB 값이 다르다.
--      ** 한글이 3byte로 고정크기를 가지는 것은 아니다, 버전 또는 다른 DB를 사용하면 2byte 또는 3byte가 될 수 있다.
SELECT '홍길동', LENGTH('홍길동'), LENGTHB('홍길동')
FROM DUAL;
-- 5. CONCAT() 함수 : 데이터 2개를 연결시켜주는 함수 ( || 와 동일한 기능 )
SELECT ENAME, JOB, CONCAT(ENAME,JOB)
FROM EMP
WHERE DEPTNO = 10;
-- CONCAT() 함수를 이용해서 3개 이상을 연결시킬 때는 중첩해서 사용해한다.
SELECT ENAME, JOB, DEPTNO, CONCAT(CONCAT(ENAME,JOB), DEPTNO), ENAME || JOB || DEPTNO
FROM EMP
WHERE DEPTNO = 10;
-- 6. SUBSTR() 함수 : 문자열을 일부 추출하는 함수
--      SUBSTR(문자열 데이터, 시작위치) : 시작위치부터 끝까지 추출
--      SUBSTR(문자열 데이터, 시작위치, 추출길이) : 시작위치부터 추출 길이만큼 추출
--          ** 시작위치가 음수일 경우 마지막 위치부터 거슬러 올라간 위치에서 시작
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB,3, 2), SUBSTR(JOB, 5)
FROM EMP;
SELECT SUBSTR('ABCDE', 3, 2), SUBSTR('ABCDE', -3, 2), SUBSTR('ABCDE', -4, 4)
FROM DUAL;
-- EMP테이블에서 JOB 데이터를 뒤에서 두 글자만 출력
SELECT JOB, SUBSTR(JOB, -2), SUBSTR(JOB, LENGTH(JOB)-1)
FROM EMP;

-- 7. INSTR() 함수 : 문자열 데이터에서 특정 글자의 위치를 찾아주는 함수
--      INSTR(문자열데이터, 찾을 특정 글자) : 문자열데이터 중에서 첫번째로 나오는 특정 글자의 위치
--      INSTR(문자열데이터, 찾을 특정 글자, 시작 위치) : 문자열데이터 중에서 시작 위치 이후에 나오는 첫번째 특정글자의 위치
--      INSTR(문자열데이터, 찾을 특정 글자, 시작 위치, N번째) : 문자열데이터 중에서 시작 위치 이후에 나오는 N번째 특정글자의 위치
SELECT ENAME, INSTR(ENAME, 'T')
FROM EMP
WHERE ENAME LIKE('SCOTT');
SELECT 'A-B-C-D', INSTR('A-B-C-D', '-', 3)
FROM DUAL;
SELECT 'A-B-C-D', INSTR('A-B-C-D', '-', 3, 2)
FROM DUAL;

-- 8. LPAD() 함수 : 왼쪽에 특정글자를 채운다
--      LPAD(문자열데이터, 자릿수, 특정문자) : 문자열데이터에 지정한 자릿수만큼 왼쪽에 특정문자를 채운다.
SELECT 'AAAAA', LPAD('AAAAA', 10, '*')
FROM DUAL;

-- 9. RPAD() 함수 : 오른쪽에 특정글자를 채운다
--      RPAD(문자열데이터, 자릿수, 특정문자) : 문자열데이터에 지정한 자릿수만큼 오른쪽에 특정문자를 채운다.
SELECT 'AAAAA', RPAD('AAAAA', 10 , '*')
FROM DUAL;

-- 휴대폰 번호 또는 주민등록번호 마스킹할 때(가릴 때) 사용가능하다.
SELECT '010-1234-1234', RPAD(SUBSTR('010-1234-1234',1,9), 13,'*') AS RPAD_PHONE, 
       '250917-1234567', RPAD(SUBSTR('250917-1234567', 1,7), 14, '*') AS RPAD_JMNO
FROM DUAL;

-- 10. LTRIM() 함수 : 왼쪽에 있는 특정 문자를 삭제하는 함수
--      LTRIM(문자열데이터, 제거할문자)
SELECT ENAME, LTRIM(ENAME, 'C')
FROM EMP
WHERE DEPTNO = 10;
-- 11. RTRIM() 함수 : 오른쪽에 있는 특정 문자를 삭제하는 함수
SELECT ENAME, RTRIM(ENAME, 'R')
FROM EMP
WHERE DEPTNO = 10;

-- LPAD, RPAD, LTRIM, RTRIM 4개의 함수에 특정 문자를 지정하지 않으면, 기준은 공백이 된다.
SELECT LPAD('111', 5), RPAD('111',5), LTRIM('  111'), RTRIM('111   ')
FROM DUAL;

-- 12. REPLACE() 함수 : 문자열데이터의 일부를 다른 문자열로 교체
--      REPLACE(문자열데이터, 문자1, 문자2) : 문자열데이터의 문자1을 문자2로 변경한다
--      *** 문자2(변경할 문자)를 지정하지 않으면 문자1(변경 당할 문자)는 삭제된다
SELECT '010-1234-5678', 
       REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
       REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM DUAL;

SELECT ENAME, SUBSTR(ENAME, 2,2), REPLACE(ENAME, SUBSTR(ENAME,2,2), '--')
FROM EMP
WHERE DEPTNO = 20;

-- 문자 함수 문제
-- 1. EMP 테이블에서 사원 이름의 길이가 5 이상인 이름만 출력하라
SELECT ENAME
FROM EMP
WHERE LENGTH(ENAME) >= 5;
-- 2. EMP 테이블에서 JOB 컬럼의 첫 3자리 문자를 * 로 대체하여 출력하라
SELECT JOB, REPLACE(JOB, SUBSTR(JOB,1,3), '***')
FROM EMP;
-- 3. EMP 테이블에서 ENAME의 마지막 5글자를 추출하고 그 문자열 안에서 A 를 @ 로 변경하여라
--      ENAME 이 5글자 이상인 데이터만 가지고 진행
SELECT ENAME, SUBSTR(ENAME, -5), REPLACE(SUBSTR(ENAME, -5), 'A', '@')
FROM EMP
WHERE LENGTH(ENAME) >= 5;

-- 숫자 함수

-- 1. ROUND() 함수 : 주어진 숫자를 반올림하는 함수
--      ROUND(숫자데이터, 올릴자리수)
SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678, 0) AS ROUND_0,
       ROUND(1234.5678, 1) AS ROUND_1,
       ROUND(1234.5678, 2) AS ROUND_2,
       ROUND(1234.5678, -1) AS ROUND_MINUS1,
       ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- 2. TRUNC() 함수 : 자리수 이하를 절삭(버림)
--      TRUNC(숫자데이터, 자리수)
SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678, 0) AS TRUNC_0,
       TRUNC(1234.5678, 1) AS TRUNC_1,
       TRUNC(1234.5678, 2) AS TRUNC_2,
       TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;
-- 3. CEIL() 함수 : 지정한 DATA와 가장 가까운 큰 정수를 찾는 함수
--      CEIL(숫자데이터)
SELECT CEIL(3.14), CEIL(-3.14)
FROM DUAL;
-- 4. FLOOR() 함수 : 지정한 DATA와 가장 가까운 작은 정수를 찾는 함수
--      FLOOR(숫자데이터)
SELECT FLOOR(3.14), FLOOR(-3.14)
FROM DUAL;
-- 5. MOD() 함수 : 지정한 DATA 와 숫자를 나눈 나머지를 출력하는 함수
--      MOD(숫자데이터 , 나눌 숫자)
SELECT MOD(121, 10), MOD(7, 4)
FROM DUAL;
-- 6. POWER() 함수 : 지정한 DATA를 N 제곱하여 나타내는 함수
--      POWER(숫자데이터, N)
SELECT POWER(2, 3), POWER(11, 2)
FROM DUAL;

-- ROWNUM - 쿼리문을 호출할 때 작성해놓은 순서 번호
--      ** ORDER BY 를 사용하면 쿼리문을 호출한 후에 정렬하기 때문에 ROWNUM이 뒤죽박죽이 될 수 있다.
SELECT ROWNUM, ENAME
FROM EMP
WHERE DEPTNO = 10;
-- EMP 테이블의 14명의 사람을 ROWNUM 나누기 3으로 3명씩 팀 번호를 맞춰주기
SELECT ROWNUM, CEIL(ROWNUM/3) AS TEAMNO, ENAME
FROM EMP;

-- 날짜 함수

-- DATE 타입의 출력 포맷을 변경하는 방법 1 ( 코드 작성 )
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
-- YYYY ( 4자리 년도 ) RR ( 2자리년도 ) MM (월) DD(일)
-- HH24 ( 24시간형식) HH12(12시간형식) MI(분) SS(초)

-- DATE 타입의 출력 포맷을 변경하는 방법 2 ( 환경 설정 )
-- 상단의 도구 - 환경설정 - 데이터베이스 - NLS - 날짜형식 을 변경하면 된다

-- SYSDATE 란 ? 현재 날짜/시간을 알려주는 DUAL 테이블의 컬럼
SELECT SYSDATE
FROM DUAL;

-- 1. ADD_MONTHS() 함수 : 날짜 데이터에 숫자(달)을 더한다.
--      ADD_MONTHS(날짜데이터, 숫자)
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 4)
FROM DUAL;
-- EMP 테이블에서 고용일(HIREDATE)이 10주년되는 날을 사원이름과 고용일, 고용10주년으로 출력하여라
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120)
FROM EMP;
-- EMP 테이블에서 고용 40주년이 안된 사람의 이름과 고용일, 고용40주년을 출력하여라
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 480)
FROM EMP
WHERE ADD_MONTHS(HIREDATE, 480) > SYSDATE;

-- 2. MONTHS_BETWEEN() 함수 : 두 날짜데이터 사이의 개월 수를 출력
--      MONTHS_BETWEEN( 날짜데이터1, 날짜데이터2 ) : 날짜데이터1 - 날짜데이터2 의 개월 수
SELECT MONTHS_BETWEEN('25/09/01', '25/10/01')
FROM DUAL;
-- EMP 테이블에서 사원들이 현재까지 다닌 개월 수를 출력하여라
SELECT ENAME, HIREDATE, SYSDATE, FLOOR(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "다닌 개월 수"
FROM EMP;

-- 3. NEXT_DAY() 함수 : 돌아오는 요일의 날짜를 구하기
--      NEXT_DAY( 날짜데이터, 요일 )
--        요일 : 1 ( 일요일 ) ~ 7 ( 토요일 ) /  '월' ~ '일'
SELECT NEXT_DAY(SYSDATE, '월')
FROM DUAL;

-- 4. LAST_DAY()  함수 : 월의 마지막 날짜
--      LAST_DAY(날짜데이터)
SELECT LAST_DAY('25/10/01')
FROM DUAL;

-- 5. ROUND / TRUNC () 함수 : 반올림, 버림을 실행하는 함수
--      ROUND(날짜데이터 , 날짜포맷) / TRUNC(날짜데이터, 날짜포맷)
--      날짜포맷 
--          CC : 네자리 연도 끝 두자리를 기준으로 사용 ( 2000년대 기준으로 2050년을 기점으로 올리고 내리고)
--          YYYY : 해당 연을 기준으로 사용 ( 7월 1일을 기준으로 연을 올림, 내림)
--          MM, MONTH, MON : 해당 달을 기준으로 사용 ( 16일 기준으로 월을 올림, 내림)
--          WW : 해당 연도의 주를 기준 ( 1~53번째 주를 기준으로 연도를 올리거나 내림 )
--          W : 해당 월의 주를 기준 ( 1~5번째주를 기준으로 월을 올림, 내림)
--          DAY, D : 한 주가 시작되는 날짜를 기준으로 주를 올림, 내림
--          DDD : 해당 일의 정오(12:00:00)를 기준으로 일을 올림, 내림
--          HH, HH12, HH24 : 해당일의 시간의 분을 기준으로 시을 올림, 내림
--          MI : 해당일 시간의 초를 기준으로 분을 올림, 내림
SELECT SYSDATE,
       ROUND(SYSDATE, 'CC') AS FORMAT_CC,
       ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY,
       ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
       ROUND(SYSDATE, 'HH') AS FORMAT_HH,
       ROUND(SYSDATE, 'MI') AS FORMAT_MI
FROM DUAL;
SELECT SYSDATE,
       TRUNC(SYSDATE, 'CC') AS FORMAT_CC,
       TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY,
       TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD,
       TRUNC(SYSDATE, 'HH') AS FORMAT_HH,
       TRUNC(SYSDATE, 'MI') AS FORMAT_MI
FROM DUAL;


-- 형 변환 함수 : 자료형을 변경해주는 함수
-- 숫자 <-> 문자 <-> 날짜  

-- 1. TO_CHAR() 함수 : 숫자 데이터나 날짜 데이터를 문자열로 변경해준다.
-- 날짜 데이터를 문자열 데이터로 변경
--      TO_CHAR(날짜데이터, 날짜출력포맷)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD-HH24:MI:SS') AS 현재날짜시간
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS "현재시간",
       TO_CHAR(SYSDATE, 'CC') AS CC, -- 세기
       TO_CHAR(SYSDATE, 'YYYY') AS YYYY, -- 4자리의 년도
       TO_CHAR(SYSDATE, 'YY') AS YY, -- 4자리중 뒤 두자리의 년도 ( 2025년 -> 25 를 출력 )
       TO_CHAR(SYSDATE, 'MM') AS MM, -- 두 자리수의 월
       TO_CHAR(SYSDATE, 'MON') AS MON, -- 월의 약자 ( 1월, JAN )
       TO_CHAR(SYSDATE, 'MONTH') AS MONTH, -- 월의 풀네임 ( 1월, JANUARY )
       TO_CHAR(SYSDATE, 'DD') AS DD, -- 오늘의 일(DAY)자
       TO_CHAR(SYSDATE, 'DDD') AS DDD, -- 1년(365일) 중 오늘이 몇번째 날인가
       TO_CHAR(SYSDATE, 'DY') AS DY, -- 요일의 줄임말 
       TO_CHAR(SYSDATE, 'DAY') AS DAY, -- 요일의 풀네임
       TO_CHAR(SYSDATE, 'WW') AS WW, -- 1년의 52주 중 몇번째 주인가
       TO_CHAR(SYSDATE, 'W') AS W -- 이번 달 중 몇 번째 주
FROM DUAL;
-- 4자리년도-2자리월-2자리일-요일 의 형태로 문자열을 출력하라
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD-DY') FROM DUAL;
-- 원하는 형태를 한글을 추가해서 만들고 싶다면 ? "" 로 한글을 감싸주면된다.
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" DAY') FROM DUAL;
-- 날짜를 다른 언어로 출력하는 방법
--      TO_CHAR(날짜데이터, 날짜출력포맷, 'NLS_DATE_LANGUAGE=ENGLISH')
SELECT    TO_CHAR(SYSDATE, 'YYYY-MM-DD', 'NLS_DATE_LANGUAGE = ENGLISH') AS now,
      TO_CHAR(SYSDATE, 'CC', 'NLS_DATE_LANGUAGE = ENGLISH') AS CC,
      TO_CHAR(SYSDATE, 'YYYY', 'NLS_DATE_LANGUAGE = ENGLISH') AS YYYY,
      TO_CHAR(SYSDATE, 'YY', 'NLS_DATE_LANGUAGE = ENGLISH') AS YY,
      TO_CHAR(SYSDATE, 'MM', 'NLS_DATE_LANGUAGE = ENGLISH') AS MM,
      TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON,
      TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MONTH,
      TO_CHAR(SYSDATE, 'DD', 'NLS_DATE_LANGUAGE = ENGLISH') AS DD,
      TO_CHAR(SYSDATE, 'DDD', 'NLS_DATE_LANGUAGE = ENGLISH') AS DDD,
      TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DY,
      TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DAY,
      TO_CHAR(SYSDATE, 'WW', 'NLS_DATE_LANGUAGE = ENGLISH') AS WW,
      TO_CHAR(SYSDATE, 'W', 'NLS_DATE_LANGUAGE = ENGLISH') AS W
FROM DUAL;
-- 시간을 문자열로 변경
-- HH24 (24시간제) / HH12, HH (12시간제)
-- MI (분) / SS (초)
-- AM, PM, A.M. , P.M. (오전 / 오후 표시)
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
       TO_CHAR(SYSDATE, 'HH12:MI:SS PM') AS HH12MISS_PM,
       TO_CHAR(SYSDATE, 'HH:MI:SS A.M.') AS HHMISS_AM
FROM DUAL;

-- 숫자를 문자열로 변경할 때
SELECT SAL,
       TO_CHAR(SAL, '$999,999') AS SAL_$, -- 9 로 숫자를 적으면, 자릿를 반드시 채우지는 않는다.
       TO_CHAR(SAL, 'L999,999') AS SAL_L, -- L 은 현재 서버 나라의 지역(LOCALE) 단위 화폐 
       TO_CHAR(SAL, '999,999.00') AS SAL_1, -- 0 을 적으면 그 자리수까지 반드시 채운다.
       TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
       TO_CHAR(SAL, '000999999.99999') AS SAL_3, -- 소수점 이하는 0이든 9든 무조건 자리수를 채운다
       TO_CHAR(SAL, '999,999,00') AS SAL_4 -- , 는 내가 지정한 자리수를 표시
FROM EMP;

-- 문자를 숫자로 변경해주는 함수
-- TO_NUMBER(문자열데이터, 문자열에 맞는 숫자포맷)
SELECT TO_NUMBER('1,300.122','999,999.999')
FROM DUAL;
-- 형변환이 필요없을 때 ( 자동 형변환 가능 )
SELECT 1300-'1200'
FROM DUAL;
-- 형변환이 필요할 때
SELECT '1,300'-'1,200'
FROM DUAL;
SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,200','999,999')
FROM DUAL;

-- 문자를 날짜형식으로 변경
-- TO_DATE() 함수
--      TO_DATE(문자열, '날짜출력포맷')
SELECT '20241203',
       TO_DATE('20241203', 'YYYYMMDD') AS TODATE1,
       TO_DATE('2024-12-03', 'YYYY-MM-DD') AS TODATE2,
       TO_DATE('2024/12/03', 'YYYY/MM/DD') AS TODATE3
FROM DUAL;

-- 자료형 변환 함수를 배웠으니, 쿼리문 작성할 때 같은 자료형끼리 연산을 해주는게 좋다.
SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981-06-01', 'YYYY-MM-DD');

-- 일반함수 1. NVL 함수 - NULL 처리 함수
--      NVL( 데이터, 데이터가NULL이면출력할 데이터)
SELECT EMPNO, ENAME, SAL, NVL(COMM, 0)
FROM EMP;
-- EMP테이블에서 사원이름과 급여, 수당, 급여+수당을 출력하여라
SELECT ENAME, SAL, NVL(COMM,0), SAL+NVL(COMM, 0)
FROM EMP;

-- 일반함수 2. NVL2() 함수
--      NVL2(데이터, 데이터가 NULL이 아니면 출력할 데이터, 데이터가 NULL이면 출력할 데이터)
-- EMP 테이블에서 사원이름과 추가수당이 있으면 O를 입력하고, 없으면 X를 출력하라
SELECT ENAME, NVL2(COMM, 'O', 'X')
FROM EMP;
-- EMP 테이블에서 사원이름과 연봉을 출력하라 단, 연봉은 SAL*12 이며 추가수당이 있으면 연봉에 추가수당을 더한다.
SELECT ENAME, NVL2(COMM, SAL*12+COMM, SAL*12) AS "연봉"
FROM EMP;

-- 일반함수 3. DECODE() 함수 : 조건문 조건에 맞는 데이터를 출력한다.
-- DECODE( 기준이되는데이터,
--              1번데이터, 기준데이터가 1번데이터라면 출력할 데이터,
--              2번데이터, 기준데이터가 2번데이터라면 출력할 데이터,
--              DEFAULT데이터) AS 별칭

-- EMP 테이블에서 사원이름, 직책, 급여, 직책에 따른 인상급여를 출력할 것이다.
--      이 때 직책이 MANAGER 면 10%, SALESMAN이면 5%, ALALYST 면 동결 그 외에는 3%를 인상할 것이다.
SELECT ENAME, JOB, SAL,
       DECODE( JOB,
            'MANAGER', SAL*1.1,
            'SALESMAN', SAL*1.05,
            'ANALYST', SAL,
            SAL*1.03) AS UPSAL
FROM EMP;

-- 조건문 CASE-WHEN-THEN
-- CASE 기준데이터
--      WHEN 데이터1 THEN 데이터1이면 출력데이터
--      WHEN 데이터2 THEN 데이터2이면 출력데이터
--      ELSE 그외의데이터면 출력데이터
-- END AS 별칭

-- EMP 테이블에서 사원이름, 직책, 급여, 직책에 따른 인상급여를 출력할 것이다.
--      이 때 직책이 MANAGER 면 10%, SALESMAN이면 5%, ALALYST 면 동결 그 외에는 3%를 인상할 것이다.
SELECT EMPNO, ENAME, JOB, SAL,
        CASE JOB
            WHEN 'MANAGER' THEN SAL*1.1
            WHEN 'SALESMAN' THEN SAL*1.05
            WHEN 'ANALYST' THEN SAL
            ELSE SAL*1.03
        END AS UPSAL
FROM EMP;
-- CASE 문에서 기준데이터 없이 조건으로 사용하는 방법
-- EMP 테이블에서 추가수당(COMM)이 있으면 '수당:DATA' 출력, 0이면 '수당없음', NULL이면 '해당사항없음' 을 출력하여라
SELECT ENAME, COMM,
        CASE
            WHEN COMM IS NULL THEN '해당사항없음'
            WHEN COMM = 0 THEN '수당없음'
            WHEN COMM > 0 THEN '수당:'||COMM
        END AS "COMM_TEXT"
FROM EMP;
            
-- 1번문제 EMP 테이블에서 사원번호(EMPNO)와 사원이름(ENAME)을 출력한다.
--      1-1. 사원 이름의 길이가 5 인 사원 이름을 출력한다.
--      1-2. 사원번호 컬럼 옆에 MASKING_EMPNO 라는 컬럼을 출력한다. ( 뒤 두자리 숫자를 *로 출력 )
--      1-3. 사원이름 컬럼 옆에 MASKING_ENAME 라는 컬럼을 출력한다. ( 이름의 첫글자를 제외하고 모두 *로 출력)
SELECT EMPNO, RPAD(SUBSTR(EMPNO, 1,2),4,'*') AS "MASKING_EMPNO", 
       ENAME, RPAD(SUBSTR(ENAME, 1,1),5,'*') AS "MASKING_ENAME"
FROM EMP
WHERE LENGTH(ENAME) = 5;

SELECT EMPNO, REPLACE(EMPNO, SUBSTR(EMPNO, -2), '**') AS "MASKING_EMPNO",
       ENAME, REPLACE(ENAME, SUBSTR(ENAME, -4), '****') AS "MASKING_ENAME"
FROM EMP
WHERE LENGTH(ENAME) = 5;
            
-- 2번문제 EMP 테이블에서 사원들의 월 평균 근무 일수는 21.5일 입니다. 하루 근무 시간이 8시간으로 가정할 때
--        사원들의 하루 급여(DAY_PAY)와 시급(HOUR_PAY)를 계산하여 출력하여라
--        단, 하루 급여는 소수점 세번째자리에서 버리고, 시급은 소수점 두번째자리에서 반올림하라.
--        월급 - SAL 컬럼 / 일급 - 월급/21.5 / 시급 - 월급/21.5/8
SELECT EMPNO, ENAME, SAL, 
        TRUNC(SAL/21.5, 2) AS "일급", 
        ROUND(SAL/21.5/8, 1) AS "시급"
FROM EMP;

-- 3번문제 EMP테이블에서 사원들은 입사일(HIREDATE) 기준 3개윌 지난 후 첫 월요일에 정직원이된다.
--          사원번호와 사원이름, 입사일, 정직원이되는날(R_JOB), 추가수당(COMM)을 출력하여라
--          단, COMM이 없는 사원의 추가수당은 N/A 로 출력.
SELECT EMPNO, ENAME, HIREDATE,
        NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월') AS "R_JOB",
        NVL(TO_CHAR(COMM), 'N/A') AS "COMM"
FROM EMP;
            
-- 4번문제 EMP테이블의 모든 사원을 대상으로 직속 상관의 사원번호(MGR)를 아래와 같은 조건으로 변환해서 출력
--      MGR이 존재하지 않을 때 : 0000
--      MGR 앞 두자리가 75 이면 5555
--      MGR 앞 두자리가 76 이면 6666
--      MGR 앞 두자리가 77 이면 7777
--      MGR 앞 두자리가 78 이면 8888
--      그 외의 MGR 데이터면  : MGR 그대로 출력

-- CASE WHEN THEN
SELECT EMPNO, ENAME, MGR,
        CASE
            WHEN MGR IS NULL THEN '0000'
            WHEN SUBSTR(MGR, 1,2) = '75' THEN '5555'
            WHEN SUBSTR(MGR, 1,2) = '76' THEN '6666'
            WHEN SUBSTR(MGR, 1,2) = '77' THEN '7777'
            WHEN SUBSTR(MGR, 1,2) = '78' THEN '8888'
            ELSE TO_CHAR(MGR)
        END AS "CHG_MGR"
FROM EMP;

-- DECODE
SELECT EMPNO, ENAME, MGR,
        DECODE(SUBSTR(MGR, 1,2),
            NULL, '0000',
            '75', '5555',
            '76', '6666',
            '77', '7777',
            '78', '8888',
            MGR) AS "CHG_MGR"
FROM EMP;