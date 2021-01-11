SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM USERS ORDER BY ID;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%ALBUM%';
DELETE ALBUMS;
----------------------------------ADD-------------------------------------------
DECLARE
BEGIN
   ADD_ALBUM('ALBUM1',5);
   ADD_ALBUM('ALBUM1',6);
   ADD_ALBUM('ALBUM2',5);

EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM ALBUMS;
----------------------------------DELETE----------------------------------------
DECLARE
BEGIN
   --DELETE_ALBUM_BY_ID(4);
   --DELETE_ALBUM_BY_USER_ID(5);
   --DELETE_ALBUM_BY_TITLE(5,'ALBum1');
   DELETE_ALBUM_BY_DATE(5,TO_DATE('23-11-2020','dd-mm-yyyy'),TRUE);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
---------------------------------UPDATE-----------------------------------------
DECLARE
BEGIN
   UPDATE_ALBUM(13,'ALBUM_UPDATE');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

set timing on;
SELECT * FROM ALBUMS WHERE USER_ID =40000;
----------------------------------GET-------------------------------------------
set timing on;
DECLARE
  CURSOR1 SYS_REFCURSOR;
  
  A ALBUMS_VIEW%ROWTYPE;
BEGIN
  --GET_ALBUM_BY_ID(CURSOR1,14);
  GET_ALBUMS_BY_USER_ID(CURSOR1,645);
  --GET_ALBUMS_BY_TITLE(CURSOR1,5,'Upd');
  --GET_ALBUMS_BY_DATE(CURSOR1,5,TO_DATE('25-11-2020','dd-mm-yyyy'),TRUE);
  LOOP
    FETCH CURSOR1 INTO A.ALBUM_ID,A.ALBUM_TITLE,A.ALBUM_CREATED;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||A.ALBUM_ID     ||' '||
    'TITLE: '   ||A.ALBUM_TITLE  ||' '||
    'CREATED: ' ||A.ALBUM_CREATED );
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------
