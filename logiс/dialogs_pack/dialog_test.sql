SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM USERS;
--SELECT * FROM DIALOGS;
SELECT * FROM DIALOGS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%DIALOG%';
DELETE DIALOGS;
---------------------------------ADD--------------------------------------------
DECLARE
BEGIN
   ADD_DIALOG(5,'START DIALOG');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
SELECT * FROM DIALOGS_VIEW;

-----------------------ADD/DELETE USER------------------------------------------
DECLARE
BEGIN
   --INVITE_USER_TO_DIALOG(6,1);
   REMOVE_USER_OF_DIALOG(6,1);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM DIALOGS_VIEW;

---------------------------------DELETE-----------------------------------------
DECLARE
BEGIN
   DELETE_DIALOG_BY_ID(5,1);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM DIALOGS_VIEW;

----------------------------------GET-------------------------------------------
DECLARE
  CURSOR1 SYS_REFCURSOR;
  
  D DIALOGS_VIEW%ROWTYPE;
BEGIN
  --GET_DIALOG_BY_ID(CURSOR1,5,2);
  --GET_DIALOGS_BY_TITLE(CURSOR1,5,'START dialog');
  GET_DIALOGS_BY_CREATOR_ID(CURSOR1,5);
  LOOP
    FETCH CURSOR1 INTO D.DIALOG_ID,D.DIALOG_TITLE,D.DIALOG_CREATED;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||D.DIALOG_ID      ||' '||
    'TITLE: '   ||D.DIALOG_TITLE   ||' '||
    'CREATED: ' ||D.DIALOG_CREATED);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------