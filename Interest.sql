CREATE OR REPLACE PROCEDURE INTEREST
AS
MYINTEREST NUMERIC;
PRICE NUMERIC;
CURSOR INTERESTCURSOR IS SELECT SALEPRICE FROM ORDERS;
BEGIN
MYINTEREST :=0.0;
OPEN INTERESTCURSOR;
LOOP
FETCH INTERESTCURSOR INTO PRICE;
EXIT WHEN INTERESTCURSOR%NOTFOUND;
IF PRICE >=30000 THEN
MYINTEREST := MYINTEREST + PRICE * 0.1;
ELSE
MYINTEREST := MYINTEREST + PRICE * 0.05;
END IF;
END LOOP;
CLOSE INTERESTCURSOR;
DBMS_OUTPUT.PUT_LINE ('전체 이익 금액= '||MYINTEREST);
END;
/

SET SERVEROUTPUT ON;

EXEC INTEREST;