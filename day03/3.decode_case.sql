-- DECODE 함수
-- 1 HR 2 sales 3 IT 4 marketing
SELECT EMP_ID
	 , EMP_NAME
	 , DEPT_ID
	 , SALARY
	 , DECODE(DEPT_ID, 
	 		  1, SALARY * 1.5, 
	 		  2, SALARY * 1.1, 
	 		  3, SALARY * 1.8, 
	 		  4, SALARY * 1.0) AS bonus
FROM EMPLOYEE;

-- CASE문 - DECODE가 함수라면, CASE는 IF와 같은 구문
-- DECODE는 오라클함수. 다른 DB에서는 CASE문 사용해야 함
SELECT EMP_ID
	 , EMP_NAME
	 , DEPT_ID
	 , SALARY
	 , CASE DEPT_ID
	 	WHEN 1 THEN SALARY * 1.5
	 	WHEN 2 THEN SALARY * 1.1
	 	WHEN 3 THEN SALARY * 1.8
	 	WHEN 4 THEN SALARY * 1.0
	 END AS bonus
FROM EMPLOYEE;