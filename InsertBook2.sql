CREATE OR REPLACE PROCEDURE BOOKINSERTORUPDATE(
MYBOOKID NUMBER,
MYBOOKNAME VARCHAR2,
MYPUBLISHER VARCHAR2,
MYPRICE INT)
AS
MYCOUNT NUMBER;
BEGIN
SELECT COUNT(*) INTO MYCOUNT FROM BOOK
WHERE BOOKNAME LIKE MYBOOKNAME;
IF MYCOUNT!=0 THEN
UPDATE BOOK SET PRICE = MYPRICE
WHERE BOOKNAME LIKE MYBOOKNAME;
ELSE
INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES(MYBOOKID, MYBOOKNAME, MYPUBLISHER, MYPRICE);
END IF;
END;
/

EXEC BOOKINSERTORUPDATE(15, '������ ��ſ�', '������м���', 25000);
SELECT * FROM BOOK;

EXEC BOOKINSERTORUPDATE(15, '������ ��ſ�', '������м���', 20000);
SELECT * FROM BOOK;