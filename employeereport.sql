CREATE OR REPLACE PROCEDURE generate_employee_report IS  
    -- Define variables to hold each column's data  
    v_DeptName           VARCHAR2(255);  
    v_EmpName            VARCHAR2(255);  
    v_Job                VARCHAR2(255);  
    v_Location           VARCHAR2(255);  
    v_Salary             NUMBER;  
    v_Cumulative_Salary  NUMBER;  
  
BEGIN  
    -- Output headers  
    DBMS_OUTPUT.PUT_LINE('DeptName | EmpName | Job | Location | Salary | 
Cumulative_Salary');  
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------');  
  
    -- Loop through the department and employee data without an explicit cursor  
    FOR rec IN (  
        SELECT d.DeptName,  
               e.EmpName,  
               e.Job,  
               e.Salary,  
               d.deptloc,  
               SUM(e.Salary) OVER (PARTITION BY d.DeptId ORDER BY e.EmpName) AS 
Cumulative_Salary  
        FROM Employee e  
        JOIN Department d ON e.DeptId = d.DeptId  
        ORDER BY d.DeptName, e.EmpName  
    )  
    LOOP  
        -- Display each record  
        DBMS_OUTPUT.PUT_LINE(  
            rec.DeptName || ' | ' ||  
            rec.EmpName  || ' | ' ||  
            rec.Job      || ' | ' ||  
            rec.deptloc  || ' | ' ||  
            rec.Salary   || ' | ' ||  
            rec.Cumulative_Salary  
        );  
    END LOOP;  
END;  
/ 
BEGIN  
    generate_employee_report();  
END; 
