CREATE OR REPLACE FUNCTION get_total_sales_by_prod(  
    prod_id IN VARCHAR2  
) RETURN NUMBER IS  
    total_sales NUMBER;  
BEGIN  
    SELECT NVL(SUM(Quantity), 0)  
    INTO total_sales  
    FROM Sales  
    WHERE ProdId = prod_id;  
  
    RETURN total_sales;  
END;  
/ 
SELECT get_total_sales_by_prod('P102') AS total_quantity_sold FROM dual;
