CREATE OR REPLACE FUNCTION get_employee_working_days(p_empid IN NUMBER) 
RETURN NUMBER 
IS 
    v_start_date   DATE; 
    v_working_days NUMBER; 
BEGIN 
    SELECT doj 
    INTO v_start_date 
    FROM employee 
    WHERE empid = p_empid; 
    v_working_days := TRUNC(SYSDATE - v_start_date); 
    RETURN v_working_days; 
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001, 'Employee not found'); 
    WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM); 
END; 
/ 
SELECT get_employee_working_days(102) AS working_days FROM dual;
