-- 서브쿼리

-- 사원이름 JONES인 사원 급여 조회
SELECT *
FROM EMP e
WHERE e.ENAME = 'JONES';

-- 급여가 2,975보다 높은 사원 조회
SELECT *
FROM EMP e
WHERE e.SAL >= 2975;

-- 서브쿼리
SELECT *
FROM EMP e
WHERE e.SAL >= (SELECT SAL 
				FROM EMP 
				WHERE ENAME = 'JONES');

/* 9-2 단일행 서브쿼리 */
-- SCOTT 직원의 입사날짜보다 이전에 입사한 직원 조회
-- 1987-07-13이 1980-01-01보다 큰 수
SELECT *
FROM EMP e
WHERE e.HIREDATE < (SELECT HIREDATE
					FROM EMP 
					WHERE ENAME = 'SCOTT');

-- 모든 직원의 평균 급여보다 높은 급여를 받는 직원 조회
SELECT e.*, d.DNAME
FROM EMP e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE e.SAL >= (SELECT avg(SAL)
				FROM EMP)
AND e.DEPTNO = 20;

/* 9-3 다중행 서브쿼리 */
--RESEARCH, SALES인 부서에 다니는 직원들만 조회
SELECT *
FROM EMP e
WHERE e.DEPTNO IN (SELECT d.DEPTNO
				   FROM DEPT d 
				   WHERE d.DNAME IN ('RESEARCH', 'SALES'));

-- 각 부서별 최고 급여와 동일한 급여를 받는 사원 조회
SELECT e.DEPTNO, MAX(e.SAL)
FROM EMP e
GROUP BY e.DEPTNO;

SELECT *
FROM EMP e
WHERE e.SAL IN (SELECT MAX(SAL)
				FROM EMP
				GROUP BY DEPTNO);

-- ANY, SOME 서브쿼리 변환 결과들 중 메인쿼리의 조건이 하나라도 참이면
SELECT *
FROM EMP e
WHERE e.SAL = ANY (SELECT MAX(e.SAL)
				   FROM EMP e
				   GROUP BY e.DEPTNO);

-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원정보 조회
SELECT *
FROM EMP e
WHERE e.SAL < ANY (SELECT SAL
				   FROM EMP
				   WHERE DEPTNO = 30);

-- 30번 부서 사원들의 모든 급여보다 적은 급여를 받는 사원정보 조회
-- ALL -> AND조건
SELECT *
FROM EMP e
WHERE e.SAL < ALL (SELECT SAL
				   FROM EMP
				   WHERE DEPTNO = 30);

-- 서브쿼리 결과 값이 존재하면 메인쿼리가 조회
-- 내가 찾는 부서가 있다면 모든 직원 조회하라
SELECT *
FROM EMP e
WHERE EXISTS (SELECT DNAME
			  FROM DEPT
			  WHERE DEPTNO = 50);

/* 9-4 다중열 서브쿼리 */
SELECT *
FROM EMP e
WHERE (e.SAL, e.DEPTNO) IN (SELECT MAX(e.SAL), e.DEPTNO
				   FROM EMP e 
				   GROUP BY e.DEPTNO);

/* 9-5 FROM절 서브쿼리 */
SELECT e.EMPNO, e.DEPTNO
	 , TO_CHAR(e.HIREDATE, 'YYYY-MM-DD') AS "입사일"
FROM EMP e;

--JOIN으로 변경
SELECT d.*, e.EMPNO, TO_CHAR(e.HIREDATE, 'YYYY-MM-DD') AS "입사일"
FROM DEPT d, EMP e
WHERE d.DEPTNO = e.DEPTNO;

-- 가상의 테이블을 만들어서 마치 실제 테이블인 것처럼 사용 가능
SELECT *
FROM DEPT d, (SELECT EMPNO
				   , DEPTNO
				   , TO_CHAR(HIREDATE, 'YYYY-MM-DD') AS "입사일"
			  FROM EMP) e
WHERE d.DEPTNO = e.DEPTNO;

-- 둘 다 서브쿼리로 사용
SELECT e10.EMPNO, e10.ENAME, e10.DEPTNO
	 , d.DNAME, d.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) e10
   , (SELECT * FROM DEPT) d
WHERE e10.DEPTNO = d.DEPTNO;

-- WITH절로 가상 테이블을 위로 올려서 정의
-- 가독성 성능 개선
WITH
e10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
d AS (SELECT * FROM DEPT)
SELECT e10.EMPNO, e10.ENAME, e10.DEPTNO
	 , d.DNAME, d.LOC
FROM e10, d
WHERE e10.DEPTNO = d.DEPTNO;

-- 상호연관 서브쿼리 - 알고만 있으면 됨
-- 메인쿼리 데이터를 서브쿼리 사용, 그 결과를 다시 메인쿼리 반영
SELECT *
FROM EMP e1
WHERE e1.SAL > (SELECT MIN(SAL)
				FROM EMP
				WHERE DEPTNO = e1.DEPTNO)
ORDER BY e1.DEPTNO, e1.SAL;

/* 9-6 SELECT절 서브쿼리 */
SELECT e.EMPNO
	 , e.ENAME
	 , e.JOB
	 , e.SAL
	 , (SELECT GRADE
	   FROM SALGRADE
	   WHERE e.SAL BETWEEN LOSAL AND HISAL) AS "SALGRADES"
	 , e.DEPTNO 
	 , (SELECT DNAME
	 	FROM DEPT
	 	WHERE DEPTNO = e.DEPTNO) AS "DEPARTMENTS"
FROM EMP e
ORDER BY e.EMPNO;

-- JOIN으로 변경 가능. 위 서브쿼리보다 성능 개선
SELECT e.EMPNO
	 , e.ENAME
	 , e.JOB
	 , e.SAL
	 , s.GRADE AS "SALGRADES"
	 , e.DEPTNO 
	 , d.DNAME AS "DEPARTMENTS"
FROM EMP e, DEPT d, SALGRADE s
WHERE e.DEPTNO = d.DEPTNO
AND e.SAL BETWEEN s.LOSAL AND s.HISAL
ORDER BY e.EMPNO;