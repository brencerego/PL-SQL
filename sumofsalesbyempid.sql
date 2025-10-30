CREATE OR REPLACE FUNCTION get_sales_by_emp(emp_id IN NUMBER)  
RETURN NUMBER IS  
    total_sales NUMBER;  
BEGIN  
    -- Calculate the sum of sales for the given EmpId  
    SELECT NVL(SUM(Quantity), 0)  
    INTO total_sales  
    FROM Sales  
    WHERE EmpId = emp_id;  
  
    -- Return the total sales  
    RETURN total_sales;  
END;  
/ 
SELECT get_sales_by_emp(103) AS total_sales FROM dual;
