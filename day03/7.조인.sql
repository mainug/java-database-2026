/* JOIN!!!!! */
-- 관계형(Relational)DB, RDB에서 테이블을 합쳐서 표현하는 방법
SELECT *
FROM EMP;

SELECT *
FROM DEPT;

-- 합치기(그냥 합치기 - 카테시안곱)
SELECT *
FROM EMP, DEPT;

-- 등가조인 equi-join, inner-join, simple join
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

-- 비등가조인
SELECT *
FROM EMP;

SELECT *
FROM SALGRADE;

SELECT *
FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL;