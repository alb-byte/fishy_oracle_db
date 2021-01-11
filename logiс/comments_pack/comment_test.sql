SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM PHOTOS_VIEW;
SELECT * FROM COMMENTS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%COMMENT%';
DELETE COMMENTS;
----------------------------------ADD-------------------------------------------
DECLARE
BEGIN
  ADD_COMMENT('FIRST COMMENT',5,6);
  ADD_COMMENT('GARAVFHFG',5,6);
  ADD_COMMENT('LIKE',5,5);
  ADD_COMMENT('LIKE',7,5);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
SELECT * FROM COMMENTS_VIEW;
---------------------------------DELETE-----------------------------------------
DECLARE
BEGIN
  --DELETE_COMMENT_BY_ID(3);
  DELETE_COMMENT_BY_PHOTO_ID(5);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
SELECT * FROM COMMENTS_VIEW;
----------------------------------GET-------------------------------------------
DECLARE
  CURSOR1 SYS_REFCURSOR;
  
  C COMMENTS_VIEW%ROWTYPE;
BEGIN
  --GET_COMMENT_BY_ID(CURSOR1,5);
  
  GET_COMMENTS_BY_PHOTO_ID(CURSOR1,5);
  LOOP
    FETCH CURSOR1 INTO C.COMMENT_ID,C.COMMENT_INFO,C.COMMENT_CREATED,C.OWNER_ID,
      C.OWNER_FIRST_NAME,C.OWNER_LAST_NAME,C.OWNER_AVATAR;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '       ||C.COMMENT_ID       ||' '||
    'INFO: '     ||C.COMMENT_INFO     ||' '||
    'CREATED: '  ||C.COMMENT_CREATED  ||' '||
    'OWNER: '    ||C.OWNER_ID         ||' '||
    'FNAME: '    ||C.OWNER_FIRST_NAME ||' '||
    'LNAME: '    ||C.OWNER_LAST_NAME  ||' '||
    'AVATAR: '   ||C.OWNER_AVATAR);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------