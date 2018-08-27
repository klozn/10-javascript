-- create user (connected as the SYSTEM USER)

----------------------------------------------------------
CREATE USER BILL IDENTIFIED BY SYSTEM
GRANT CREATE SESSION TO BILL;
GRANT CREATE TABLE TO BILL;
ALTER DATABASE DEFAULT TABLESPACE users;
GRANT UNLIMITED TABLESPACE TO BILL;
-------------------------------------------
----- connect as BILL user ----------------
-------------------------------------------

------------------------------------------------------
-- Detect session, kill session, drop user CASCADE-----
-------------------------------------------------------
select * from dba_users;


SELECT s.inst_id,
  s.sid,
  s.serial#,
  p.spid,
  s.username,
  s.program
FROM   gv$session s
  JOIN gv$process p ON p.addr = s.paddr AND p.inst_id = s.inst_id
WHERE  s.type != 'BACKGROUND';

ALTER SYSTEM KILL SESSION '<s.sid>,<s.serial#>';

DROP USER BILL CASCADE;