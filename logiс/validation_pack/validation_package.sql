--------------------------------------------------------------------------------
--DROP PACKAGE VALIDATION_PACKAGE;
CREATE OR REPLACE PACKAGE VALIDATION_PACKAGE IS
  FUNCTION CHECK_EMAIL(EMAIL IN VARCHAR)RETURN BOOLEAN;
  FUNCTION CHECK_PHONE(PHONE IN VARCHAR)RETURN BOOLEAN;
END;
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY VALIDATION_PACKAGE IS
--------------------------------------------------------------------------------
FUNCTION CHECK_EMAIL(
EMAIL IN VARCHAR) 
RETURN BOOLEAN
IS
  IS_VALID NUMBER;
BEGIN
  SELECT REGEXP_INSTR(EMAIL, '^[A-Za-z0-9._-]+@[A-Za-z0-9._-]+\.[A-Za-z]{2,4}$')
    INTO IS_VALID FROM DUAL;
  IF IS_VALID = 1
    THEN RETURN TRUE;
  ELSE 
    RETURN FALSE;
  END IF;
END CHECK_EMAIL;
--------------------------------------------------------------------------------
FUNCTION CHECK_PHONE(
PHONE IN VARCHAR)
RETURN BOOLEAN
IS
  IS_VALID NUMBER;
BEGIN
  SELECT  REGEXP_INSTR(PHONE, '^[+]375\d{9}$') INTO IS_VALID FROM DUAL;
  IF IS_VALID = 1
    THEN RETURN TRUE;
  ELSE 
    RETURN FALSE;
  END IF;
END CHECK_PHONE;
--------------------------------------------------------------------------------
END;
--------------------------------------------------------------------------------
