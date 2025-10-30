CREATE OR REPLACE PROCEDURE find_primes(n IN NUMBER) AS   
    flag BOOLEAN;   
BEGIN   
    FOR i IN 2..n LOOP   
        flag := TRUE;   
        -- Check if i is prime   
        FOR j IN 2..TRUNC(SQRT(i)) LOOP   
            IF MOD(i, j) = 0 THEN   
                flag := FALSE;   
                EXIT;   
            END IF;   
        END LOOP;   
           
        IF flag THEN   
            DBMS_OUTPUT.PUT_LINE(i || ' is a prime number');   
        END IF;   
    END LOOP;   
END; 
/ 
BEGIN  
    find_primes(30);  -- Example: list primes up to 30  
END; 
