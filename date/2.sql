-- 정규식 함수

-- 정규식이란 ? 문자열 패턴(모양)

-- 정규식 함수 ? 문자열 패턴(모양)에 맞는 데이터를 찾는다.

-- 정규식 함수에서 사용하는 기호
-- ^ : 문자열의 시작
--     ^abc -> abc로 시작하는 문자열 패턴을 조회
-- $ : 문자열의 끝
--     abc$ -> abc로 끝나는 문자열 패턴을 조회
-- . : 임의의 한 글자
--     a.b -> acb, alb, a2b, azb 등등
-- * : 앞 패턴이 0번 이상 반복
--     ab* -> a, ab, abb, abbb, abbbb, abbc, abbcdef 등등 
-- + : 앞 패턴이 1번 이상 반복 
--     ab+ -> ab, abbb, abbbb 등등
-- ? : 앞 패턴이 0번 또는 1번
--     ab? -> a, ab
-- [] : 문자 집합에 해당하는 한 문자
--     gr[ae]y -> gray, grey
-- [^] : 문자 집합에 해당하지 않는 한 문자
--     [^0-9] -> 숫자가 아닌 문자
-- {N} : N번 반복
--     A{2} -> AA
--     [A-Z]{2} -> 영어 대문자가 연속으로 2개 나오는 패턴을 찾기
-- {N, } : N번 이상 반복
--     A{2,} -> AA, AAA, AAAA, AAAAA, ....
-- {N,M} : N번 이상 M번 이하 반복
--     A{2,4} -> AA, AAA, AAAA

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
-- 에제 3. 연속적인 글자 수를 지정하기

--      대문자 연속으로 2개 들어가는 패턴을 찾기
select * from t_reg where regexp_like(text, '[A-Z]{2}');
--      대문자 연속으로 3개 들어가는 패턴을 찾기
select * from t_reg where regexp_like(text, '[A-Z]{3}');
--      대문자가 연속으로 4개가 들어가는 패턴을 찾기
select * from t_reg where regexp_like(text, '[A-Z]{4}');

-- 예제 4. 특정 위치를 지정하여 데이터 찾기
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
--      영어 소문자 자체가 없는 데이트 찾기
select * from t_reg where not regexp_like(text, '[a-z]');

-- 예제 5. 특수문자 찾기
select * from t_reg where regexp_like(text, '!');
--      기호로 지정되어있는 특수문자를 찾기
select * from t_reg where regexp_like(text, '\?');
select * from t_reg where regexp_like(text, '\*');

-- 2. REGEXP_REPLACE 함수 : 특정 패턴의 문자열을 다른 문자열로 교체
--      인수를 총 6개 가짐( 필수 2개, 3번째부터는 생략 가능)
--      필수 2개 인수 : 기반데이터, 특정패턴
--      3번째 인수 : 변경할 문자열 // 4번째 인수 : 위치
--      5번째 인수 : 몇 번째로 일치할 때 //
--      6번쨰 인수 : 옵션(c 대소문자구분, i 대소문자구분x )

-- 예제 1. 모든 숫자를 특수기호(*)로 변경하기
select text, regexp_replace(text, '[0-9]', '*') as "NO->*"
from t_reg;
-- 예제 2. 특정 패턴을 찾아서 패턴으로 변경하기
--      숫자를 찾아서 숫자 뒤에 -* 을 추가하기
--      패턴의 () 는 그룹화한다는라는 뜻, 뒤에 \1 -> 1번그룹  
select text, regexp_replace(text, '([0-9])','\1-*') as " Add Char"
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
where lower(id) = lower(regexp_replace('     75    TRUE', '( ){1,}', ''));
-- 예제 5. 특정 문자열의 형태를 다른 형태로 변경하기
--      20250923 의 문자열을 날짜형태(yyyy-mm-dd)로 변경
select '20250923',
       regexp_replace('20250923', '([0-9]{4})([0-9]{2})([0-9]{2})',
                        '\1-\2-\3') as "date format"
from dual;
--      01012341234 의 문자열을 휴대폰번호 형태로 변경
select '01012341234',
        regexp_replace('01012341234', '([0-9]{3})([0-9]{4})([0-9]{4})',
                        '\1-\2-\3') as "phone number"
from dual;

-- 3. REGEXP_SUBSTR 함수 : 특정 패턴에서 주어진 문자를 추출하는 함수
--      인수 : 기반데이터, 추출할 패턴, (위치, 몇번째)
--             위치와 몇번째(3번째 4번째) 인수는 생략 가능
select regexp_substr('ABC *DEF $GHI %KJL @DEF #DF !FFF',
                        '[^ ]+[DEF]', 1, 1) as "substr"
from dual;
-- 교수(professor) 테이블에서 홈페이지의 url만 출력하라
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
-- name 컴러을 성(first name) / 이름(last name)
-- jumin 컬럼을 13자리를 6자리 - 7 자리로 변경해서 출력
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
--  SUM 함수의 중복제거하고 더하기
select sum(distinct sal), sum(sal) from emp;
--  Null 이 있는 row 같은 경우에는 Null을 무시하고, 데이터만 더한다.
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
--  Count 함수도 Null 데이터는 게산하지 않는다.
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
select deptno, min(hiredate) , max(hiredate)
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
-- 문제 3. 사수의 직급번호(MGR)별 count를 출력하세요.
--      단, 기록이 없으면 "없음"으로 count 한다.
select nvl(to_char(mgr), '없음'), count(nvl(to_char(mgr), '없음'))
from emp 
group by nvl(to_char(mgr), '없음');
-- 문제 4. 각 부서-직급별 사원 이름의 두번째 자리에 A 또는 
--        L이 들어가는 사원의 수를 출력하세요.
select deptno, job, count(ename)
from emp
where ename like '_A%' -- 첫글자 상관없고 두번째글자 A 이후글자 상관없음
or ename like '_L%' -- 첫글자 상관없고 두번째글자 L 이후글자 상관없음
group by deptno, job;

-- 그룹화에 조건달기
-- 조건이 없을 때
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
-- ****** 그룹화 함수 조건을 where 절에 적으면 에러난다. 
-- ****** 그룹화 함수 조건은 having 절에 작성해야한다.

-- SQL Query 문의 매커니즘
-- 1. 출력을 먼저 한다. ( SELECT FROM WHERE 구문 기준 )
-- 2. 그룹화를 진행한다. ( GROUP BY 구문 )
-- 3. 다중행(그룹화) 함수를 진행한다. ( COUNT, MAX, MIN, AVG, SUM 등등 )
-- 4. 그룹화 조건을 확인 ( HAVING 구문 )
-- 5. 나온 값을 기준으로 정렬한다. ( ORDER BY 구문 )
-- 구문 작성 순서
-- SELECT
-- FROM
-- WHERE 
-- GROUP BY
-- HAVING
-- ORDER BY

-- HAVING 문제
-- STUDENT 테이블에서 TEL 컬럼을 이용하여 
--  각 지역 번호 별로 몇 명 있는지 출력
--  051 이 몇 명인지 출력하라
select regexp_substr(tel, '[^)]+', 1, 1) as "지역번호", 
       count(regexp_substr(tel, '[^)]+', 1, 1)) as "지역번호"
from student
group by regexp_substr(tel, '[^)]+', 1, 1)
Having regexp_substr(tel, '[^)]+', 1, 1) = '051';

    

-- 그룹화 관련된 함수
-- 1. ROLLUP 함수 - 그룹화한 컬럼들의 수계를 나타내는 함수
--          N+1개의 그룹화가 이루어진다.
--          예를들어, DEPTNO, JOB 을 그룹화 했다면
--              DEPTNO, JOB 그룹 1개
--              DEPTNO 그룹 1개
--              전체 그룹 1개
-- 예제 ) 부서와 직업별 평균 급여 및 사원 수와 부서별 평균 급여와 사원수,
--         전체 사원의 평균 급여와 사원 수를 나타내시오.
--         1. 부서와 작업별 평균 급여 및 사원수
--         2. 부서별 평균 급여와 사원 수
--         3. 전체 사원의 평균 급여와 사원 수
select deptno, job, round(avg(sal),1) as "avg_sal",
       count(*) as "cnt_emp"
from emp
group by deptno, job
union all
select deptno, null job, round(avg(sal),1) as "avg_sal",
       count(*) as "cnt_emp"
from emp
group by deptno
union all
select null deptno, null job, round(avg(sal),1) as "avg_sal",
       count(*) as "cnt_emp"
from emp
order by deptno, job;
-- 위 코드를 ROLLUP으로 사용
--     N+1개의 그룹으로 소계를 낸다. 순서대로.
select deptno, job, round(avg(sal),1) as "avg_sal",
       count(*) as "cnt,emp"
from emp
group by rollup(deptno, job);
-- 예제 ) 교수(professor) 테이블에서 부서별(deptno), 직책별(position)
--       인원 수와 급여 한계, 부서별 인원수와 급여 합계,
--       전체 인원수와 급여합계를 나타내시오.
select deptno, position, count(*) as "cnt_prof", sum(pay) as "sum_pay"
from professor
group by rollup(deptno, position)
order by deptno;
-- 위의 쿼리문에서 직책별 소계만 보고싶다.
select deptno, position, count(*), sum(pay)
from professor
group by position, rollup(deptno);

-- 2. cube 함수 - 소계를 나타내는 함수
-- 예제 ) 부서별 평균 급여와 사원수, 직급별 평균 급여와 사원수, 직급별 평균 급여와 사원수,
--        부서-직급별 평균 급여와 사원수, 전체 평균급여와 사원수
select deptno, job, round(avg(sal),1), count(*)
from emp
group by deptno, job
union all
select deptno, null job, round(avg(sal),1), count(*)
from emp
group by deptno
union all
select null deptno, job, round(avg(sal),1), count(*)
from emp
group by job
union all
select null deptno, null job, round(avg(sal),1), count(*)
from emp
order by deptno, job;
-- cube 함수 : 2의 N제곱만큼 소계를 낸다. 모든 경우의 수.
select deptno, job, round(avg(sal),1), count(*)
from emp
group by cube(deptno, job)
order by deptno, job;

-- 기준 데이터 3개로 rollup 과 cube 실습
-- 1. rollup 의 경우
select deptno, job, mgr, count(*)
from emp
where ename not like 'king'
group by rollup(deptno, job, mgr);
-- 2. cube 경우
select deptno, job, mgr, count(*)
from emp
where ename not like 'king'
group by cube(deptno, job, mgr)
order by deptno, job, mgr;

-- 3. grouping sets 함수 : 소계가 아닌 여러가지를 그룹화할 때 깔끝하게 볼 수 있다.
-- 예제 ) 학년별 인원수와 전공별 인원수를 출력하라
select grade, deptno1 , count(*)
from student
group by grouping sets(grade, deptno1)
order by grade, deptno1;
-- 예제 )emp테이블에서 부서번호별 인원수와 직급별 인원수를 출력하라   
select deptno, job, count(*)
from emp
group by grouping sets(deptno, job)
order by deptno, job;
       
-- 4. listagg함수 : 그룹화의 내용을 연결시켜서 나타내는 함수
--      ***주의할점 : 출력되는 값이 4000byte가 넘어가면 오률를 발생
--      첫번째 인수 :컬럼의 데이터를 연결시켜 나타낼 때 사용하는 구분자
-- 예제 ) emp테이블에서 부서별 인원의 이름을 나타내어라
select deptno, listagg(ename, '-> ')
from emp
group by deptno
order by deptno;
--       emp테이블에서 부서별 인원의 이름을 순서대로 나타내어라
--           Listagg(컬럼, 구분자) within group(order by 정렬기준)
select deptno, listagg(ename, '->') within group(order by ename)
from emp
group by deptno
order by deptno;

-- 5. pivot 함수 : row 단위를 column 단위로 변경해준다.
select deptno, job, max(sal)
from emp
group by deptno, job
order by deptno, job;
-- 먼저, pivot을 사용하지 않고 작성하는 방법
select deptno,
       max(decode(job, 'CLERK', sal)) as clerk,
       max(decode(job, 'SALESMAN', sal)) as salesman,
       max(decode(job, 'PRESIDENT', sal)) as president,
       max(decode(job, 'MANAGER', sal)) as manager,
       max(decode(job, 'ANALYST', sal)) as analyst
from emp
group by deptno
order by deptno;
-- pivor 함수를 이용해서 만들어보기
select * from ( select deptno, job, sal from emp ) 
pivot ( max(sal) 
           for job in ('CLERK', 'SALESMAN', 
           'PRESIDENT', 'MANAGER', 'ANALYST')
)           
order by deptno;
-- row 가 job이 되고 column이 deptno 가 되게끔 변경       
select * from ( select deptno, job, sal from emp )     
pivot ( max(sal)
          for deptno in('10' as "10", '20' as "20" , '30' as "30")
          )
order by job;
-- CAL 테이블을 이용해서 달력 만들기       
select weekno, day, dayno from cal;
-- pivot 함수 사용 안하고 만들기
select weekno, 
        max(decode(DAY,'SUN',DAYNO)) as sun,
        max(decode(DAY,'MON',DAYNO)) as mon,
        max(decode(DAY,'TUE',DAYNO)) as tue,
        max(decode(DAY,'WED',DAYNO)) as wed,
        max(decode(DAY,'THU',DAYNO)) as thu,
        max(decode(DAY,'FRI',DAYNO)) as fri,
        max(decode(DAY,'SAT',DAYNO)) as sat
from cal
group by weekno
order by weekno;
--pivot 함수를 이용해서 만들어보기
select * from (select weekno, day, dayno from cal)
pivot (max(DAYNO) for DAY in ('SUN' as "SUN" , 'MON' as "MON", 
                      'TUE' as "TUE", 'WED' as "WED", 'THU' as "THU",
                      'FRI' as "FRI", 'SAT' as "SAT")
)
order by weekno;

-- 6. RANK 함수 : 순위를 출력해주는 함수
--  예제 )EMP테이블에서 SMITH 라는 이름이 이름순으로 했을 때 몇 번째 인지 나타내시오.
--      ** 주의 : RANK 안의 데이터와 ORDER BY 에 작성할 컬럼은 같아야한다.
select rank('SMITH') within group(order by ename) as "RANK"
from emp;
select ename from emp order by ename;
--  예제 ) 전체 순위를 확인하기
select ename, rank() over(order by ename desc) as "ENAME_RANK"
from emp;
--  예제 ) 전체 순위에서 그룹화 하기
select ename, deptno, sal, 
       rank() over(partition by deptno order by sal)
from emp;
       
--  7. DENSE_RANK 함수 : 순위를 출력해주는 함수
--       사용하는 방법은 위 RANK 함수와 동일
--       RANK와의 차이점 : 동일한 순위의 갯수를 쳐주지 않는다.
--                       공동 2위가 2명있다면  다음이 4등이 아니라 3등이다.
select empno, ename, sal,
       rank() over(order by sal desc) sal_rank,
       dense_rank() over(order by sal desc) sal_dense_rank
from emp;
       
-- 8. row_number 함수 : 순서를 매겨주는 함수
--       rank, dense_rank 와 사용법이 동일
--       차이점 : 데이터가 동일하더라도 지정된 ROW_ID를 이용해서 순위를 매김
select empno, ename, sal,
       rank() over(order by sal desc) sal_rank,
       dense_rank() over(order by sal desc) sal_dense_rank,
       row_number() over(order by sal desc) sal_row_number
from emp;      

-- rank 와 dense_rank, row_number 에 정렬기준을 여러 개 지정하기
select empno, ename, sal,
        rank() over(order by sal desc, empno) sal_rank,
        dense_rank() over(order by sal desc, empno) sal_dense,
        row_number() over(order by sal desc, empno) sal_row
from emp;

-- 9. sum() over 함수 : 누적된 총 합을 구한다.
-- 예제 ) 판매(panmae) 테이블에서 판매점코드(P_STORE)가 1000번인
--      지점의 날짜순으로 일별 매출과 누적 합을 구하여라.
select p_date, P_code, p_qty, p_total,
        sum(P_total) over(order by p_date) "TOTAL"
from panmae 
where p_store = 1000;
-- 예제 ) 판매 테이블에서 판매점코드가 1000번인 지점의 판매 내역을 
--         제품코드별로 분류한 후 판매일지, 제품코드, 판매량, 판매금액
--         누적판매금액을 출력하라.
select p_date, p_code, p_qty, p_total,
       sum(p_total) over(partition by p_code order by p_date) as "TOTAL"
from panmae
where p_store = 1000;

-- 1번 문제 ) EMP테이블에서 각 부서별 급여(SAL)의 평균, 최대, 최소 및 
--           부서 인원을 나타내어라.  
select deptno, trunc(avg(sal)), max(sal), min(sal), count(*)
from emp
group by deptno
order by deptno;

-- 2번 문제 ) EMP테이블에서 각 직책의 사원 수가 3명 이상인 직책과 사원수를
--          나타내어라.
select job, count(*)
from emp 
group by job
having count(*) >=3 ;

-- 문제 3. 사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 출력
select to_char(hiredate, 'YYYY') as hire_year,
       deptno, count(*) as cnt
from emp
group by to_char(hiredate, 'YYYY'), deptno
order by to_char(hiredate, 'YYYY');

-- 문제 4. 추가수당(comm)이 있는 사람과 없는 사람의 수를 출력.
select nvl2(comm, 'O', 'X') as "EXITST_COMM",
        count(*) as cnt
from emp
group by nvl2(comm, 'O', 'X');
-- 문제 5. 각 부서의 입사 연도별 사원수, 최고급여, 급여합, 평균급여를 출력
--       각 부서별 사원수, 최고급여, 급여합, 평균급여 출력
--       전체 사원수, 최고급여, 급여합, 평균급여 출력
--       위 3가지 사항을 한 쿼리로 출력하시오.
select deptno, to_char(hiredate, 'YYYY')as HIRE_YEAR,  
                        count(*) as cnt, max(sal) as MAX_SAL , sum(sal)
                        as SUM_SAL,  trunc(avg(sal),1) as AVG_SAL
from emp
group by rollup(deptno, to_char(hiredate, 'YYYY'));

-- 책p212 문제 5번. EMP테이블을 사용하여 직원들의 급여와 전체 급여의
--                    누적급여 금액을 출력하라. 단, 급여를 오름차순 정렬.
select deptno, ename, sal, sum(sal) over(order by sal) as "total"
from emp;
-- 책p213 문제 8번. 부서별로 급여 누적 합계가 나오도록 작성.
--                  단, 부서 번호로 오름차순 정렬       
select deptno, ename, sal, sum(sal) 
       over(partition by deptno order by sal, ename) as "total"
from emp;
-- 책p212. 6번문제. FRUIT 테이블을 참고해서 아래와 같이 만드세요.
select * from (select name, price from fruit)
pivot (max(price)
        for name in ('apple' as "apple", 'grape' as "grape",
                     'orange' as "orange")
);
-- 책p210. 2번문제
select birthday from student;
select substr(birthday, 6,2) as "BIR_MON" from student;
select * from (select substr(birthday, 6,2) as "BIR_MON" from student)
pivot ( count(BIR_MON)
       for bir_mon in ( '01' as "jan", '02' as "feb", '03' as "mar",
                        '04' as "apr", '05' as "may", '06' as "jun",
                        '07' as "jul", '08' as "aug", '09' as "sep",
                        '10' as "oct", '11' as "nov", '12' as "dec")
);
-- 책p210. 3번문제
select tel from student;
-- 지역번호 추출
select regexp_substr(tel, '[^)]+', 1, 1) as "LOCALNUM" from student;
-- PIVOT 을 사용해서 각 지역별 인원을 체크
select * from (select regexp_substr(tel, '[^)]+', 1, 1) as "LOCALNUM" from student)
pivot ( count (LOCALNUM) for LOCALNUM in ( '02' as "SEOUL" , '031' as "GYEONGGI",
                              '051' as "BUSAN", '052' as "ULSAN", '053' as "DAEGU",
                              '055' as "GYEONGNAM")
 );                             
       
-- JOIN : 수평적 결합으로 테이블 두 개를 합한다.
--      집합연산자를 사용했을 때는 수직적 결합
-- 1. 데카르트 곱(카테시안 곱 : CARTESIAN PRODUCT)
--      교차 조인 / 크로스 조인
--      - 조인에 대한 조건이 없을 때 모든 데이터를 조인함.
select *
from emp e, dept d
order by empno;

select * from emp;
select * from dept;

-- 2. 조인 조건을 달아주기. 
select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno -- join 조건
order by e.empno;

-- 3. 테이블에 별칭 달아주기
--      조인하는 테이블 중에 하나만 있는 컬럼명이라면 별칭(테이블명)을 작성하지 않아도 된다.
--      하지만, 각 컬럼에 모든 테이블명(별칭)을 다 작성해주는 것을 추천한다.
select e1.empno as "사원번호", e1.ename, e1.deptno, d1.dname
from emp e1, dept d1
where e1.deptno = d1.deptno -- join 조건
order by e1.empno;

-- tip) 보통 모든 select문에 * 작성하지 않고 모든 컬럼명을 나열하는 게 좋다.
--      -> 쿼리 결과문이 항상 똑같은 순서로 나오지는 않을 수도 있기 때문

-- JOIN 의 종류
-- 1. 등가 조인 : 조인의 조건이 ( = ) 조건으로 붙이는 조인
-- 2. 비등가 조인 : 조인의 조건이 ( >=, >, <=, < 등 ) 같다가 아닌 조건으로 붙이는 조인
-- 3. 셀프 조인 : 하나의 테이블을 조인
--      등가, 비등가, 셀프 조인은 inner join 이라고 한다.
--      inner join : 데이터가 있어야 출력하는 조인
-- 4. 외부 조인(outer join) : 데이터가 없어도 출력하는 조인

-- 등가 조인 
-- 예제 ) 각 사원들의 사원번호, 사원명, 부서번호, 부서명을 출력하여라.
--      사원 정보는 emp 테이블, 부서 정보는 dept 테이블을 사용

-- ORACLE JOIN 문법 ( ORACLE 문법 ) 
select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
order by e.empno;

-- ANSI JOIN 문법 ( 표준 문법 )
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d on ( e.deptno = d.deptno )
order by e.empno;

-- 예제 ) 각 학생들의 이름과 지도교수의 이름을 출력하세요.
--      학생 정보는 student 테이블 , 교수 정보는 professor 테이블을 사용
select * from student;
select * from professor;

-- ORACLE JOIN 문법
select s.name as "student_name", p.name as "professor_name"
from student s, professor p
where s.profno = p.profno;

-- ANSI JOIN 문법
select s.name as "student_name", p.name as "professor_name"
from student s join professor p on ( s.profno = p.profno );

-- 테이블 3개를 활용해서 조인하기
-- 예제 ) 학생 이름과 학과 이름과 지도교수 이름을 출력하여라
--  학생정보(student), 학과정보(department), 교수정보(professor)
select * from department;
-- ORACLE JOIN 문법
select s.name, d.dname, p.name
from student s, department d, professor p
where s.deptno1 = d.deptno
and   s.profno = p.profno;
-- ANSI JOIN 문법
-- 2개 이상의 테이블을 JOIN 할 때는 하나씩 이어서 JOIN - on 작성하면 된다.
select s.name, d.dname, p.name
from student s join department d on ( s.deptno1 = d.deptno )
               join professor p on ( s.profno = p.profno );
               
-- 조인 조건이 아닌 다른 조건이 있을 때
--  예제 ) 학생들 중 학과1의 번호가 101번인 학생들의 지도교수 이름을 출력
-- ORACLE JOIN 문법
select s.name, p.name
from student s, professor p
where s.profno = p.profno -- JOIN 조건
and s. deptno1 = 101; -- 일반 조건
-- ANSI JOIN 문법
select s.name, p.name
from student s join professor p on ( s.profno = p.profno )
where s.deptno1 = 101;
-- 일반 조건을 on 안에다가 작성해도 상관없다.
select s.name, p.name
from student s join professor p 
on ( s.profno = p.profno 
    and s.deptno1 = 101 );

-- 비등가 조인
-- 예제 ) 각 사원들의 급여와 그 급여의 등급을 출력하시오.
--      사원 정보(emp), 급여등급정보(salgrade)
select * from emp;
select * from salgrade;
-- ORACLE JOIN 문법
select e.ename, e.sal, s.grade
from emp e, salgrade s
--where e.sal >= s.losal and e.sal <= s.hisal
where e.sal between s.losal and s.hisal -- 위 주석 where절과 동일
order by e.sal;

-- ANSI JOIN 문법
select e.ename, e.sal, s.grade
from emp e join salgrade s ON ( e.sal between s.losal and s.hisal)
order by e.sal;
--      BETWEEN 사용X
select e.ename, e.sal, s.grade
from emp e join salgrade s
             on ( e.sal >= s.losal
                  and e.sal <= s.hisal );
                  
-- 예제 ) 고객별로 마일리지 포인트를 조회한 후 해당 마일리지 점수로 받을 수 있는
--         상품을 조회여라.
--         고객(customer), 상퓸(gift)
select * from customer;
select * from gift;
-- ORACLE JOIN 문법
select c.gname, c.point, g.gname
from customer c, gift g
where c.point >= g.g_start
and   c.point <= g.g_end;
-- ANSI JOIN 문법
select c.gname , c.point, g.gname
from customer c join gift g
                  on ( c.point >= g.g_start
                       and c.point <= g.g_end );
-- 테이블 3개를 활용해서 비등가 조인하기
-- 예제 ) 학생들의 이름과 학생들의 점수, 그 점수에 다른 등급을 출력
--      학생정보(student) 점수정보(score) 점수등급정보(hakjum)
select * from student;
select * from score;
select * from hakjum;
-- ORACLE JOIN 문법
select st.name, sc.total, h.grade
from student st, score sc, hakjum h
where st.studno = sc.studno
and   sc.total >= h.min_point
and   sc.total <= h.max_point;
-- ANSI JOIN 문법
select st.name, sc.total, h.grade
from student st join score sc on ( st.studno =sc.studno )
                join hakjum h on ( sc.total >= h.min_point
                                and sc.total <= h.max_point);
-- 셀프 조인 ( 자체 조인 ) 
--  예제 ) 사원들의 이름, 사원번호, 직속상관의 번호와 직속상관의 이름을 출력
--      사원테이블(emp)
select * from emp;
-- ORACLE JOIN 문법
select e1.empno , e1.ename , e1.mgr , e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno ;
-- ANSI JOIN 문법
select e1.empno , e1.ename , e1.mgr , e2.ename
from emp e1 join emp e2 on ( e1.mgr = e2.empno );

-- 외부조인 ( 아우터 조인 ) 
-- 외쪽 외부 조인(LEFT OUTER JOIN) / 오른쪽 외부 조인(RIGHT OUTER JOIN)
-- 외쪽 외부 조인
--  예제 ) 사원의 번호와 이름을 출력하고, 그 사원의 직속상관의 번호와 이름을 출력하라
--         직속상관의 번호가 없는 사원도 출력하라.
-- ORACLE JOIN 문법
select e1.empno , e1.ename , e1.mgr, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);
-- ANSI JOIN 문법
select e1.empno , e1.ename , e1.mgr, e2.ename
from emp e1 left outer join emp e2 on ( e1.mgr = e2.empno );

-- 오른쪽 외부 조인
--  예제 ) 사원의 번호와 이름을 출력하고, 그 사원의 직속상관의 번호와 이름을 출력하라
--         부하직원이 없는 사원도 출려하라.
-- ORACLE JOIN 문법
select e1.empno , e1.ename , e1.mgr, e2.ename
from emp e1, emp e2
where e1.mgr(+) = e2.empno;
-- ANSI JOIN 문법
select e1.empno , e1.ename , e1.mgr, e2.ename
from emp e1 right outer join emp e2 on ( e1.mgr = e2.empno );

-- 예제 ) 학생 이름과 지도 교수의 이름을 출력하세요
--      단, 지도교수가 없는 학생도 출력하여라.
select * from student;
select * from professor;
-- ORACLE JOIN 문법
select s.name, p.name
from student s, professor p
where s.profno = p.profno(+);
-- ANSI JOIN 문법
select s.name, p.name
from student s left outer join professor p on ( s.profno = p.profno );
-- 예제 ) 학생 이름과 지도 교수의 이름을 출력하세요
--      단, 지도학생이 없는 교수도 출력하여라.
-- ORACLE JOIN 문법
select s.name, p.name
from student s, professor p
where s.profno(+) = p.profno;
-- ANSI JOIN 문법
select s.name, p.name
from student s right outer join professor p on ( s.profno = p.profno );
                    
-- 양쪽 외부 조인
--  예제 ) 학생 이름과 지도교수 이름을 출력하여라
--       지도교수가 없는 학생과 지도학생이 없는 교수 모두 출력하여라.

-- ORACLE JOIN 문법 ( 따로 없다, 집한 연산자를 사용 )
select s.name, p.name
from student s, professor p
where s.profno = p.profno(+)
union
select s.name, p.name
from student s, professor p
where s.profno(+) = p.profno;
-- ANSI JOIN 문법
select s.name, p.name
from student s full outer join professor p 
                            on ( s.profno = p.profno );

-- ORACLE OUTER JOIN 에 대한 주의사항
--  1. where 절에 적히는 outer join 조건이 되는 모든 컬럼에 (+) 기호를 써야한다.
--  예제 ) 부서에 대한 정보를 모두 보여주고, 부서 번호가 '20'인 사원의 번호,이름,급여를 출력
--       기호를 작성하지 않았을 때
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal
from dept d, emp e
where d.deptno = e.deptno(+)
and e.deptno = 20;
--      기호를 작성했을 때
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal
from dept d, emp e
where d.deptno = e.deptno(+)
and e.deptno(+) = 20;

-- ANSI OUTER JOIN 주의사항
-- 1. 일반 조건과 조인 조건을 구분 해야한다.
--  예제 ) 직업이 CLERK 인 사원 정보를 출력하고 그중에 CHICAGO에 위치한 부서에 소속된
--         사원의 부서정보를 출력하라
--       사원정보 : 번호,이름,직업 // 부서정보 : 번호, 부서명 위치

--  구분 했을 때
select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
from emp e left outer join dept d
                        on ( e.deptno = d.deptno 
                            and d.loc = 'CHICAGO' )
where e.job = 'CLERK';
--  구분하지 않았을 때
select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
from emp e left outer join dept d
                        on ( e.deptno = d.deptno 
                            and d.loc = 'CHICAGO' 
                            and e.job = 'CLERK');
-- 모든 문제는 ANSI JOIN 문법과 ORACLE JOIN 문법 두 가지 방식으로 작성하라.

-- 1문제 ) 급여(SAL)가 2000 초과인 사원들의 부서 정보, 사원정보를 출력하라
--          부서정보(dept) : 부서번호(deptno), 부서이름(dname)
--          사원정보(emp) : 사원번호(empno), 사원이름(ename), 급여(sal)
select * from emp;  
select * from dept;

-- ORACLE JOIN 문법
select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e, dept d
where e.deptno = d.deptno
and e.sal > 2000;

-- ANSI JOIN 문법
select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e join dept d on( e.deptno = d.deptno)
where e.sal > 2000;

-- 2번문제 ) 각 부서별 번호와 이름, 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하라.
--          부서정보(dept) : 부서번호 (deptno), 부서이름(dname)
--          사원정보(emp) : 급여(sal)
select * from emp;  
select * from dept;

-- ORACLE JOIN 문법
select d.deptno, d.dname, trunc(avg(e.sal)) as "AVG_SAL",
       max(sal) as "MAX_SAL", min(sal) as"MIN_SAL",
       count(e.sal) as"CNT"
from emp e, dept d
where d.deptno = e.deptno
group by d.deptno, d.dname;

-- ANSI JOIN 문법
select d.deptno, d.dname, trunc(avg(e.sal)) as "AVG_SAL",
       max(sal) as "MAX_SAL", min(sal) as "MIN_SAL",
       count(e.sal) as "CNT"
from emp e join dept d on ( d.deptno = e.deptno )
group by d.deptno, d.dname;
       
-- 3번 문제 ) 모든 부서 정보와 사원정보를 출력하라
--           단, 부서번호, 사원이름 순으로 출력하라
--           부서정보(dept) : 부서번호(deptno) 부서명(dname)
--           사원정보(emp) : 사원번호(empno) 사원명(ename) 직책(job) 급여(sal)
select * from emp;  
select * from dept;

--ORACLE JOIN 문법
select d.deptno, e.ename, d.dname, e.empno, e.job, e.sal
from dept d, emp e
where d.deptno = e.deptno(+)
order by d.deptno, e.ename;

--ANSI JOIN 문법
select * from emp;
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from dept d left outer join emp e on( d.deptno = e.deptno )
order by d.deptno, e.ename;

-- 4번 문제 ) 학생 이름, 학과1 번호, 학과1 이름을 출력하시오
--           학생정보(student) : 이름 (name) 학과1번호(deptno1)
--           학생정보(department) : 학과이름(dname)
select * from student;
select * from department;

--ORACLE JOIN 문법
select s.name, s.deptno1, d.dname
from student s , department d
where s.deptno1 = d.deptno;

-- ANSI JOIN 문법
select s.name, s.deptno1 , d.dname
from student s join department d on (s.deptno1 = d.deptno);

-- 5번 문제 ) 현재 직급이 있는 사원의 이름과 직급, 현재연봉,
--           해당 직급의 하한 금액과 상한 금액을 출력하라.
--           사원정보(emp2) : 이름(name), 직급(position), 연봉(pay)
--           연봉정보(p_grade) : 직책(position) 하한금액(s_pay) 상한 금액(e_pay)
select * from emp2;
select * from p_grade;

--ORACLE JOIN 문법
select e.name, e.position, e.pay, p.position, p.s_pay, p.e_pay
from emp2 e, p_grade p
where p.position = e.position;

-- ANSI JOIN 문법      
select e.name, e.position, e.pay, p.position, p.s_pay, p.e_pay
from emp2 e join p_grade p on ( p.position = e.position );

-- 6번 문제 ) 사원의 이름과 나이, 현재 직급, 에상직급 출력
--           나이는 birthday 를 사용해서 현재 날짜와 계산 후 -12 를 한다.
--           출력은 나이순으로
--           사원정보 ( emp2 )
--           직급정보 ( p_grade ) : s_age, e_age를 이용해서 예상 직급을 나타낼 수 있다.
select * from emp2;
select * from p_grade;

--ORACLE JOIN 문법       
select e.name , trunc(months_between(sysdate, e.birthday)/12)-12 as "AGE",
       e.position as "curr_position", p.position as "be_position"
from emp2 e , p_grade p 
where trunc(months_between(sysdate, e.birthday)/12)-12 >= p.s_age
and   trunc(months_between(sysdate, e.birthday)/12)-12 <= p.e_age
order by AGE;

-- ANSI JOIN 문법    
select e.name , 
       trunc(months_between(sysdate, e.birthday)/12)-12 as "AGE",
       e.position as "curr_position", p.position as "be_position"    
from emp2 e join p_grade p
    on (trunc(months_between(sysdate, e.birthday)/12)-12 
            between p.s_age and p.e_age)
order by age;

-- 7번 문제 ) 고객이 자기 포인트보다 낮은 포인트의 상품 중 한 가지를 선택할 수 있다고 할 때,
--           Notebook 을 선택할 수 있는 고객의 이름과 포인트, 상품명을 출력하라.
--           고객정보(customer) : 이름(gname), 포인트(point)
--           상품정보(gift) : 최소포인트(g_start), 상품명(gname)
select * from gift;
select * from customer;  
            
--ORACLE JOIN 문법        
select c.gname as "cust_name", c.point as "point", g.gname as "gift_name"
from customer c, gift g
where c.point >= g.g_start
and g.gname like 'Notebook';
       
-- ANSI JOIN 문법       
select c.gname as "cust_name", c.point as "point", g.gname as "gift_name"
from customer c join gift g on (c.point >= g.g_start
                               and g.gname like 'Notebook');
                               
-- 8번 문제 ) 교수 테이블에서 교수의 번호, 이름, 입사일, 
--           자신보다 입사일이 빠른 사람 수를 출력
--           단, 자신보다 입사일이 빠른 사람수를 오름차순으로 출력
--           교수(professor) : 번호(profno), 이름(name), 입사일(hiredate)
select * from professor;

-- ORACLE JOIN 문법
select p1.profno, p1.name, p1.hiredate, count(p2.name) as "count"
from professor p1, professor p2
where p1.hiredate > p2.hiredate(+)
group by p1.profno, p1.name, p1.hiredate
order by count(p2.name);

-- ANSI JOIN 문법

-- 9번 문제 ) 모든 부서정보, 사원정보, 급여등급정보, 직속상관의 정보를 출력하라
--           단, 부서번호, 사원번호 순으로 출력
--           부서정보 ( dept ) : 부서번호, 부서이름
--           사원정보 ( emp ) : 사원번호, 사원이름, 급여, 직속상관번호(mgr)
--           급여등급정보 ( salgrade ) : 급여등급(salgrade)
--           직속상관의 정보( emp ) : 사원정보의 mgr 에 따른 직속상관이름(ename)
select * from dept;
select * from emp;
select * from salgrade;
select * from emp2;

-- ORACLE JOIN 문법
select d.deptno, d.dname, e1.empno, e1.ename,  e1.sal, s.grade, e1.mgr , e2.ename
from dept d, emp e1, salgrade s, emp e2
where e1.deptno(+) = d.deptno
and e1.sal between s.losal(+) and s.hisal(+)
and e1.mgr = e2.empno(+)
order by d.deptno, e1.empno;

-- ANSI JOIN 문법
select d.deptno, d.dname, e1.empno, e1.ename,  e1.sal, s.grade, e1.mgr , e2.ename      
from dept d left outer join emp e1 on ( e1.deptno = d.deptno )
            left outer join salgrade s on ( e1.sal >= s.losal 
                                              and e1.sal <= s.hisal )
            left outer join emp e2 on ( e1.mgr = e2.empno )
order by d.deptno, e1.empno;
       
-- 데이터베이스에서 언어 구분을 할 수가 있다.
-- 1. DQL(Data Auery Language) : Select를 이용한 데이터 조회
-- 2. DDL(Data Definition Language) : 객체 생성, 수정, 삭제
-- 3. DML(Data Manipulation Language) : 데이터를 입력, 수정, 삭제, 병합
-- 4. DCL(Data Control Language) : 사용자에게 권한 주기, 권한 뺏기
-- 5. TCL(Transaction Control Language) : 트랜잭션 관리

-- 데이터베이스에서 객체
-- 테이블, 인덱스, 뷰, 시퀀스, 동의어 등등
-- 위에 적힌 객체들을 생성(create), 수정(alter), 삭제(truncate, drop)
-- 현재 수업에서 테이블을 위주로 진행할 것이고, 나머지는 각자 수업 때 진행.

-- 생성하기 - CREATE
--  새로운 오브젝트(객체) 또는 스키마를 생성할 때 사용하는 명령어
--  1. 일반 테이블 생성하기
create table testTable( 
    no      number(4,2) ,
    name    varchar2(20) ,
    birth   date 
);
-- 설명
--      1. create 명령어를 사용해서 testTable이라는 이름의 Table을 생성
--      2. no 라는 컬럼을 숫자 데이터만 들어갈 수 있고, 전체 자리수는 4자리, 소수점은 2자리
--      3. name 이라는 컬럼은 문자(vatchar2)가 들어갈 수 있고, 최대 길이는 20byte다.
--      4. birth 라는 컬럼은 날짜(date) 데이터만 들어갈 수 있다.

--  2. 기본 값을 설정한 테이블 만들기
--      Default(기본값)를 사용해서 데이터를 삽입할 때, 값을 지정하지 않아도
--      기본 데이터를 넣는다.
create table testTable2(
    no      number(4,2)       default 0,
    name    varchar2(20)      default 'NO NAME',
    birth   date              default sysdate
);

insert into testtable2(no) values(1);

select * from testtable2;

-- 테이블 생성 시 주의사항
--       1. 테이블 이름은 반드시 문자로 시작해야한다.
--           숫자로는 시작할 수 없고, 포함은 가능하다.
--           특수기호도 사용가능하지만 _ 를 제외한 것은 추천하지 않는다.
--       2. 테이블 이름은 최대 30byte 까지 사용가능
--           한글로 테이블을 생성시에 주의해야함
--       3. 테이블 이름은 같은 사용자일 때 중복되어서는 안된다.
--           scott 라는 계정에 emp 테이블이 2개가 될 순 없다.
--           생성한 후에 동일한 이름으로 생성하면 "이미 존재하는 객체다." 라는 에러
--           다른 계정일 때는 동일한 이름이 가능하다.
--       4. 객체의 이름을 지을 때는 예약어(키워드)를 사용하지 않기를 권장.
--            테이블 이름으로 select나 from, where 과 같은 이름은 사용X

-- 임시 테이블 생성하기
--  임시 테이블이란 ? 테이블을 생성하지만, 일시적으로 테스트할 테이블을 말한다.
--           commit 이나 세션이 종료될 경우에 삭제된다.
--      commit 이란 ? 트랙잭션을 성공적으로 종료시킨다 라는 뜻의 명령어
--          트랙잭션 : 명령을 하는 기간
--       세션 이란? 사용자가 계정을 사용하는시간
create global temporary table temp_table(
    no      number(4,2),
    name    varchar2(20),   
    birth   date
);
insert into temp_table values(1, 'asdf', '2025-01-24');
-- 현재 세션에서는 보이지만 다른 세션에서는 확일할 수 없다.
select * from temp_table;

-- 테이블을 복사해서 새로운 테이블 만들기 ( CTAS 라고도 한다.)
create table dept_test
as select * from dept2;

select * from dept2;

select * from dept_test;

-- 테이블의 데이터말고 구조만 복사하기
create table dept_test2
as select * from dept2 where 1 = 2;

select * from dept2 where 1 = 2;

select * from dept_test2;

-- 객체 수정하기 ( ALTER )
--  테이블의 경우에는 컬럼을 추가, 삭제, 이름변경, 컬럼명 변경 등의 작업이 가능
--  테스트 테이블 만들기 dept2 테이블에서 dcode와 dname을 가져와서 만들 것이다.
create table dept_test3
as select dcode, dname from dept2;
--  테스트 테이블 확인
select * from dept_test3;

--  테이블에 새로운 컬럼을 추가하기
--      dept_test3 테이블에 LOCATION 컬럼을 추가한다.
alter table dept_test3
add (location varchar2(10));

select * from dept_test3;
--  기본값을 가진 새로운 컬럼 추가하기
alter table dept_test3
add (location2 varchar2(10) default 'SEOUL');

select * from dept_test3;
--  테이블의 컬럼 이름을 변경하기
--      dept_test3 테이블의 location2 컬럼의 이름을 LOC로 변경
alter table dept_test3
rename column location2 to loc;

select * from dept_test3;
--  테이블 이름 변경
rename dept_test3 to dept_test4;

select * from dept_test3; -- 이름이 변경되었기 때문에 에러뜸
select * from dept_test4; -- 기존의 dept_test3 테이블이 조회됨.

-- 테이블 컬럼의 크기를 변경하기
alter table dept_test4
modify ( loc varchar2(30) );

-- 다른 자료형으로 변경도 가능하다.
alter table dept_test4
modify ( location number(4,3));

-- 테이블 컬럼을 삭제하기
alter table dept_test4
drop column loc;

select * from dept_test4;

-- 테이블 삭제하기 ( TRUNCATE / DROP )
--  TRUNCATE : 테이블 내의 모든 내용이 삭제된다.
--  DROP : 객체 자체를 삭제한다.

truncate table dept_test4;
-- 데이터가 사라지고 테이블의 구조만이 남아있는 것을 확인 가능
select * from dept_test4;

drop table dept_test4;
-- 테이블 자체를 삭제했기 때문에 확인조차 불가능하다. ( 에러뜨는게 정상 )
select * from dept_test4;

-- 테이블을 수정하지 못하게 읽기전용으로 변경
--  테스트를 위한 테이블 만들기
create table readonly_table(
    no number(4,2),
    name varchar2(20)
);
--  데이터 넣기
insert into readonly_table values(1, 'aaa');
--  테이블 확인
select * from readonly_table;
--  테이블을 읽기전용으로 변경
alter table readonly_table read only;
--  읽기 전용으로 변경 후 데이터 넣기 ( DML 은 불가능 )
insert into readonly_table values(2, 'bbb'); -- 에러 출력
--  읽기 전용으로 변경 후 테이블 컬럼 수정 ( DDL 은 일부 허용한다 )
alter table readonly_table 
add ( tel number(12) default 111);

-- 읽기 전용인 테이블을 다시 읽기 쓰기 모드로 변경
alter table readonly_table read write;

-- 읽기 쓰기 모드에서 데이터 넣기
insert into readonly_table values(3, 'cccc', 1234);

-- 테이블에서 가상 컬럼을 설정하기
--  가상 컬럼이란 ? 다른 컬럼을 기준으로 게산해서 자동으로 만들어지는 컬럼
--  테스트 테이블 만들기
create table vt_test(
    COL1    number(5) ,
    COL2    number(5) ,
    COL3    number(5) generated always as (COL1+COL2)
);
--  테스트 테이블에 데이터넣기
insert into vt_test values(1,2,3);
 -- 위 쿼리문은 3번째 컬럼이 가상컬림이기에 에러출력
insert into vt_test values(1,2);
 -- 위 쿼리문은 컬럼이 3개이기 때문에 에러 출력
 
-- 데이터를 넣을 컬럼을 지정해서 데이터를 넣는다.
insert into vt_test(col1,col2) values(1,2);       

select * from vt_test;

-- 데이터를 수정했을 때 가상컬럼은 확인하기
update vt_test
set col1 = 5;
-- 가상컬럼은 실시간으로 데이터 변화에 작동한다.
select * from vt_test;

-- DATA DICTIONARY ( 데이터 사전 )
--  오라클 데이터베이스는 데이터베이스 운영에 관한 데이터를 테이블로 가지고 있다.
--  큰 틀로 나누게되면
--      1. 사용자 테이블 : 개발자가 직접 테이블을 만들고 관리하는 테이블
--      2. 데이터 사전 : 데이터베이스 운영에 필요한 정보
--          > 수정을 하면 안되기 때문에 직접 접근 x, 보기만 가능
--          > select구문으로 확인이 가능하다.
--          > 데이터 사전은 접두어를 통해서 용도를 알 수가 있다.
--              USER.XXXX : 현 사용자가 소유한 객체
--              ALL_XXXX : 현 사용자가 사용 가능한 모든 객체
--              DBA_XXXX : DB 관리를 위한 정보(sys, system만 열람 가능)
--              v$_XXXX : 데이터베이스의 성능 관련 정보

-- 전체 데이터 사전 조회하기
select * from dict;
select * from dictionary;

-- USER_ 접두어를 가진 데이터 사전 조회하기
select * from dict
where table_name like 'USER%';
     
-- 현 계정의 사용자 테이블 확인하기
select table_name, num_rows from user_tables;

-- ALL_ 접두어를 가진 데이터 사전 조회하기
select * from dict
where table_name like 'ALL%';

-- 현 계정의 사용자가 볼 수 있는 모든 테이블 확인하기
select owner, table_name from all_tables;

-- DBA_ 접두어를 가진 데이터 사전 ( sys, system 계정으로 확인 가능 )
select * from dict where table_name like 'DBA%';


       
       
       
       
       
       
       
       
       
       
   
       
       
       
       
       
       
       