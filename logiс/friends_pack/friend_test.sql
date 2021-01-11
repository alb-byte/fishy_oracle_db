SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM USERS;
SELECT * FROM FRIENDS;
SELECT * FROM FRIENDS_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%FRIEND%';
DELETE FRIENDS;
----------------------------------ADD-------------------------------------------
DECLARE
BEGIN
  ADD_FRIEND(6,5);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
----------------------------------DELETE----------------------------------------
DECLARE
BEGIN
  DELETE_FRIEND_BY_ID(6,5);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
----------------------------------GET-------------------------------------------
DECLARE
  CURSOR1 SYS_REFCURSOR;
  
  F FRIENDS_VIEW%ROWTYPE;
BEGIN
  --GET_FRIEND_BY_ID(CURSOR1,6,5);
  GET_FRIENDS_BY_NAME(CURSOR1,6,'ber','RANDOM');
  --GET_FRIEND_BY_EMAIL(CURSOR1,6,'albert@gmail.com');
  LOOP
    FETCH CURSOR1 INTO F.FRIEND_ID,F.FRIEND_FIRST_NAME,F.FRIEND_LAST_NAME,F.FRIEND_EMAIL,F.FRIEND_AVATAR;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||F.FRIEND_ID         ||' '||
    'FNAME: '   ||F.FRIEND_FIRST_NAME ||' '||
    'LNAME: '   ||F.FRIEND_LAST_NAME  ||' '||
    'EMAIL: '   ||F.FRIEND_EMAIL      ||' '||
    'AVATAR: '  ||F.FRIEND_AVATAR);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------

