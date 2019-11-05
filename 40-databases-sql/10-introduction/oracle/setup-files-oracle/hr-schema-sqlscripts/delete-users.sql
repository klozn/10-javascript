set serveroutput on size 30000;

DECLARE
  CURSOR c_users
  IS
    SELECT username
    FROM dba_users
    where username like '%STUDENT%'
    order by username desc;
BEGIN
  FOR i IN c_users
  LOOP
    EXECUTE IMMEDIATE 'DROP USER '||i.username||' CASCADE';
  END LOOP;
END;