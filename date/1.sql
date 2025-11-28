-- 오라클의 내장함수 
--      단일행 함수 : 쿼리 조회 결과의 하나의 행에게 함수를 적용하는 함수
--      복수행 함수 : 쿼리 조회 결과의 여러 행을 하나의 행으로 바꿔서 결과를 적용하는 함수

-- 문자 함수
-- 1. INITCAP () 함수 : 첫 글자만 대문자로 출력하고, 나머지는 전부 소문자로 출력
select ename, initcap (ename)
from emp
where deptno = 10;
-- 2. UPPER() 함수 : 적혀있는 모든 영문자를 대문자로 출력
select 'aaaaa', UPPER('aaaaa')
from dual;
-- 3. LOWER() 함수 : 적혀있는 모든 영문자를 소문자로 출력
select 'AAAAA', lower ('AAAAA')
from dual;
-- EMP 테이블에서 SCOTT 이라는 데이터를 찾으려고 할 떄 사용 가능
-- 사용자가 소문자로 적을지 대문자로 적을지 알 수 없기 때문에 UPPER 또는 LOWER로 일치 시켜준다.
select *
from emp
where upper(ename) like upper('scott');
-- 4. LENGTH() , LENGTHB() : 글자의 길이(바이트수)를 나타낸다.
-- 영어는 한 글자당 1BYTE 를 가지게 된다, 그래서 length 와 lengthb 값이 같다.
select ename, length(ename), lengthb(ename)
from emp
where deptno = 20;
-- 한글은 한 글자당 3BYTE를 가지게 된다, 그래서 legnth 와 lengthb 값이 다르다.
--      ** 한글이 3byte로 고정크기를 가지는 것은 아니다, 버전 또는 다른 DB를 사용하면 2byte 또는 3byte가 될 수 있다.
select '홍길동', length('홍길동'), lengthb('홍길동')
from dual;
-- 5. CONCAT() 함수 : 데이터 2개를 연결시켜주는 함수 ( || 와 동일한 기능 )
select ename, job, concat(ename,job)
from emp
where deptno = 10;
-- CONCAT() 함수를 이용해서 3개 이상의 연결 시킬 떄는 중첩해 사용해한다.
select ename, job, deptno, concat(concat(ename,job),deptno), ename || job || deptno
from emp
where deptno = 10;
-- 6. SUBSTR() 함수 : 문자열을 일부 추출하는 함수
--      substr(문자열 데이터, 시작위치) : 시작위치부터 끝까지 추출
--      substr(문자열 데이터, 시작위치, 추출길이) : 시작위치부터 추출 길이만큼 추출
--          ** 시작위치가 음수일 경우 마지막 위치부터 거슬러 올라간 위치에서 시작
select job, substr(job, 1, 2), substr(job, 3, 2), substr(job, 5)
from emp;
select substr('ABCDE', 3, 2), substr('ABCDE', -3, 2), substr('ABCDE', -4, 4)
from dual;
-- EMP테이블에서 JOB 데이터를 뒤에서 두 글자만 출력
select job, substr(job, -2), substr(job, length(job)-1)
from emp;

-- 7. INSTR() 함수 : 문자열 데이터에서 특정 글자의 위치를 찾아주는 함수
--      INSTR(문자열데이터, 찾을 특정 글자) : 문자열 데이터 중에서 첫번째로 나오는 특정 글자의 위치
--      INSTR(문자열데이터, 찾을 특정 글자, 시작 위치) : 문자열데이터 중에서 시작 위치 이후에 나오는 첫번째 특정글자의 위치
--      INSTR(문자열데이터, 찾을 특정 글자, 시작 위치, N번째) : 문자열데이터 중에서 시작 위치 이후에 나오는 N번째 특정글자의 위치
select ename, instr(ename, 'T')
from emp
where ename like('SCOTT');
select 'A-B-C-D', instr('A-B-C-D', '-', 3)
from dual;
select 'A-B-C-D', instr('A-B-C-D', '-', 3, 2)
from dual;

-- 8. LPAD() 함수 : 왼쪽에 특정글자를 채운다.
--      LPAD(문자열데이터, 자릿수, 특정문자) : 문자열데이터에 지정한 자릿수만큼 왼쪽에 특정문자를 채운다.
select 'AAAAA', LPAD('AAAAA', 10 , '*')
from dual;

-- 9. RPAD() 함수 : 오른쪽에 특정글자를 채운다.
--      RPAD(문자열데이터, 자릿수, 특정문자) : 문자열데이터에 지정한 자릿수만큼 왼쪽에 특정문자를 채운다
        select 'AAAAA', RPAD('AAAAA', 10 , '*')
        from dual;
        
-- 휴대폰 번호 또는 주민등록번호 마스킹(가릴 때)할 때 사용가능하다.
select '010-1234-1234' , rpad(substr('010-1234-1234',1,9), 13 ,'*') as rpad_phone,
'250917-1234567', rpad(substr('250917-1234567', 1,7), 14, '*') as rpad_jmno
from dual;

-- 10. ltrim() 함수 : 왼쪽에 있는 특징 문자를 삭제하는 함수
--      ltrim(문자열데이터, 제거할문자)
select ename, ltrim(ename, 'C')
from emp
where deptno = 10;
-- 11. rtrim() 함수 : 오른쪽에 있는 특정 문자를 삭제하는 함수
select ename, rtrim(ename, 'R')
from emp
where deptno = 10;

-- lpad, rpad, ltrim, rtrim 4개의 함수에 특정 문자를 지정하지 않으면, 기준은 공백이 된다.
select job lpad('111', 5), rpad('111',5), ltrim(' 111'), rtrim('111  ')
from dual;

-- 12. replace() 함수 : 문자열데이터의 일부를 다른 문자열로 교체
--      replace(문자열데이터, 문자1, 문자2) : 문자열데이터의 문자1을 문자2로 변경한다.
--      *** 문자2(*변경할 문자)를 지정하지 않으면 문자1(변경 당할 문자)는 삭제된다.
select '010-1234-5678', 
        replace('010-1234-5678','-',' ') as replace_1,
        replace('010-1234-5678', '-') as replace_2
from dual;

select ename, substr(ename, 2,2), replace(ename, substr(ename,2,2),'--')
from emp
where deptno = 20;

--문자 함수 문제
-- 1. EMP 테이블에서 사원 이름의 길이가 5 이상인 이름만 출력하라
select ename
from emp
where length(ename) >= 5;


-- 2. EMP 테이블에서 JOB 컬럼의 첫 자리 문자를 *로 대체하여 출력하라
select job, replace(job, substr(job,1,3), '***')
from emp;
select '*' || SUBSTR(JOB, 2) AS JOB
FROM EMP;


-- 3. EMP 테이블에서 ENAME의 마지막 5글자를 추출하고 그 문자열 안에서 A 를 @ 로 변경하여라.
select ename, substr(ename, -5), replace(substr(ename, -5), 'A', '@')
from emp
where length(ename) >= 5;

-- 숫자 함수

-- 1. ROUND() 함수 : 주어진 숫자를 반올림하는 함수
--      ROUND(숫자데이터, 올릴자리수)
select round(1234.5678) as round,
       round(1234.5678, 0) as round_0,
       round(1234.5678, 1) as round_1,
       round(1234.5678, 2) as round_2,
       round(1234.5678, -1) as round_minus1,
       round(1234.5678, -2) as round_minus2
from dual;

-- 2. TRUNC() 함수 : 자리수 이하를 절삭(버림)
--      TRUNC(숫자데이터, 자리수)
select trunc(1234.5678) as trunc,
       trunc(1234.5678, 0) as trunc_0,
       trunc(1234.5678, 1) as trunc_1,
       trunc(1234.5678, 2) as trunc_2,
       trunc(1234.5678, -1) as trunc_minus1,
       trunc(1234.5678, -2) as trunc_minus2
from dual;
--3. ceil() 함수 : 지정한 data와 가장 가까운 큰 정수를 찾는 함수
--    ceil(숫자데이터)
select ceil(3.14), ceil(-3.14)
from dual;
-- 4. floor() 함수 : 지정한 data와 가장 가까운 작은 정수를 찾는 함수
--     floor(숫자데이터)
select floor(3.14), floor(-3.14)
from dual;
-- 5. mod() 함수 : 지정한 data와 숫자를 나눈 나머지를 출력하는 함수
--      mod(숫자데이터, 나눌 숫자)
select mod(121, 10), mod(7, 4)
from dual;
-- 6. power() 함수 : 지정한 data를 n 제곱하여 나타내는 함수
--      power(숫자데이터, n)
select power(2, 3), power(11, 2)
from dual;

-- rownum - 쿼리문을 호출할 때 작성해놓은 순서 번호
--      ** order by 를 사용하면 쿼리문을 호출한 후에 정렬하기 때문에 rownum이 뒤죽박죽될 수 있다.
select rownum, ename
from emp
where deptno = 10;
-- emp 테이블의 14명의 사람을 rownum 나누기 3으로 3명씩 팀 번호를 맞춰주기
select rownum, ceil(rownum/3) as teamno, ename
from emp;

-- 날짜 함수
-- date 타입의 데이터를 출력하는 포멧 변경 1 ( 코드 작성 )
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
-- yyyy ( 4자리 년도 ) rr ( 2자리년도 ) mm (월) dd(일)
-- hh24 ( 24시간형식) hh12(12시간형식) mi(분) ss(초)
-- date 타입의 출력 포멧을 변경하는 방법 2 ( 환경 설정 )
-- 상단의 도구 - 한경설정 - 데이터베이스 - nls - 날짜형식 을 변경하면 된다
select sysdate
from dual;
-- sysdate 란 ? 현재 날짜/시간을 알려주는 dual 테이블의 컬럼
select sysdate
from dual;

-- 1. add_months() 함수 : 날짜 데이터에 숫자(달)을 더한다.
--      add_months(날짜데이터, 숫자)
select sysdate, add_months(sysdate, 4)
from dual;
-- emp 테이블에서 고용일(hiredate)이 10주년되는 날을 사원이름과 고용일, 고용10주년으로 출력하여라
select ename, hiredate, add_months(hiredate, 120)
from emp;
-- emp 테이블에서 고용 40주년이 안된 사람의 이름과 고용일, 고용40주년을 출력하여라
select ename, hiredate, add_months(hiredate, 480)
from emp
where add_months(hiredate, 480) > sysdate;

-- 2. months_between() 함수 : 두 날짜데이터 사이의 개월 수를 출력
--      months_between( 날짜데이터1, 날짜데이터2 ) : 날짜데이터1 - 날짜데이터2 의 개월 수
select months_between('25/9/01', '24/10/01')
from dual;
-- emp 테이블에서 사원들이 현재까지 다닌 개월 수를 출력하여라
select ename, hiredate, sysdate, floor (months_between(sysdate, hiredate)) as "다닌 개월 수"
from emp; 

-- 3. next_day() 함수 : 돌아오는 요일의 날짜를 구하기
--      next_day( 날짜데이터, 요일 )
--        요일 : 1 ( 일요일 ) ~ 7 ( 토요일 ) / '월' ~ '일' 
select next_day(sysdate,'월')
from dual;

-- 4. last_day() 함수 : 월의 마지막 날짜
--      last_day(날짜데이터)
select last_day('25/10/01')
from dual;

-- 5. round / trunc () 함수 : 반올림, 버림을 실행하는 함수
--      round(날짜데이터, 날짜포맷) trunc(날짜데이터, 날짜포맷)
--      날짜포맷 
--         CC : 네자리 연도 끝 두자리를 기준으로 사용 ( 2000년대 기준으로 2050년을 기점으로 올리고 내리고)
--         YYYY : 해당 연을 기준으로 사용 ( 7월 1일을 기준으로 연을 올림, 내림)
--         MM, month, mon : 해당 답을 기준으로 사용 (16일 기준으로 월을 올림, 내림)
--         WW : 해당 연도의 주를 기준 (1~53번째 주를 기준으로 연도를 올리거나 내림)
--         W : 해당 월의 주를 기준 (1~5번째주를 기준으로 월을 올림, 내림
--         DAY,D 한 주가 시작되는 날찌를 기준으로 주를 올림, 내림
--         DDD : 해당 월의 정오(12:00:00)를 기준으로 올림, 내림
--         HH, HH12, HH24 : 해당일의 시간을 기준으로 일을 올림, 내림
--         mi : 해당일 시간의 분을 기준으로 시간을 올림, 내림
select sysdate,
       round(sysdate, 'cc') as format_cc,
       round(sysdate, 'yyyy') as format_yyyy,
       round(sysdate, 'ddd') as format_ddd,
       round(sysdate, 'hh') as format_hh,
       round(sysdate, 'mi') as format_mi
from dual;
 
 select sysdate,
       trunc(sysdate, 'cc') as format_cc,
       trunc(sysdate, 'yyyy') as format_yyyy,
       trunc(sysdate, 'ddd') as format_ddd,
       trunc(sysdate, 'hh') as format_hh,
       trunc(sysdate, 'mi') as format_mi
from dual;


-- 형 변환 함수 : 자료형을 변경해주는 함수
-- 숫자 <-> 문자 <-> 날짜

-- 1. to_char() 함수 : 숫자 데이터나 날짜 데이터를 문자열로 변경해준다.
-- 날짜 데이터를 문자열 데이터로 변경
--      to_char(날짜데이터, 날짜출력포맷)
select to_char(sysdate, 'yyyy/mm/dd-hh24:mi:ss') as 현재날짜시간
from dual;
select to_char(sysdate, 'YYYY-MM-DD') as "현재시간",
       to_char(sysdate, 'CC') as CC, -- 세기
       to_char(sysdate, 'YYYY') as YYYY, -- 4자리의 년도
       to_char(sysdate, 'YY') as YY, -- 4자리중 뒤 두자리의 년도 ( 2025년 -> 25 를 출력)
       to_char(sysdate, 'MM') as MM, -- 두 자리수의 월
       to_char(sysdate, 'MON') as MON, -- 월의 약자 ( 1월, JAN )
       to_char(sysdate, 'MONTH') as MONTH, -- 월의 풀네임( 1월, JANUARY )
       to_char(sysdate, 'DD') as DD, -- 오늘의 일자
       to_char(sysdate, 'DDD') as DDD, -- 1년(365일) 중 오늘이 몇번째 날인가
       to_char(sysdate, 'DY') as DY, -- 요일의 줄임말 
       to_char(sysdate, 'DAY') as DAY, -- 요일의 풀네임 
       to_char(sysdate, 'WW') as WW, -- 1년의 52주 중 몇번째 주인가
       to_char(sysdate, 'W') as W -- 이번 달 중 몇 번째 주
from dual;
-- 4자리년도-2자리월--2자리일-요일 의 형태로 문자열을 출력하라
select to_char(sysdate, 'YYYY-MM-DD-DY') from dual;
-- 원하는 형태를 한글을 추가해서 만들고 싶다면 ? "" 로 한글을 감싸주면된다.
select to_char(sysdate, 'YYYY"년" MM"월" DD"일" DAY') from dual;
-- 날짜를 다른 언어로 출력하는 방법
--      to_char(날짜데이터, 날짜출력포맷, 'NLS_DATE_LANGUAGE=ENGLISH')
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
-- HH24 (24시간제) / HH!2, HH (12시간제)
-- MI (분) / SS (초)
-- AM, PM, A.M., P.M. (오전 / 오후 표시)
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
       TO_CHAR(SYSDATE, 'HH12:MI:SS PM') AS HH12MISS_PM,
       TO_CHAR(SYSDATE, 'HH:MI:SS A.M.') AS HHMISS_AM
FROM DUAL;

-- 숫자를 문자열로 변경할 때
SELECT SAL,
       TO_CHAR(SAL, '$999,999') AS SAL_$, -- 9 로 숫자를 적으면, 자리수를 반드시 채우지는 않는다.
       TO_CHAR(SAL,'L999,999') AS SAL_L, -- L 은 현재 서버나라의 지역(LOCALE) 단위 화폐
       TO_CHAR(SAL,'999,999.00') AS SAL_1, -- 0 을 적으면 그 자리수까지 반드시 채운다.
       TO_CHAR(SAL,'000,999,999.00') AS SAL_2, 
       TO_CHAR(SAL, '000999999.99999') AS SAL_3, -- 소수점 이하는 0이든 9든 무조건 자리수를 채운다
       TO_CHAR(SAL, '999,999,00') AS SAL_4 -- , 는 내가 지정한 자리수를 표시
       FROM EMP;
       
-- 문자를 숫자로 변경해주는 함소
--TO_NUMBER()
SELECT TO_NUMBER('1,300.122','999,999.999')
FROM duAL;
-- 형변환이 필요없을 떄
SELECT 1300-'1200'
from dual;
-- 형변환이 필요할 떄
select '1,300'-'1,200'
FROM DUAL;
SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,200','999,999')
FROM DUAL;

-- 문자를 날짜형식으로 변경
-- TO_DATE() 형식
--      TO_DATE(문자열, '날짜출력포맷')
SELECT '20241203',
       TO_DATE('20241203', 'YYYY-MM-DD') AS TODATE1,
       TO_DATE('2024-12-03', 'YYYY-MM-DD') AS TODATE2,
       TO_DATE('2024/12/03', 'YYYY/MM/DD') AS TODATE3
FROM DUAL;

-- 자료형 변환 함수를 배웠으니, 쿼리문 작성할 때 같은 자료형끼리 연산을 해주는게 좋다.
SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE( '1981-06-01', 'YYYY-MM-DD');

-- 일반함수 1. NVL 함수 - NULL 처리 함수
--     NVL( 데이터, 데이터가 NULL이면 출력 데이터)
SELECT EMPNO, ENAME, SAL, NVL(COMM, 0)
FROM EMP; 
-- EMP테이블에서 사원이름과 급여, 수당, 급여+수당을 출력하여라
SELECT ENAME, SAL, NVL(COMM, 0),SAL+NVL(COMM,0)
FROM EMP;

-- 일반함수 2. NVL2() 함수
--     NVL2(데이터, 데이터가 NULL이 아니면 출력할 데이터, 데이터가 NULL이면 출력할 데이터)
--EMP 테이블에서  사원이름과 추가수당이 있으면 O를 입력하고, 없으면 X를 출력하라.
SELECT ENAME, NVL2(COMM, '0','X')
FROM EMP;
-- EMP 테이블에서 사원이름과 연봉을 출력하라 단, 연봉은 SAL*12 이며 추가 수당이 있으면 연봉에 추가수당을 더한다.
SELECT ENAME, SAL*12+NVL(COMM,0) AS"연봉"
FROM EMP;
SELECT ENAME, NVL2(COMM, SAL*12+COMM,SAL*12) AS"연봉"
FROM EMP;

-- 일반함수 3. DECODE() 함수 : 조건문 조건에 맞는 데이터를 출력한다.
-- DECODE( 기준이되는데이터,
--            1번데이터, 기준데이터가 1번데이터라면 출력할 데이터,
--            2번데이터, 기준데이터가 2번데이터라면 출력할 데이터,
--            DEFAULT데이터) AS 별칭

-- EMP 테이블에서 사원이름, 직책, 급여, 직책에 따른 인상급여를 출력할 것이다.
--      이 때 직책이 MANAGER 면 10%, SALESMAN이면 5%, ALALYST 면 동결 그 외에는 3퍼를 인상할 것이다.
SELECT ENAME, JOB, SAL,
       DECODE( JOB,
            'MANAGER', SAL*1.1,
            'SALESMAN', SAL*1.05,
            'ALALYST', SAL,
            SAL*1.03) AS UPSAL
FROM EMP;

-- 조건문 CASE-WHEN-THEN 
-- CASE 기준데이터
--      WHEN 데이터1 THEN 데이터1이면 출력데이터
--      WHEN 데이터2 THEM 데이터2이면 출력데이터
--      ELSE 그외의데이터면 출력데이터
-- END AS 별칭

-- EMP 테이블에서 사원이름, 직책, 급여, 직책에 따른 인상급여를 출력할 것이다.
--      이 때 직책이 MANAGER 면 10%, SALESMAN이면 5%, ALALYST 면 동결 그 외에는 3퍼를 인상할 것이다.
SELECT EMPNO, ENAME, JOB, SAL,
        CASE JOB
            WHEN 'MANAGER' THEN SAL*1.1
            WHEN 'SALESMAN' THEN  SAL*1.05
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
--     1-1. 사원 이름의 길이가 5 인 사원 이름을 출력한다.
--     1-2. 사원번호 컬럼 옆에 MASKING_EMPNO 라는 컬럼을 출력한다. ( 뒤 두자리 숫자를 *로 출력)
--     1-3. 사원이름 컬럼 옆에 MASKING_ENAME 라는 컬럼을 출력한다. ( 이름의 첫글자를 제외하고 모두 *로 출력)

SELECT EMPNO,RPAD (SUBSTR(EMPNO,1,2),4,'*') AS "MASKING_EMPNO",
       ENAME,RPAD (SUBSTR(ENAME,1,1),5,'*') AS "MASKING_ENAME"
FROM EMP
WHERE LENGTH(ENAME) = 5;

SELECT EMPNO, REPLACE(EMPNO, SUBSTR(EMPNO, -2), '**') AS "MASKING_EMPNO",
       ENAME, REPLACE(ENAME, SUBSTR(ENAME, -4), '****') AS "MASKING_ENAME"
FROM EMP
WHERE LENGTH(ENAME) = 5;

-- 2번문제 EMP 테이블에서 사원들의 월 평균 근무 일수는 21.5일 입니다. 하루 근무 시간이 8시간으로 가정할 때
--        사원들의 하루 급여(DAY_PAY)와 시급(HOUR_PAY)를 계산하여 출력하여라
--        단, 하루 급여는 소수점 세번째자리에서 버리고, 시급은 소수점 두번째자리에서 반올림 하라.
--        월급 - SAL 컬럼  / 일급 - 월급/21.5 / 시급 -월급/21.5/8
SELECT EMPNO, ENAME, SAL, 
        TRUNC(SAL/21.5, 2) AS"일급", 
        ROUND( SAL/21.5/8, 1) AS"시급"
FROM EMP;
 
-- 3번문제 EMP테이블에서 사원들은 입사일(HIREDATE) 기준 3개월 지난 후 첫 월요일에 정직원이된다.
--          사원번호와 사원이름, 입사일, 정직원이되는날(R_JOB), 추가수당(COMM)을 출력하여라
--          단, COMM이 없는 사원의 추가수당은 N/A로 출력. AVL
SELECT EMPNO, ENAME, HIREDATE,
      NEXT_DAY( ADD_MONTHS(HIREDATE, 3), '월')AS "R_JOB",
        NVL(TO_CHAR(COMM),'N/A') AS "COMM"
FROM EMP;

-- 4번문제 EMP테이블의 모든 사원을 대상으로 직속 상관의 사원번호(MGR)를 아래와 같은 조건으로 변환해서 출력
--     MGR이 존재하지 않을 때 : 0000
--     MGR 앞 두자리가 75이면 5555
--     MGR 앞 두자리가 76이면 6666
--     MGR 앞 두자리가 77이면 7777
--     MGR 앞 두자리가 78이면 8888
--     그 외의 MGR 데이터면 : MGR 그대로 출력

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
       DECODE(SUBSTR(MGR,1,2),
       NULL, '0000',
       '75', '5555',
       '76', '6666',
       '77', '7777',
       '78', '8888',
       MGR) AS " CHG_MGR"
FROM EMP;
      
           