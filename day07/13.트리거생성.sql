-- 트리거 생성
CREATE OR REPLACE TRIGGER TRG_EMP_LOG
AFTER
INSERT OR UPDATE OR DELETE ON EMP_TRG
FOR EACH ROW

BEGIN
	IF INSERTING THEN -- EMP_TRG 테이블에 새 데이터가 들어가면
		-- EMP_TRG_LOG 테이블에 아래의 쿼리 실행
		INSERT INTO emp_trg_log (tablename, dml_type, empno, user_name, change_date)
		VALUES ('EMP_TRG', 'INSERT', :NEW.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);

	ELSIF UPDATING THEN -- 데이터가 수정되면
		-- EMP_TRG_LOG 테이블에 아래의 쿼리 실행
		INSERT INTO emp_trg_log (tablename, dml_type, empno, user_name, change_date)
		VALUES ('EMP_TRG', 'UPDATE', :old.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);
	
	ELSIF DELETING THEN -- EMP_TRG 테이블에 새 데이터가 들어가면
		-- EMP_TRG_LOG 테이블에 아래의 쿼리 실행
		INSERT INTO emp_trg_log (tablename, dml_type, empno, user_name, change_date)
		VALUES ('EMP_TRG', 'DELETE', :old.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);
	END IF;
END;
