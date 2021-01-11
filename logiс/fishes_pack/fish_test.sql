SET serveroutput ON;
--------------------------------------------------------------------------------
SELECT * FROM FISHES;
SELECT * FROM FISHES_VIEW;
SELECT * FROM USER_PROCEDURES WHERE OBJECT_NAME LIKE '%FISH%';
DELETE FISHES;
---------------------------------ADD--------------------------------------------
DECLARE
BEGIN
  ADD_FISH('Shark','Danger','http://photos/1',5);
  ADD_FISH('fish1','big fish','http://photos/1',5);
  ADD_FISH('small','small fish','http://photos/2',5);
  ADD_FISH('gold','expansive','http://photos/3',5);

EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
SELECT * FROM FISHES_VIEW;
----------------------------DELETE----------------------------------------------
DECLARE
BEGIN
  --DELETE_FISH_BY_ID(2);
  DELETE_FISH_BY_NAME('small');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM FISHES_VIEW;
--------------------------------UPDATE------------------------------------------
DECLARE
BEGIN
  --UPDATE_FISH(4,'barabulka');
  UPDATE_FISH(4,'sinec','sinec');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

SELECT * FROM FISHES_VIEW;
-----------------------------------GET------------------------------------------
SELECT * FROM FISHES_VIEW;
DECLARE
  CURSOR1 SYS_REFCURSOR;
  
  F FISHES_VIEW%ROWTYPE;
BEGIN
  --GET_FISHES(CURSOR1);
  --GET_FISH_BY_NAME(CURSOR1,'SINEC');
  GET_FISH_BY_ID(CURSOR1,1);
  LOOP
    FETCH CURSOR1 INTO F.FISH_ID,F.FISH_NAME,F.FISH_INFO,F.FISH_PHOTO;
    EXIT WHEN CURSOR1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
    'ID: '      ||F.FISH_ID      ||' '||
    'NAME: '    ||F.FISH_NAME    ||' '||
    'INFO: '    ||F.FISH_INFO    ||' '||
    'PHOTO: '   ||F.FISH_PHOTO);
  END LOOP;
  CLOSE CURSOR1;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    CLOSE CURSOR1;
END;
--------------------------------------------------------------------------------

