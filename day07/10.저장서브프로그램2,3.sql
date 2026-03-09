-- out 파라미터 저장프로시저 실행
DECLARE
	v_empno emp.empno%TYPE;
	v_ename emp.ename%TYPE;
BEGIN
	v_empno := 7788;
	prc_inoutparam(v_empno, v_ename);

	DBMS_OUTPUT.PUT_LINE('EMPNO = ' || v_empno);
	DBMS_OUTPUT.PUT_LINE('ENAME = ' || v_ename);
END;

