CREATE OR REPLACE TRIGGER check_salary_limit  
BEFORE UPDATE OF salary ON employee  
FOR EACH ROW  
BEGIN  
    IF :NEW.salary > 67000 THEN  
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be updated to a value 
greater than 67000.');  
    END IF;  
END;  
/ 
UPDATE employee  
SET salary = 70000  
WHERE empid = 102; 
 
UPDATE employee  
SET salary = 62000  
WHERE empid = 103; 
 
select * from employee; 
