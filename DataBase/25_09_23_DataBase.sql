-- 정규식 함수

-- 정규식이란 ? 문자열 패턴(모양)

-- 정규식 함수 ? 문자열 패턴(모양)에 맞는 데이터를 찾는다.

-- 정규식 함수에서 사용하는 기호
--  ^ : 문자열의 시작
--      ^abc -> abc로 시작하는 문자열 패턴을 조회
--  $ : 문자열의 끝
--      abc$ -> abc로 끝나는 문자열 패턴을 조회
--  . : 임의의 한 글자
--      a.b -> acb, a1b, a2b, azb 등등
--  * : 앞 패턴이 0번 이상 반복
--      ab* -> a, ab, abb, abbb, abbbb, abbc, abbcdef 등등
--  + : 앞 패턴이 1번 이상 반복
--      ab+ -> ab, abbb, abbbb 등등
--  ? : 앞 패턴이 0번 또는 1번
--      ab? -> a, ab
--  [] : 문자 집합에 해당하는 한 문자
--      gr[ae]y -> gray, grey
--  [^] : 문자 집합에 해당하지 않는 한 문자
--      [^0-9] -> 숫자가 아닌 문자
--  {N} : N번 반복
--      A{2} -> AA
--      [A-Z]{2} -> 영어 대문자가 연속으로 2개 나오는 패턴을 찾기
--  {N,} : N번 이상 반복
--      A{2,} -> AA, AAA, AAAA, AAAAA, ....
--  {N,M} : N번 이상 M번 이하 반복
--      A{2,4} -> AA, AAA, AAAA

-- 사용할 테이블 확인하기
select * from t_reg;
select * from t_reg2;

-- 1. REGEXP_LIKE 함수 : 특정 패턴과 매칭되는 결과를 조회

-- 예제 1. 영문자가 들어가 있는 행만 출력하기
--      소문자가 들어가 있는 행
select * from t_reg where regexp_like(text, '[a-z]');
select * from t_reg where regexp_like(text, '[[:lower:]]');
--      대문자가 들어가 있는 행
select * from t_reg where regexp_like(text, '[A-Z]');
select * from t_reg where regexp_like(text, '[[:upper:]]');
--      영어가 들어가 있는 행
select * from t_reg where regexp_like(text, '[a-zA-Z]');
select * from t_reg where regexp_like(text, '[[:alpha:]]');
--      숫자가 들어가 있는 행
select * from t_reg where regexp_like(text, '[0-9]');
select * from t_reg where regexp_like(text, '[[:digit:]]');
--      영어 + 숫자 들어가 있는 행
select * from t_reg where regexp_like(text, '[a-zA-Z0-9]');
select * from t_reg where regexp_like(text, '[[:alnum:]]');

-- 예제 2. 소문자로 시작하고 공백을 포함하는 경우
select * from t_reg where regexp_like(text, '[a-z] ');
select * from t_reg where regexp_like(text, '[a-z] [0-9]');
--      공백이 들어가 있는 데이터 찾기
select * from t_reg where regexp_like(text, '[[:space:]]');
-- 예제 3. 연속적인 글자 수를 지정하기
--      대문자가 연속으로 2개가 들어가는 패턴을 찾기
select * from t_reg where regexp_like(text, '[A-Z]{2}');
--      대문자가 연속으로 3개가 들어가는 패턴을 찾기
select * from t_reg where regexp_like(text, '[A-Z]{3}');
--      대문자가 연속으로 4개가 들어가는 패턴을 찾기
select * from t_reg where regexp_like(text, '[A-Z]{4}');

-- 예제 4. 특정 위치를 지정하여 조회하기
--      영어로 시작하는 데이터 찾기
select * from t_reg where regexp_like(text, '^[a-zA-Z]');
--      숫자 또는 영어 대문자로 시작하는 데이터 찾기
select * from t_reg where regexp_like(text, '^[0-9A-Z]');
--      영어로 끝나는 데이터 찾기
select * from t_reg where regexp_like(text, '[a-zA-Z]$');
--      영어로 시작하지 않는 데이터 찾기
select * from t_reg where regexp_like(text, '^[^a-zA-Z]');
--      영어 소문자로만 이루어져 있지 않는 데이터 찾기
select * from t_reg where regexp_like(text, '[^a-z]');
--      영어 소문자 자체가 없는 데이터 찾기
select * from t_reg where not regexp_like(text, '[a-z]'); 

-- 예제 5. 특수문자 찾기
select * from t_reg where regexp_like(text, '!');
--      기호로 지정되어있는 특수문자를 찾기( 앞에 역슬레시 써주기 )
select * from t_reg where regexp_like(text, '\?');
select * from t_reg where regexp_like(text, '\*');

-- 2. REGEXP_REPLACE 함수 : 특정 패턴의 문자열을 다른 문자열로 교체
--      인수를 총 6개 가짐( 필수 2개, 3번째부터는 생략 가능 )
--      필수 2개 인수 : 기반데이터, 특정패턴
--      3번째 인수 : 변경할 문자열 // 4번째 인수 : 위치
--      5번째 인수 : 몇 번째로 일치할 때
--      6번째 인수 : 옵션(c 대소문자구분, i 대소문자구분x )

-- 예제 1. 모든 숫자를 특수기호(*)로 변경하기
select text, regexp_replace(text, '[0-9]', '*') as "NO->*"
from t_reg;
-- 예제 2. 특정 패턴을 찾아서 패턴으로 변경하기
--      숫자를 찾아서 숫자 뒤에 -* 을 추가하기
--      패턴의 () 는 그룹화한다라는 뜻, 뒤에 \1 -> 1번그룹
select text, regexp_replace(text, '([0-9])', '\1-*') as "Add Char"
from t_reg;
--      .(dot)을 찾아서 삭제하기
select no, ip, regexp_replace(ip, '\.', '') from t_reg2;
--      .(dot)을 찾아서 / 변경하기
select no, ip, regexp_replace(ip, '\.', '/') from t_reg2;
--      .(dot)을 찾아서 첫 번째 .(dot)을 / 변경하기
select no, ip, regexp_replace(ip, '\.', '/', 1, 1) from t_reg2;
-- 예제 3. 데이터 가운데 공백이 여러개 있을 때 공백을 제거하는 방법
select regexp_replace('aaa bbb', '( ){2}', '') as "one",
       regexp_replace('aaa  bbb', '( ){2}', '') as "two",
       regexp_replace('aaa   bbb', '( ){2}', '') as "three"
from dual;
select regexp_replace('aaa bbb', '( ){2,}', '') as "one",
       regexp_replace('aaa  bbb', '( ){2,}', '') as "two",
       regexp_replace('aaa   bbb', '( ){2,}', '') as "three"
from dual;
-- 예제 4. 검색을 할 때 공백을 먼저 입력하고 할 경우에 공백 제거하고 찾기
select studno, name, id
from student
where lower(id) = lower(regexp_replace('   75   TRUE', '( ){1,}', ''));
-- 예제 5. 특정 문자열의 형태를 다른 형태로 변경하기
--      20250923 의 문자열을 날짜형태(yyyy-mm-dd)로 변경
select '20250923', 
       regexp_replace('20250923', '([0-9]{4})([0-9]{2})([0-9]{2})',
                        '\1-\2-\3') as "date format"
from dual;
--      01012341234 의 문자열을 휴대폰번호 형태로 변경
select '01012341234', 
        regexp_replace('01012341234', '([0-9]{3})([0-9]{4})([0-9]{4})',
                        '\1-\2-\3') as "phone format"
from dual;

-- 3. REGEXP_SUBSTR 함수 : 특정 패턴에서 주어진 문자를 추출하는 함수
--      인수 : 기반데이터, 추출할 패턴, (위치, 몇번째)
--              위치와 몇번째(3번째 4번째) 인수는 생략 가능
select regexp_substr('ABC *DEF $GHI %KJL @DEF #DF !FFF',
                        '[^ ]+[DEF]', 1, 1) as "substr"
from dual;
--  교수(professor) 테이블에서 홈페이지의 url만 출력하라
select name, hpage, 
       regexp_substr(hpage, '([[:alnum:]]+\.*){3,4}', 5, 1) as "url"
from professor
where hpage is not null;
select name, hpage,
        regexp_substr(hpage, '[^//]+', 1, 2) as "url"
from professor
where hpage is not null;
-- 교수 테이블에서 이메일 부분의 도메인만 조회하기
select name, email,
       regexp_substr(email, '[^@]+', 1, 1) as "id",
       regexp_substr(email, '[^@]+', 1, 2) as "domain"
from professor;
-- 'sys/oracle@racdb:1521:racdb' 의 문자열에서 oracle@racdb를 추출하라
select 'sys/oracle@racdb:1521:racdb',
        regexp_substr('sys/oracle@racdb:1521:racdb',
                        '[^/:]+', 1, 2) as "result"
from dual;

-- REGEXP_COUNT 함수 : 문자열의 지정한 패턴이 몇 개가 있는지 세주는 함수
--      대문자 A 가 몇 개 있는지 확인
select text, regexp_count(text, 'A')
from t_reg;
--      소문자 a 가 2번째 위치 이후 몇개 있는지 확인
select text, regexp_count(text, 'a', 2)
from t_reg;
--      a 가 대소문자 관계없이 몇개 있는 지 확인
select text, regexp_count(text, 'a', 1, 'i')
from t_reg;
--      연속으로 이루어진 a 찾기
select text, regexp_count(text, 'a{2}')
from t_reg;
--      소문자 갯수 세기
select text, regexp_count(text, '[a-z]')
from t_reg;

-- 정규식 함수를 사용해서 student 테이블에
-- name 컬럼을 성(first name) / 이름(last name)
-- jumin 컬럼을 13자리를 6자리 - 7자리 로 변경해서 출력
-- tel 컬럼을 지역번호, 전화번호 나눠서 출력
select regexp_substr(name, '[^ ]+', 1, 1) as "first name",
       regexp_substr(name, '[^ ]+', 1, 2) as "last name",
       regexp_replace(jumin, '([0-9]{6})([0-9]{7})', '\1-\2') as "jumin",
       regexp_substr(tel, '[^)]+', 1, 1) as "지역번호",
       regexp_substr(tel, '[^)]+', 1, 2) as "전화번호"
from student;

-- student 테이블에서 주민번호의 앞 6글자를 사용해서
--      19xx-xx-xx 의 형태로 나타내기
--      주민번호의 7번째 번호를 이용해서 1 이면 남자 2면 여자로 성별 출력하기
select
    regexp_replace(regexp_substr(jumin, '([0-9]{6})', 1, 1),
                        '([0-9]{2})([0-9]{2})([0-9]{2})',
                        '19\1-\2-\3') as "생년월일",
    regexp_substr(jumin, '([0-9])', 7, 1) as "7번째 숫자",
    case regexp_substr(jumin, '([0-9])', 7, 1)
        when '1' then '남자'
        when '2' then '여자'
    end as "성별"
from student;

-- 다중행(복수행) 함수
select * from emp;
-- 1. SUM() 함수 : 결과로 나온 row를 모두 더해서 출력한다.
select sal from emp;
select sum(sal) from emp;
--      SUM 함수의 중복제거하고 더하기
select sum(distinct sal), sum(sal) from emp;
--      Null 이 있는 row 같은 경우에는 Null을 무시하고, 데이터만 더한다.
select sum(comm) from emp;

-- 2. COUNT() 함수 : 쿼리 결과 row의 수
select count(*) from emp;
--  조건을 추가해서 count 하기
--      deptno가 30번인 근무자의 수를 구하기
select count(*) 
from emp
where deptno = 30;
--  중복 제거해서 count함수 사용하기
select count(distinct sal), count(sal)
from emp;
--  Count 함수도 Null 데이터는 계산하지 않는다.
select count(comm) from emp;
select count(comm) from emp where comm is null;

-- 3. MIN() / MAX() 함수 : 출력된 row의 최소값/최대값을 나타낸다.
select min(sal), max(sal) from emp;
--  조건을 추가해서 함수 사용하기
--      부서 번호가 10번인 사람들 중에서 최소 급여, 최대급여 나타내기
select min(sal), max(sal) from emp where deptno = 10;
--  날짜 데이터 기준 ( 오래된 날짜 - 최소 / 가까운 날짜 - 최대 )
select min(hiredate), max(hiredate) from emp;

-- 4. AVG() 함수 : 출력된 row의 평균값을 계산하여 출력
select avg(sal) from emp;
--      중복 제거
select avg(distinct sal) from emp;

-- 5. STDDEV() 함수 : 표준편차를 구하는 함수
-- 6. VARIANCE() 함수 : 분산을 구하는 함수
select stddev(sal), variance(sal) from emp;

-- GROUP BY 절 : 각각의 중복된 row를 그룹화 하는 구문이다.
select avg(sal) from emp where deptno = 10;
select avg(sal) from emp where deptno = 20;
select avg(sal) from emp where deptno = 30;

select avg(sal) from emp where deptno = 10
union all
select avg(sal) from emp where deptno = 20
union all
select avg(sal) from emp where deptno = 30;

select deptno, avg(sal)
from emp
group by deptno
order by deptno;
-- 기준이 되는 데이터가 2개 이상일 경우
--  부서번호, 직책의 평균 급여
select deptno, job, avg(sal)
from emp
group by deptno, job
order by deptno, job;
-- 그룹화할 때 주의해야할 사항
--  1. select 구문에서 다중행함수를 쓰지 않은 컬럼이 있으면, 
--      모두 그룹화해줘야한다.
select deptno, sum(sal)
from emp
group by deptno;
--  2. select 구문에 작성되는 컬럼을 group by 절에 적을때는
--      별칭은 안되며 컬럼 이름을 작성해야한다.
select deptno as "no", sum(sal)
from emp
group by deptno;

-- 문제 1. 각 부서별 가장 오래된 입사일과 가장 최근 입사일을 출력하세요.
select deptno, min(hiredate), max(hiredate)
from emp
group by deptno
order by deptno;

select deptno, hiredate
from emp
order by deptno, hiredate;
-- 문제 2. 각 직급별 사람의 수와 급여의 평균을 출력하시오.
select job, count(job), avg(sal)
from emp
group by job;
-- 문제 3. 사수의 직급번호(MGR)별 count를 출력하세요
--      단, 기록이 없으면 "없음"으로 count 한다.
select NVL(to_char(mgr), '없음'), count(NVL(to_char(mgr), '없음'))
from emp
group by NVL(to_char(mgr), '없음');
-- 문제 4. 각 부서-직급별 사원 이름의 두번째 자리에 A 또는 L이 들어가는 
--          사원의 수를 출력하세요.
select deptno, job, count(ename)
from emp
where ename like '_A%' -- 첫글자 상관없고 두번째글자 A 이후글자 상관없음
or ename like '_L%' -- 첫글자 상관없고 두번째글자 L 이후글자 상관없음
group by deptno, job;

-- 그룹화에 조건달기
--      조건이 없을 때
select deptno, job, avg(sal)
from emp
group by deptno, job
order by deptno, job;
--      평균 급여가 2000 이상인 부서-직업을 조회
select deptno, job, avg(sal)
from emp
group by deptno, job
having avg(sal) >= 2000
order by deptno, job;
-- ****** 그룹화 함수 조건을 where 절에 적으면 에러난다
-- ****** 그룹화 함수 조건은 having 절에 작성해야한다.

-- SQL Query 문의 메커니즘
--  1. 출력을 먼저 한다. ( SELECT FROM WHERE 구문 기준 )
--  2. 그룹화를 진행한다. ( GROUP BY 구문 )
--  3. 다중행(그룹화) 함수를 진행한다. ( COUNT, MAX, MIN, AVG, SUM 등등 )
--  4. 그룹화 조건을 확인 ( HAVING 구문 )
--  5. 나온 값을 기준으로 정렬한다. ( ORDER BY 구문 )
-- 구문 작성 순서
--  SELECT
--  FROM
--  WHERE
--  GROUP BY
--  HAVING
--  ORDER BY

-- HAVING 문제
-- STUDENT 테이블에서 TEL 컬럼을 이용하여 
--  각 지역 번호 별로 몇 명 있는지 출력(GROUP BY)
--  051 이 몇 명인지 출력하라(HAVING)
SELECT REGEXP_SUBSTR(TEL, '[^)]+', 1, 1) AS "지역번호",
        COUNT(REGEXP_SUBSTR(TEL, '[^)]+', 1, 1)) AS "지역번호 수"
FROM STUDENT
GROUP BY REGEXP_SUBSTR(TEL, '[^)]+', 1, 1)
HAVING REGEXP_SUBSTR(TEL, '[^)]+', 1, 1) = '051';



