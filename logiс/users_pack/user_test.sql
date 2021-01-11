SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM USERS;
SELECT * FROM USERS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%USER%';
DELETE USERS;
SELECT * FROM LOGS;
-----------------------------REGISTRATION---------------------------------------
DECLARE
BEGIN
  REGISTRATION('ALBERT','RANDOM','qwert@gmail.com','123');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM USERS;
--------------------------------LOGIN-------------------------------------------
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE(LOGIN('abyy@gmail.com','123'));
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

--------------------------------CHANGE------------------------------------------
DECLARE
BEGIN
  CHANGE_AGE(4,19);
  CHANGE_INFO(4,'Hello World');
  CHANGE_AVATAR(4,'https://loclalhost:3000/index.png');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
SELECT * FROM USERS WHERE FIRST_NAME LIKE '%abc%';

----------------------------------GET-------------------------------------------
set timing on;
SELECT * FROM USERS WHERE FIRST_NAME LIKE '%abc%' AND LAST_NAME = 'nSLogaMr';

DECLARE
  CURSOR1 SYS_REFCURSOR;
  
  U USERS_VIEW%ROWTYPE;
BEGIN
  --GET_USER_BY_ID(CURSOR1,12345);
  GET_USERS_BY_NAME(CURSOR1,'BER','RANDOM');
  --GET_USER_BY_EMAIL(CURSOR1,'albert@gmail.com');
  LOOP
    FETCH CURSOR1 INTO U.USER_ID,U.FIRST_NAME,U.LAST_NAME,U.AGE,U.EMAIL,U.INFO,U.AVATAR;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||U.USER_ID      ||' '||
    'FNAME: '   ||U.FIRST_NAME   ||' '||
    'LNAME: '   ||U.LAST_NAME    ||' '||
    'AGE: '     ||U.AGE          ||' '||
    'EMAIL: '   ||U.EMAIL        ||' '||
    'INFO: '    ||U.INFO         ||' '||
    'AVATAR: '  ||U.AVATAR);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;

----------------------------IMPORT/EXPORT XML-----------------------------------
DECLARE
BEGIN
  XML_PACKAGE.EXPORT_USERS_TO_XML();
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

DELETE USERS;

DECLARE
BEGIN
  XML_PACKAGE.IMPORT_USERS_FROM_XML();
EXCEPTION 
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

--------------------------------------------------------------------------------