-- PL/SQL 저장서브프로그램
-- python func_a()
CREATE OR REPLACE PROCEDURE prc_noparam
AS
	-- DECLARE 영역
	v_empno NUMBER(4) := 7788;
	v_ename VARCHAR2(10);
BEGIN
	SELECT ENAME INTO v_ename
	  FROM EMP
	 WHERE EMPNO = v_empno;

	DBMS_OUTPUT.PUT_LINE('v_empno = ' || v_empno);
	DBMS_OUTPUT.PUT_LINE('v_ename = ' || v_ename);
END prc_noparam;
