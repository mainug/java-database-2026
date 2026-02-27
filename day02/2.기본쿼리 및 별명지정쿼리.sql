-- 품목 전체 열 조회 1
SELECT *
FROM PRODUCT;

-- 품목 전체 열 조회 2
SELECT prod_id, prod_name, price FROM PRODUCT;

-- 품목 열 이름을 변경, 별명
-- alias1
SELECT prod_id AS "품목아이디"
	, prod_name AS "품목명"
	, price AS "가격"
FROM PRODUCT;

-- alias2 - AS 키워드 생략
SELECT prod_id "품목아이디"
	, prod_name "품목명"
	, price "가격"
FROM PRODUCT;

-- alias3 - 테이블명을 동일하게 쓰면 테이블명. 으로 컬럼을 지정해도 되고 안해도 됨
SELECT PRODUCT.prod_id "품목아이디"
	, PRODUCT.prod_name "품목명"
	, price "가격"
FROM PRODUCT;

-- alias4 - 테이블명에 별명을 지정하면, 컬럼명 사용시 반드시 별명. 으로 사용해야 함
SELECT prd.prod_id "품목아이디"
	, prd.prod_name "품목명"
	, prd.price "가격"
FROM PRODUCT prd;

-- alias5 -
SELECT EMP_ID
	, EMP_NAME
	, SALARY 
	, SALARY * 12 AS "ANNUAL_SALARY"
	, HIRE_DATE
	, DEPT_ID     
FROM EMPLOYEE;