-- 조인 한번더
SELECT d.DEPTNO, d.DNAME, d.LOC
	 , e.EMPNO, e.ENAME, e.JOB
	 , TO_CHAR(e.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
	 , e.SAL    
FROM EMP e, DEPT d
WHERE d.DEPTNO = e.DEPTNO
ORDER BY e.EMPNO ASC;

-- 셀프조인
-- e1 상사를 찾는 테이블
-- e2 상사 테이블
SELECT e1.EMPNO, e1.ENAME, e1.MGR
	 , e2.EMPNO AS mgr_empno
	 , e2.ENAME AS mgr_ename
FROM EMP e1, EMP e2
WHERE e1.MGR = e2.EMPNO;

-- 외부조인 - 등가조인에 일치하지 않는 데이터도 조회
-- MGR 상사가 있는지 확인
SELECT e1.EMPNO, e1.ENAME, e1.MGR
	 , e2.EMPNO AS mgr_empno
	 , e2.ENAME AS mgr_ename
FROM EMP e1, EMP e2
WHERE e1.MGR = e2.EMPNO (+);

-- 잘못된 조인. e2의 EMPNO를 상사 컬럼으로, e1의 MGR를 부하컬럼으로 외부조인
SELECT e1.EMPNO, e1.ENAME, e1.MGR
	 , e2.EMPNO AS mgr_empno
	 , e2.ENAME AS mgr_ename
FROM EMP e1, EMP e2
WHERE e1.MGR (+) = e2.EMPNO;

-- 외부조인 두번째 예제
-- 일반 내부조인
SELECT d.DEPTNO, d.DNAME, d.LOC
	 , e.EMPNO, e.ENAME, e.JOB
	 , TO_CHAR(e.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
	 , e.SAL    
FROM EMP e, DEPT d
WHERE d.DEPTNO = e.DEPTNO;

-- 왼쪽 외부조인
SELECT d.DEPTNO, d.DNAME, d.LOC
	 , e.EMPNO, e.ENAME, e.JOB
	 , TO_CHAR(e.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
	 , e.SAL    
FROM EMP e, DEPT d
WHERE d.DEPTNO = e.DEPTNO (+);

-- 오른쪽 외부조인
SELECT d.DEPTNO, d.DNAME, d.LOC
	 , e.EMPNO, e.ENAME, e.JOB
	 , TO_CHAR(e.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
	 , e.SAL    
FROM EMP e, DEPT d
WHERE d.DEPTNO (+) = e.DEPTNO;

-- 왼쪽외부조인
SELECT d.DEPTNO, d.DNAME, d.LOC
	 , e.*
FROM DEPT d, EMP e
WHERE d.DEPTNO = e.DEPTNO (+)
AND e.EMPNO IS NULL;