-- 날짜출력
-- alias를 선언할 때는 그냥 "" 안에 쓰는게 나음
SELECT sysdate AS now
	 , sysdate-1 AS "내일 날짜"
	 , sysdate+1 AS tomorrow
FROM  dual;

-- 달을 증가시키는 함수
SELECT sysdate AS "current"
	 , ADD_MONTHS(sysdate, -1) AS "1monthago"
FROM dual;

-- 입사 10주년이 되는 사원 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE
	 , ADD_MONTHS(HIRE_DATE, 120) AS "Anniversal10Years"
FROM EMPLOYEE;

-- 두 날짜간의 개월 수 차이
-- 우리회사 가장 입사한지 오래된 직원과 가장 최근 입사한 직원 사이 개월 수
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
	 , MONTHS_BETWEEN(MAX(HIRE_DATE), MIN(HIRE_DATE)) AS "OldestbetwNewest"
FROM EMPLOYEE;

-- 돌아오는 요일, 달의 마지막 날짜 구하기
SELECT sysdate
	 , NEXT_DAY(sysdate, '금요일')
	 , LAST_DAY(ADD_MONTHS(sysdate, -1))
FROM dual;

-- sysdate보다 current_date(세션타임)로 현재 시각
SELECT CURRENT_DATE FROM dual;

/* 형변환 */
SELECT EMP_ID, EMP_NAME, EMP_ID + '500'
FROM EMPLOYEE;

SELECT 'EMP' + EMP_ID, EMP_NAME
FROM EMPLOYEE;

-- TO_CHAR() - 날짜, 숫자 데이터를 문자 데이터로 변환
SELECT TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24:MI:SS') AS "현재일시"
FROM dual;

SELECT TO_CHAR(SALARY, '$999,999') AS "SAL_$"
	 , TO_CHAR(SALARY, 'L999,999') AS "SAL_L" -- 지역회폐단위
	 , TO_CHAR(SALARY, '999,999.00') AS "SAL_1" -- 소수점 표현
FROM EMPLOYEE;

-- TO_NUMBER() 문자 데이터를 숫자 데이터로
SELECT 1300 + '1500'
FROM dual;

SELECT '1,300' + '1,500' -- 1000단위 쉼표가 포함된 문자열은 자동 형변환X
FROM dual;

-- 1000단위 쉼표가 표현된 문자 데이터면 숫자포맷을 사용, 숫자로 형변환해줘야
SELECT TO_NUMBER('1,300', '999,999') + TO_NUMBER('1,500', '999,999') -- 1000단위 쉼표가 포함된 문자열은 자동 형변환X
FROM dual;

-- TO_DATE() 문자형식으로 된 날짜데이터를 날짜형으로 변경
SELECT TO_DATE('2026-03-03') AS TODATE1
	 , TO_DATE('2026-03-03', 'YYYY-MM-DD') AS TODATE2
	 , TO_CHAR(TO_DATE('2026-03-03', 'YYYY-MM-DD'), 'YYYY-MM-DD') AS TODATE3
FROM dual;
