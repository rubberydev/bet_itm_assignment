------------------------------- 5. ------------------------------------
/*______________________________________________________________________
* Create 10 users
* Each user should have a profile assigned from the ones created previously.
* All of the profiles created should be used at least once.
* All of the users should be able to login into the system
_______________________________________________________________________*/

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

--User 1  --Profile: Developer
CREATE USER carilekebush
      IDENTIFIED BY Developer123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO carilekebush;
     
ALTER USER carilekebush PROFILE Developer;

-- USER 2 --Profile: web_application

CREATE USER adambeyer
      IDENTIFIED BY Web123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO adambeyer;
     
ALTER USER adambeyer PROFILE WEB_APPLICATION;

-- USER 3 --Profile: Dba_admin

CREATE USER legittrip
      IDENTIFIED BY Admin123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO legittrip;
  
ALTER USER legittrip PROFILE DBA_ADMIN;


-- USER 4 --Profile: Analyst

CREATE USER surgeon
      IDENTIFIED BY Analyst123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO surgeon;
     
ALTER USER surgeon PROFILE ANALYST;

-- USER 5 --Profile: SupportIII

CREATE USER jamiejones
      IDENTIFIED BY Support123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO jamiejones;
     
ALTER USER jamiejones PROFILE SupportIII;

-- USER 6 --Profile: Reporter

CREATE USER ninakraviz
      IDENTIFIED BY Reporter123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO ninakraviz;
     
ALTER USER ninakraviz PROFILE REPORTER;

-- USER 7 --Profile: Auditor

CREATE USER izhevsky
      IDENTIFIED BY Auditor123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO izhevsky;
     
ALTER USER izhevsky PROFILE AUDITOR;

-- USER 8 --Profile: Developer

CREATE USER richtrott
      IDENTIFIED BY Developer123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO richtrott;
     
ALTER USER richtrott PROFILE DEVELOPER;

-- USER 9 --Profile: Developer

CREATE USER idaengberg
      IDENTIFIED BY Developer123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO idaengberg;
     
ALTER USER idaengberg PROFILE DEVELOPER;

-- USER 10 --Profile: WEB_APPLICATION

CREATE USER chrisliebing
      IDENTIFIED BY Web123
      DEFAULT TABLESPACE SYSTEM
      QUOTA UNLIMITED ON SYSTEM;

GRANT CREATE SESSION TO chrisliebing;
     
ALTER USER chrisliebing PROFILE DEVELOPER;

