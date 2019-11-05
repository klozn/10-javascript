set serveroutput on size 30000;
ALTER SESSION
    SET NLS_DATE_FORMAT= 'DD-MON-RR'
    NLS_DATE_LANGUAGE = 'ENGLISH';


DECLARE
    current_username VARCHAR2(12);
    current_password VARCHAR2(12);
    user_id number (10);
    number_of_users number (4):=50;
BEGIN
    for user_id in 1..number_of_users

    LOOP

    current_username :='STUDENT'||user_id;
    current_password :='STUDENT'||user_id;

    EXECUTE IMMEDIATE 'CREATE USER '||current_username||' IDENTIFIED BY '||current_password;
    EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO '||current_username;
    EXECUTE IMMEDIATE 'GRANT CREATE TABLE TO '||current_username;
    EXECUTE IMMEDIATE 'GRANT CREATE SEQUENCE TO '||current_username;
    EXECUTE IMMEDIATE 'GRANT UNLIMITED TABLESPACE  TO '||current_username;

    END LOOP;

    COMMIT;

END;
