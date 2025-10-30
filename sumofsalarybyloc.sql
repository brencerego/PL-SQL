CREATE OR REPLACE PROCEDURE sum_salary_by_location (  
    p_location IN VARCHAR2,  
    p_total_salary OUT NUMBER  
) AS  
BEGIN  
    -- Initialize the total salary to zero  
    p_total_salary := 0;  
  
    -- Calculate the sum of salaries based on the provided location  
    SELECT NVL(SUM(e.salary), 0)  
    INTO p_total_salary  
    FROM employee e  
    JOIN department d ON e.DeptId = d.DeptId  
    WHERE d.DeptLoc = p_location;  
  
EXCEPTION  
    WHEN NO_DATA_FOUND THEN  
        p_total_salary := 0;  
    WHEN OTHERS THEN  
        RAISE; -- Raise any other unexpected errors  
END sum_salary_by_location;  
/ 
DECLARE  
    total_salary NUMBER;  
    loc VARCHAR2(25) := 'mumbai';   
BEGIN  
    sum_salary_by_location(loc, total_salary);  
    DBMS_OUTPUT.PUT_LINE('Total Salary for location ' || loc || ' is: ' || 
total_salary);  
END; 
