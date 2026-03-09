-- PL/SQL은 SCOTT계정으로
-- SET SERVEROUTPUT ON; -- SQLPLUS에서 사용

/* -- 1. 기본 PL/SQL
BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello, Oracle!');
END;
*/

/* 2. 변수 선언 */
DECLARE
	v_empno NUMBER(4) := 7839;
	v_ename VARCHAR2(10);
	v_pi CONSTANT NUMBER(10) := 3.141592; -- 원주율은 상수
	v_deptno DEPT.DEPTNO%TYPE; -- NUMBER(2)라는 DEPTNO의 자료형을 참조해서 타입 사용
	v_deptrow DEPT%ROWTYPE; -- DEPT테이블 한 레코드(행) 구조 모두 참조
BEGIN
	v_ename := 'KING';
	DBMS_OUTPUT.PUT_LINE('V_EMPNO => ' || v_empno);
	DBMS_OUTPUT.PUT_LINE('V_ENAME => ' || v_ename);

	-- v_deptrow로 한 줄 가져오기
	SELECT DEPTNO, DNAME, LOC INTO v_deptrow
	  FROM DEPT
	 WHERE DEPTNO = 40;
	
	DBMS_OUTPUT.PUT_LINE('DEPTNO => ' || v_deptrow.DEPTNO);
	DBMS_OUTPUT.PUT_LINE('DNAME => ' || v_deptrow.DNAME);
	DBMS_OUTPUT.PUT_LINE('LOC => ' || v_deptrow.LOC);
END;
