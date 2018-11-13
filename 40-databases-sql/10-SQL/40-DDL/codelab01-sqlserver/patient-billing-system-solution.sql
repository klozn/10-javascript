-- Create a new database (BILLING)


CREATE SCHEMA BIL;
GO;

BEGIN TRAN;


-- BILLS
CREATE TABLE BIL.BILLS ( 
             BILL_ID      INT NOT NULL , 
             BILLING_DATE DATE NOT NULL , 
             CONSTRAINT BILLS_PK PRIMARY KEY(BILL_ID)
                       );

-- ZIPCODES

CREATE TABLE BIL.ZIPCODES ( 
             ZIPCODE INT NOT NULL , 
             CITY    VARCHAR(50) NOT NULL , 
             STATE   VARCHAR(50) , 
             CONSTRAINT ZIPCODES_PK PRIMARY KEY(ZIPCODE)
                          );

-- PATIENTS

CREATE TABLE BIL.PATIENTS ( 
             PATIENT_ID INT NOT NULL , 
             FIRST_NAME VARCHAR(50) NOT NULL , 
             LAST_NAME  VARCHAR(50) NOT NULL , 
             ADDRESS    VARCHAR(200) NOT NULL , 
             ZIPCODE    INT NOT NULL , 
             CONSTRAINT PATIENTS_PK PRIMARY KEY(PATIENT_ID) , 
             CONSTRAINT PATIENTS_ZIPCODES_FK FOREIGN KEY(ZIPCODE) REFERENCES BIL.ZIPCODES(
                                                                             ZIPCODE)
                          );

-- STAYS + Foreign key to PATIENTS and bills

CREATE TABLE BIL.STAYS ( 
             STAY_ID         INT NOT NULL , 
             PATIENT_ID      INT NOT NULL , 
             BILL_ID         INT NULL , 
             ADMITTED_DATE   DATE NOT NULL , 
             DISCHARGED_DATE DATE NOT NULL , 
             CONSTRAINT STAYS_PK PRIMARY KEY(STAY_ID) , 
             CONSTRAINT STAYS_PATIENTS_FK FOREIGN KEY(PATIENT_ID) REFERENCES BIL.PATIENTS(
                                                                             PATIENT_ID) , 
             CONSTRAINT STAYS_BILLS_FK FOREIGN KEY(BILL_ID) REFERENCES BIL.BILLS(
                                                                       BILL_ID)
                       );

-- PHONENUMBERS

CREATE TABLE BIL.PHONENUMBERS ( 
             PATIENT_ID INT NOT NULL , 
             PHONE      VARCHAR(12) NOT NULL , 
             CONSTRAINT PHONENUMBERS_PATIENTS_FK FOREIGN KEY(PATIENT_ID) REFERENCES BIL.PATIENTS(
                                                                                    PATIENT_ID)
                              );

-- COSTCENTERS

CREATE TABLE BIL.COSTCENTERS ( 
             COSTCENTER_CODE INT NOT NULL , 
             COSTCENTER_NAME VARCHAR(50) NOT NULL , 
             CONSTRAINT COSTCENTER_CODE_PK PRIMARY KEY(COSTCENTER_CODE)
                             );

-- ITEMS

CREATE TABLE BIL.ITEMS ( 
             ITEM_CODE   INT NOT NULL , 
             DESCRIPTION VARCHAR(50) NOT NULL , 
             PRICE       INT NOT NULL , 
             CONSTRAINT ITEM_CODE_PK PRIMARY KEY(ITEM_CODE)
                       );

-- ORDERS

CREATE TABLE BIL.ORDERS ( 
             ORDER_ID        INT NOT NULL , 
             ORDER_DATE      DATE NOT NULL , 
             COSTCENTER_CODE INT NOT NULL , 
             ITEM_CODE       INT NOT NULL , 
             STAY_ID         INT NOT NULL , 
             CONSTRAINT ORDERS_PK PRIMARY KEY(ORDER_ID) , 
             CONSTRAINT ORDERS_COSTCENTER_FK FOREIGN KEY(COSTCENTER_CODE) REFERENCES BIL.COSTCENTERS(
                                                                                     COSTCENTER_CODE) , 
             CONSTRAINT ORDERS_ITEMS_FK FOREIGN KEY(ITEM_CODE) REFERENCES BIL.ITEMS(
                                                                          ITEM_CODE) , 
             CONSTRAINT ITEMS_STAYS_FK FOREIGN KEY(STAY_ID) REFERENCES BIL.STAYS(
                                                                       STAY_ID)
                        );

COMMIT;

-- drop all tables

DROP TABLE BIL.PHONENUMBERS;
DROP TABLE BIL.ORDERS;
DROP TABLE BIL.STAYS;
DROP TABLE BIL.PATIENTS;
DROP TABLE BIL.BILLS;
DROP TABLE BIL.ITEMS;
DROP TABLE BIL.COSTCENTERS;
DROP TABLE BIL.ZIPCODES;

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


INSERT INTO  BIL.ZIPCODES ( 
       ZIPCODE, 
       CITY, 
       STATE
                         ) 
VALUES ( 
       80638 , 
       'Boulder' , 
       'Colorado'
       );

INSERT INTO BIL.PATIENTS ( 
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

INSERT INTO BIL.PHONENUMBERS ( 
       PATIENT_ID , 
       PHONE
                             ) 
VALUES ( 
       12345 , 
       '123-456-789'
       );

INSERT INTO BIL.PHONENUMBERS ( 
       PATIENT_ID , 
       PHONE
                             ) 
VALUES ( 
       12345 , 
       '002358953'
       );

INSERT INTO BIL.BILLS ( 
       BILL_ID , 
       BILLING_DATE
                      ) 
VALUES ( 
       1 , 
       CONVERT(DATE , '07/20/08')
       );

INSERT INTO BIL.STAYS ( 
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

INSERT INTO BIL.COSTCENTERS ( 
       COSTCENTER_CODE , 
       COSTCENTER_NAME
                            ) 
VALUES ( 
       100 , 
       'Room & Board'
       );

INSERT INTO BIL.ITEMS ( 
       ITEM_CODE , 
       DESCRIPTION , 
       PRICE
                      ) 
VALUES ( 
       2000 , 
       'Semi-prv room' , 
       200
       );

INSERT INTO BIL.ORDERS ( 
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
