------------------------------------
select * from v$pdbs;
alter PLUGGABLE DATABASE FISHY open;
alter PLUGGABLE DATABASE FISHY close immediate;  
alter database archivelog;

grant all PRIVILEGES to fishy_admin;
alter system disable restricted session;
------------------------------------
select * from dba_users;
select * from v$instance;
SELECT * FROM v$session WHERE username is not null;
select * from dba_tablespaces;
select * from dba_roles;
select * from dba_data_files;
------------------------------------
----TEST REGEX FOR PHONE
SET serveroutput ON;
declare
    flag number;
BEGIN
 SELECT  REGEXP_INSTR ('+375291063069', '^[+]375\d{9}$') INTO flag
  FROM dual;
  if flag = 1
  then DBMS_OUTPUT.PUT_LINE('flag = '||'1');
  else DBMS_OUTPUT.PUT_LINE('flag = '||'0');
  end if;
end;

----TEST CONCAT
SET serveroutput ON;
DECLARE
	id int := 123;
  first_name varchar(30) :='DSDSDSDS' ;
  last_name varchar(30) := 'DDCDCDS123';
  age int := 13;
	email varchar(50) := 'DDEFBRBF@HG';
  pass varchar(100) := 'DSSDDSDS';
  info varchar(1000):= 'SDSDE345';
  avatar varchar(100):='PPPPP';
  NEW_VALUE VARCHAR(2000);
BEGIN 
  SELECT ID|| ' '||FIRST_NAME||' '||LAST_NAME||' '||AGE||' '||EMAIL||' '||PASS||' '||INFO||' '||AVATAR INTO NEW_VALUE FROM DUAL;
  DBMS_OUTPUT.PUT_LINE(NEW_VALUE);
END;
---------------------------------
SELECT * FROM USER_TABLES;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_VIEWS;
SELECT * FROM USER_TRIGGERS;

SELECT * FROM USER_PROCEDURES;
SELECT * FROM USER_SOURCE;
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE = 'PACKAGE' OR OBJECT_TYPE = 'PACKAGE BODY';
SELECT * FROM USER_OBJECTS;

SELECT * FROM USER_TABLESPACES;
-------------------------------------

SELECT * FROM USERS_VIEW;
SELECT * FROM USERS;
DELETE USERS;
SET serveroutput ON;
BEGIN
  --USER_PACKAGE.REGISTRATION('ALBERT','goooj','albert@gmail.com','tryt3236');
  DBMS_OUTPUT.PUT_LINE(USER_PACKAGE.LOGIN('albert@gmail.com','tryt3236'));
  exception when others then
  DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
