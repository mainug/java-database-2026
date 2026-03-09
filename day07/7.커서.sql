-- PL/SQL 커서

DECLARE
	-- 커서 데이터를 입력할 변수
	vr_dept DEPT%ROWTYPE;
	
	-- 커서 선언
	CURSOR cur1 IS
	SELECT DEPTNO, DNAME, LOC
	  FROM DEPT;
BEGIN
	-- 커서 오픈
	OPEN cur1;
	
	LOOP
		-- 커서로 데이터를 읽을 때는 FETCH 사용
		FETCH cur1 INTO vr_dept;
		-- FETCH해도 데이터가 없으면 break
	 	EXIT WHEN cur1%NOTFOUND;
	
		DBMS_OUTPUT.PUT_LINE('부서 : ' || vr_dept.DEPTNO
						  || ',부서명 : ' || vr_dept.DNAME
						  || ',위치 : ' || vr_dept.LOC);
	END LOOP;
	
	CLOSE cur1; -- 마지막 커서 닫기
END;
