------------------------------- 3. -----------------------------------
--Create the following Profiles with the resources described:

-- Developer
CREATE PROFILE DEVELOPER LIMIT
	FAILED_LOGIN_ATTEMPTS 5
	PASSWORD_LIFE_TIME 90
	SESSIONS_PER_USER 1
	CONNECT_TIME 60
	IDLE_TIME 30;

-- Web Application
CREATE PROFILE WEB_APPLICATION LIMIT
	FAILED_LOGIN_ATTEMPTS 2
	PASSWORD_LIFE_TIME 30
	SESSIONS_PER_USER 5
	CONNECT_TIME UNLIMITED
	IDLE_TIME UNLIMITED;

-- Dba Admin
CREATE PROFILE DBA_ADMIN LIMIT
	FAILED_LOGIN_ATTEMPTS 2
	PASSWORD_LIFE_TIME 30
	SESSIONS_PER_USER 1
	CONNECT_TIME 30
	IDLE_TIME UNLIMITED;

-- Analyst
CREATE PROFILE Analyst LIMIT
	FAILED_LOGIN_ATTEMPTS 3
	PASSWORD_LIFE_TIME 30
	PASSWORD_GRACE_TIME 3
	SESSIONS_PER_USER 1
	CONNECT_TIME 30
	IDLE_TIME 5;


-- SupportIII
CREATE PROFILE SupportIII LIMIT
	FAILED_LOGIN_ATTEMPTS 3
	PASSWORD_LIFE_TIME 20
	PASSWORD_GRACE_TIME 3
	SESSIONS_PER_USER 1
	CONNECT_TIME 240
	IDLE_TIME 5;

-- Reporter
CREATE PROFILE Reporter LIMIT
	FAILED_LOGIN_ATTEMPTS 4
	PASSWORD_LIFE_TIME UNLIMITED
	PASSWORD_GRACE_TIME 5
	SESSIONS_PER_USER 1
	CONNECT_TIME 90
	IDLE_TIME 15;

-- Auditor
CREATE PROFILE Auditor LIMIT
	FAILED_LOGIN_ATTEMPTS 4
	PASSWORD_LIFE_TIME UNLIMITED
	PASSWORD_GRACE_TIME 5
	SESSIONS_PER_USER 1
	CONNECT_TIME 90
	IDLE_TIME 15;


	
--Validate the profiles
SELECT DISTINCT(PROFILE) FROM DBA_PROFILES ORDER BY PROFILE;