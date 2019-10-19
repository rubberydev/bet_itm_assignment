
CREATE TABLE Identity_Type (
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 9999999999999999999999999999,
         Document_Type  VARCHAR2(15) NOT NULL,
         Flag  VARCHAR2(15),
         CONSTRAINT Identity_Type_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
   
  
 CREATE TABLE Phones (
 		Id  NUMBER(30,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		MAXVALUE 9999999999999999999999999999,
        phone_number  VARCHAR2(35) NOT NULL,
        sufix varchar2(10) NOT NULL,
        FK_ID_Person number(30,0) not null,	 
        Flag  VARCHAR2(15),
        CONSTRAINT Phone_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
   CREATE TABLE Bonus (
 		Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		MAXVALUE 9999999999999999999999999999,
        type_bonus  VARCHAR2(35) NOT NULL,
        Start_Date TIMESTAMP,
        End_Date TIMESTAMP,
        Value NUMBER(15,5),
        status  VARCHAR2(35) NOT NULL,
        Flag  VARCHAR2(15),
        CONSTRAINT Bonus_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  CREATE TABLE Status_Deposit (
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 9999999999999999999999999999,
         Name_status  VARCHAR2(30) NOT NULL,
         Flag  VARCHAR2(15),
         CONSTRAINT Status_Deposite_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
    CREATE TABLE Deposit (
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 9999999999999999999999999999,
		 Value NUMBER(15,5),
		 FK_ID_Person number(30,0) not null,
		 Date_Deposit timestamp,
		 FK_ID_Status_Deposit number(30,0) not null,
	     FK_ID_Mode_Pay number(20,0) not null,
		 Limit_Deposit NUMBER(15,5),
         Flag  VARCHAR2(15),
         CONSTRAINT Deposite_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
 
    CREATE TABLE  Type_Pay (
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 999999999999999999,
         Mode_Pay  VARCHAR2(30) NOT NULL,
         Flag  VARCHAR2(15),
         CONSTRAINT Type_Pay PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);

   
    CREATE TABLE  Requisite_To_Retirement (
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 9999999999999,
         Description  VARCHAR2(40) NOT NULL,
         Flag  VARCHAR2(15),
         CONSTRAINT Requisite_To_Retirement_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
  CREATE TABLE  Retirement (
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 9999999999999999,
		 Value NUMBER(15,5),
		 FK_ID_Person number(30,0) not null,
		 Date_Retirement timestamp,
		 Approve_Requisite  VARCHAR2(40) NOT NULL,
         Flag  VARCHAR2(15),
         CONSTRAINT Retirement_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
    CREATE TABLE  Data_Financial (
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 9999999999999999,
		 FK_ID_Person number(30,0) not null,
		 Number_Account NUMBER(15,5),
		 Entity_Financial  VARCHAR2(40) NOT NULL,
         Flag  VARCHAR2(15),
         CONSTRAINT Data_Financial_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
      CREATE TABLE Master_location_Country (
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 999999999,
		 Name_Country  VARCHAR2(40) NOT NULL,
		 Time_Zone NUMBER(15,5),
         Flag  VARCHAR2(15),
         CONSTRAINT Master_Location_Contry_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  

   CREATE TABLE Master_Zone_Time (
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 999999999,
		 Zone_Time NUMBER(15,5),
         Flag  VARCHAR2(15),
         CONSTRAINT Master_Zone_Time_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
  
   CREATE TABLE Probability_Bets(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 999999999,
		 Type_Peso  VARCHAR2(15),
		 Value_Peso NUMBER(15,5),
         Flag  VARCHAR2(15),
         CONSTRAINT Probability_Bets_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
   CREATE TABLE   Type_Bet(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 999999999,
		 Name  VARCHAR2(40),
         Flag  VARCHAR2(15),
         CONSTRAINT Type_Bet_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);

  
     CREATE TABLE    Template_Bet(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 999999999,
		 Name_Template  VARCHAR2(40),
		 FK_ID_Type_Bet number(30,0) not null,
         Flag  VARCHAR2(15),
         CONSTRAINT Template_Bet_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
 
     CREATE TABLE    Status_Bets(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
		 MAXVALUE 999999999,
		 Status  VARCHAR2(40),
         Flag  VARCHAR2(15),
         CONSTRAINT Status_Bets_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  CREATE TABLE    Teams(
          Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     Name_Team  VARCHAR2(40),
     Flag  VARCHAR2(15),
     CONSTRAINT Teams_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
   
  
  CREATE TABLE    Status_Match(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     Name_Status  VARCHAR2(40),
     Flag  VARCHAR2(15),
     CONSTRAINT Status_Match_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
   CREATE TABLE      Match(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     FK_ID_Team_Visit number(30,0) not null,
     FK_ID_Team_Local number(30,0) not null,
     Goal_Visit_Firts_Time number(10,0),
     Goal_Visit number(10,0),
     Goal_Local number(10,0),
     Goal_Local_Firts_Time number(10,0),
     Date_Result timestamp,
     FK_ID_Status_Event  number(30,0) not null,
     FK_ID_Template_Bet number(30,0) not null,
     Flag  VARCHAR2(15),
     CONSTRAINT Match_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
     CREATE TABLE    Bets(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     FK_ID_Person number(30,0) not null,   
     value_bet number(20,5),
     FK_ID_Match number(30,0) not null,
     FK_ID_Template_Bet number(30,0) not null,
     Date_Bet timestamp,
     Flag  VARCHAR2(15),
     CONSTRAINT Bet_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K); 
  
  
    CREATE TABLE       Limit_Bets(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     DateLimit timestamp,
     Value_Per_Day number(20,5),
     Value_Per_Week number(20,5),
     Value_Per_Month number(20,5),
     FK_ID_Person number(30,0) not null,   
     Flag  VARCHAR2(15),
     CONSTRAINT Limit_Bets_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K); 

  
     CREATE TABLE    Status_Verification(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     Status  VARCHAR2(40),
     Flag  VARCHAR2(15),
     CONSTRAINT Status_Verification_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
       CREATE TABLE    History_Status_Bets(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     FK_ID_Status_Bet number(30,0) not null,
     Date_Change_Status timestamp,
     FK_ID_Bet number(30,0) not null,
     Flag  VARCHAR2(15),
     CONSTRAINT History_Status_Bets_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
      CREATE TABLE    Proof_Verification_user(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     FK_ID_Status_Verification number(30,0) not null,
     FK_ID_Person number(30,0) not null, 
     Size_File number (20,5),
     Description  VARCHAR2(15),
     Url  VARCHAR2(15),
     Extension_File  VARCHAR2(15),
     Flag  VARCHAR2(15),
     CONSTRAINT Proof_Verification_User_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
CREATE TABLE    Master_Location_Municipality(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     Postal_Code  VARCHAR2(15),
     Name_Municipality  VARCHAR2(15),
     Flag  VARCHAR2(15),
     CONSTRAINT Master_Location_Municipality_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);


  CREATE TABLE    Master_Location_Departament(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     Name_Departament  VARCHAR2(15),
     Flag  VARCHAR2(15),
     CONSTRAINT Master_Location_Departament_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
     CREATE TABLE    Sesion(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     Email  VARCHAR2(15) not null,
     Time_out  number (20,5) not null,
     password VARCHAR2(40) not null,
     FK_ID_Person number(30,0) not null, 
     date_sesion timestamp,
     Flag  VARCHAR2(15),
     CONSTRAINT Sesion_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
   CREATE TABLE      Preferences(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     Accept_Terms_Conditions  VARCHAR2(15) not null,
     Receive_Information  VARCHAR2(15) not null,
     FK_ID_Languages_To_Email number(30,0) not null,
     Bulletin_Information  VARCHAR2(15) not null,
     Email_Bets VARCHAR2(15) not null,
     Send_sms VARCHAR2(15) not null,
     notifications VARCHAR2(15) not null,
     Notices_Tickets_Bets VARCHAR2(15) not null,
     FK_ID_Person number(30,0) not null, 
     Flag  VARCHAR2(15),
     CONSTRAINT Preferences_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  

  
    CREATE TABLE    Lenguages(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     Lenguage_Name VARCHAR2(15),
     Flag  VARCHAR2(15),
     CONSTRAINT Lenguage_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
   CREATE TABLE      Person(
         Id  NUMBER(30,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 9999999999999,
     Identification_number  VARCHAR2(30) not null,
     Name  VARCHAR2(30) not null,
     First_Last_Name VARCHAR2(30) not null,
     Second_Last_Name VARCHAR2(30) not null,
     Genre VARCHAR2(30) not null,
     FK_ID_Identity_Type number(30,0) not null,
     Expedition_Place  VARCHAR2(30) not null,
     Nationality VARCHAR2(30) not null,
     Birth_Date  date,
     Balance_available number(20,5),
     Birth_Place VARCHAR2(30) not null,
     FK_ID_Country number(30,0) not null,
     FK_ID_Department number(30,0) not null,
     FK_ID_Municipality number(30,0) not null, 
     Flag  VARCHAR2(15),
     CONSTRAINT Person_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
      CREATE TABLE    Retirement_Requisite(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     FK_ID_Requisite number(30,0) not null,
     FK_ID_Retirement number(30,0) not null,
     Flag  VARCHAR2(15),
     CONSTRAINT Retirement_Requisite_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
  
       CREATE TABLE   Zone_Time_Location_Departamen(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     FK_ID_Departament number(30,0) not null,
     FK_ID_Zone_Time number(30,0) not null,
     Flag  VARCHAR2(15),
     CONSTRAINT Zone_Time_Location_Departament_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
     
    CREATE TABLE  Template_bets_Probability_Bets(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     FK_ID_Template_Bet number(30,0) not null,
     FK_ID_Probabity_Bet number(30,0) not null,
     Flag  VARCHAR2(15),
     CONSTRAINT Template_bets_Probability_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
    CREATE TABLE Bonus_Person(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     FK_ID_Bonus number(30,0) not null,
     FK_ID_Person number(30,0) not null,
     Flag  VARCHAR2(15),
     CONSTRAINT Bonus_Person_pk PRIMARY KEY (Id))
   TABLESPACE BET_ITM
   STORAGE ( INITIAL 50K);
  
  
  
      CREATE TABLE  Master_Audit_DB(
         Id  NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
     MAXVALUE 999999999,
     Date_Time timestamp,
     Table_Audit  VARCHAR2(30) not null,
     Record_ID number(30,0) not null,
     Action_Audit  VARCHAR2(50) not null,
     User_Audit VARCHAR2(50) not null,
     IP VARCHAR2(30) not null,
     Flag  VARCHAR2(15),
     CONSTRAINT Master_Audit_DB_pk PRIMARY KEY (Id))
   TABLESPACE BET_AUDITING 
   STORAGE ( INITIAL 50K);

  
