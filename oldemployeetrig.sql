CREATE OR REPLACE TRIGGER emp_del_trig  
AFTER DELETE ON employee  
FOR EACH ROW  
DECLARE  
    v_empno      employee.empid%TYPE;  
    v_empname    employee.empname%TYPE;  
    v_empdob     employee.dob%TYPE;  
    v_empdoj     employee.doj%TYPE;  
    v_empjob     employee.job%TYPE;  
    v_empsalary  employee.salary%TYPE;  
    v_deptno     employee.deptid%TYPE;  
BEGIN  
    v_empno     := :OLD.empid;  
    v_empname   := :OLD.empname;  
    v_empdob    := :OLD.dob;  
    v_empdoj    := :OLD.doj;  
    v_empjob    := :OLD.job;  
    v_empsalary := :OLD.salary;  
    v_deptno    := :OLD.deptid;  
  
    INSERT INTO oldemployee  
    VALUES (v_empno, v_empname, v_empdob, v_empdoj, v_empjob, v_empsalary, 
v_deptno);  
END;  
/ 
DELETE FROM Sales WHERE EmpId = 101;  
DELETE FROM Employee WHERE EmpId = 101; 
COMMIT; 
 
SELECT * FROM OldEmployee; 
select * from employee;
