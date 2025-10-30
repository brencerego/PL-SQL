CREATE OR REPLACE TRIGGER emp_delete_limit 
FOR DELETE ON employee 
COMPOUND TRIGGER 
 
    v_delete_count NUMBER := 0; 
 
BEFORE EACH ROW IS 
BEGIN 
    v_delete_count := v_delete_count + 1; 
    IF v_delete_count > 2 THEN 
        RAISE_APPLICATION_ERROR(-20001, 'You cannot delete more than 2 employees at 
a time.'); 
    END IF; 
END BEFORE EACH ROW; 
 
END; 
/ 
 -- ✅ This will work (2 rows only) 
DELETE FROM employee WHERE empid IN (103,104); 
COMMIT; 
 -- ❌ This will fail (more than 2 rows) 
DELETE FROM employee;
