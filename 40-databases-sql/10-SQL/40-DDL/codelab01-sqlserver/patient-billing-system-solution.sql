-- Create a new database (BILLING)

-- BILLS

CREATE TABLE BILLS ( 
             BILL_ID      INT NOT NULL , 
             BILLING_DATE DATE NOT NULL , 
             CONSTRAINT bills_pk PRIMARY KEY(BILL_ID)
                   );

-- ZIPCODES

CREATE TABLE ZIPCODES ( 
             ZIPCODE INT NOT NULL , 
             CITY    VARCHAR(50) NOT NULL , 
             STATE   VARCHAR(50) , 
             CONSTRAINT ZIPCODES_PK PRIMARY KEY(ZIPCODE)
                      );

-- PATIENTS

CREATE TABLE PATIENTS ( 
             PATIENT_ID INT NOT NULL , 
             FIRST_NAME VARCHAR(50) NOT NULL , 
             LAST_NAME  VARCHAR(50) NOT NULL , 
             ADDRESS    VARCHAR(200) NOT NULL , 
             ZIPCODE    INT NOT NULL , 
             CONSTRAINT PATIENTS_PK PRIMARY KEY(PATIENT_ID) , 
             CONSTRAINT PATIENTS_ZIPCODES_FK FOREIGN KEY(ZIPCODE) REFERENCES ZIPCODES(
                                                                             ZIPCODE)
                      );

-- STAYS + Foreign key to PATIENTS and bills

CREATE TABLE STAYS ( 
             STAY_ID         INT NOT NULL , 
             PATIENT_ID      INT NOT NULL , 
             BILL_ID         INT NULL , 
             ADMITTED_DATE   DATE NOT NULL , 
             DISCHARGED_DATE DATE NOT NULL , 
             CONSTRAINT STAYS_PK PRIMARY KEY(STAY_ID) , 
             CONSTRAINT STAYS_PATIENTS_FK FOREIGN KEY(PATIENT_ID) REFERENCES PATIENTS(
                                                                             PATIENT_ID) , 
             CONSTRAINT STAYS_BILLS_FK FOREIGN KEY(BILL_ID) REFERENCES BILLS(
                                                                       BILL_ID)
                   );

-- PHONENUMBERS

CREATE TABLE PHONENUMBERS ( 
             PATIENT_ID INT NOT NULL , 
             PHONE      VARCHAR(12) NOT NULL , 
             CONSTRAINT PHONENUMBERS_PATIENTS_FK FOREIGN KEY(PATIENT_ID) REFERENCES PATIENTS(
                                                                                    PATIENT_ID)
                          );

-- COSTCENTERS

CREATE TABLE COSTCENTERS ( 
             COSTCENTER_CODE INT NOT NULL , 
             COSTCENTER_NAME VARCHAR(50) NOT NULL , 
             CONSTRAINT COSTCENTER_CODE_PK PRIMARY KEY(COSTCENTER_CODE)
                         );

-- ITEMS

CREATE TABLE ITEMS ( 
             ITEM_CODE   INT NOT NULL , 
             DESCRIPTION VARCHAR(50) NOT NULL , 
             PRICE       INT NOT NULL , 
             CONSTRAINT ITEM_CODE_PK PRIMARY KEY(ITEM_CODE)
                   );

-- ORDERS

CREATE TABLE ORDERS ( 
             ORDER_ID        INT NOT NULL , 
             ORDER_DATE      DATE NOT NULL , 
             COSTCENTER_CODE INT NOT NULL , 
             ITEM_CODE       INT NOT NULL , 
             STAY_ID         INT NOT NULL , 
             CONSTRAINT ORDERS_PK PRIMARY KEY(ORDER_ID) , 
             CONSTRAINT ORDERS_COSTCENTER_FK FOREIGN KEY(COSTCENTER_CODE) REFERENCES COSTCENTERS(
                                                                                     COSTCENTER_CODE) , 
             CONSTRAINT ORDERS_ITEMS_FK FOREIGN KEY(ITEM_CODE) REFERENCES ITEMS(
                                                                          ITEM_CODE) , 
             CONSTRAINT ITEMS_STAYS_FK FOREIGN KEY(STAY_ID) REFERENCES STAYS(
                                                                       STAY_ID)
                    );

-- drop all tables

DROP TABLE PHONENUMBERS;

DROP TABLE ORDERS;

DROP TABLE STAYS;

DROP TABLE PATIENTS;

DROP TABLE BILLS;

DROP TABLE ITEMS;

DROP TABLE COSTCENTERS;

DROP TABLE ZIPCODES;

-- Verify constraints

SELECT 
       *
FROM 
     INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS;

SELECT 
       *
FROM 
     INFORMATION_SCHEMA.TABLE_CONSTRAINTS;

-- adding data

INSERT INTO ZIPCODES ( 
       ZIPCODE , 
       CITY , 
       STATE
                     ) 
VALUES ( 
       80638 , 
       'Boulder' , 
       'Colorado'
       );

INSERT INTO PATIENTS ( 
       PATIENT_ID , 
       FIRST_NAME , 
       LAST_NAME , 
       ADDRESS , 
       ZIPCODE
                     ) 
VALUES ( 
       12345 , 
       'Mary' , 
       'Baker' , 
       '300 Oak Street' , 
       80638
       );

INSERT INTO PHONENUMBERS ( 
       PATIENT_ID , 
       PHONE
                         ) 
VALUES ( 
       12345 , 
       '123-456-789'
       );

INSERT INTO PHONENUMBERS ( 
       PATIENT_ID , 
       PHONE
                         ) 
VALUES ( 
       12345 , 
       '002358953'
       );

INSERT INTO BILLS ( 
       BILL_ID , 
       BILLING_DATE
                  ) 
VALUES ( 
       1 , 
       CONVERT(DATE , '07/20/08')
       );

INSERT INTO STAYS ( 
       STAY_ID , 
       PATIENT_ID , 
       BILL_ID , 
       ADMITTED_DATE , 
       DISCHARGED_DATE
                  ) 
VALUES ( 
       1 , 
       12345 , 
       1 , 
       CONVERT(DATE , '07/14/08') , 
       CONVERT(DATE , '07/17/08')
       );

INSERT INTO COSTCENTERS ( 
       COSTCENTER_CODE , 
       COSTCENTER_NAME
                        ) 
VALUES ( 
       100 , 
       'Room & Board'
       );

INSERT INTO ITEMS ( 
       ITEM_CODE , 
       DESCRIPTION , 
       PRICE
                  ) 
VALUES ( 
       2000 , 
       'Semi-prv room' , 
       200
       );

INSERT INTO ORDERS ( 
       ORDER_ID , 
       ORDER_DATE , 
       COSTCENTER_CODE , 
       ITEM_CODE , 
       STAY_ID
                   ) 
VALUES ( 
       1 , 
       CONVERT(DATE , '07/14/08') , 
       100 , 
       2000 , 
       1
       );