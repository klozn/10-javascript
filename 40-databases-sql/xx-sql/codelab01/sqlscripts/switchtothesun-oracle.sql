create table CONTINENT
(
    ID   number       not null,
    NAME VARCHAR2(64) NOT NULL UNIQUE,
    CONSTRAINT PK_CONTINENT primary key (ID)
);
create sequence continent_seq start with 1 increment by 1;

create table COUNTRY
(
    ID              NUMBER       NOT NULL,
    NAME            VARCHAR2(64) NOT NULL UNIQUE,
    FK_CONTINENT_ID NUMBER,
    CONSTRAINT FK_COUNTRY_CONTINENT foreign key (FK_CONTINENT_ID) references CONTINENT (ID),
    CONSTRAINT PK_COUNTRY primary key (ID)
);
create sequence country_seq start with 1 increment by 1;

create table ATTRACTION
(
    ID            NUMBER       NOT NULL,
    NAME          varchar2(64) NOT NULL,
    TYPE          varchar2(64) NOT NULL,
    FK_COUNTRY_ID NUMBER       NOT NULL,
    CONSTRAINT FK_ATTRACTION_COUNTRY foreign key (FK_COUNTRY_ID) references COUNTRY (ID),
    CONSTRAINT PK_ATTRACTION primary key (ID)

);
create sequence attraction_seq start with 1 increment by 1;

create table TOURIST
(
    ID   NUMBER       NOT NULL,
    NAME varchar2(64) NOT NULL,
    CONSTRAINT PK_TOURIST primary key (ID)
);
create sequence tourist_seq start with 1 increment by 1;

create table metadata
(
    ID               NUMBER not null,
    NUMBER_OF_VISITS NUMBER not null,
    CONSTRAINT PK_METADATA PRIMARY KEY (ID)
);

insert into CONTINENT(ID, NAME)
VALUES (continent_seq.nextval, 'Europe');
insert into CONTINENT(ID, NAME)
VALUES (continent_seq.nextval, 'Asia');
insert into CONTINENT(ID, NAME)
VALUES (continent_seq.nextval, 'Africa');
insert into CONTINENT(ID, NAME)
VALUES (continent_seq.nextval, 'North America');
insert into CONTINENT(ID, NAME)
VALUES (continent_seq.nextval, 'South America');
insert into CONTINENT(ID, NAME)
VALUES (continent_seq.nextval, 'Australia');

insert into COUNTRY(ID, NAME, FK_CONTINENT_ID)
values (country_seq.nextval, 'France', (select id from CONTINENT where NAME = 'Europe'));
insert into COUNTRY(ID, NAME, FK_CONTINENT_ID)
values (country_seq.nextval, 'Italy', (select id from CONTINENT where NAME = 'Europe'));
insert into COUNTRY(ID, NAME, FK_CONTINENT_ID)
values (country_seq.nextval, 'Spain', (select id from CONTINENT where NAME = 'Europe'));
insert into COUNTRY(ID, NAME, FK_CONTINENT_ID)
values (country_seq.nextval, 'Kenya', (select id from CONTINENT where NAME = 'Africa'));
insert into COUNTRY(ID, NAME, FK_CONTINENT_ID)
values (country_seq.nextval, 'India', (select id from CONTINENT where NAME = 'Asia'));
insert into COUNTRY(ID, NAME, FK_CONTINENT_ID)
values (country_seq.nextval, 'United States', (select id from CONTINENT where NAME = 'North America'));

insert into ATTRACTION(id, name, type, fk_country_id)
values (attraction_seq.nextval, 'The Eifel Tower', 'MONUMENT', (select id from COUNTRY where NAME = 'France'));
insert into ATTRACTION(id, name, type, fk_country_id)
values (attraction_seq.nextval, 'Côte d''azur', 'BEACH', (select id from COUNTRY where NAME = 'France'));
insert into ATTRACTION(id, name, type, fk_country_id)
values (attraction_seq.nextval, 'The Colosseum', 'MONUMENT', (select id from COUNTRY where NAME = 'Italy'));
insert into ATTRACTION(id, name, type, fk_country_id)
values (attraction_seq.nextval, 'Venice', 'CITY', (select id from COUNTRY where NAME = 'Italy'));
insert into ATTRACTION(id, name, type, fk_country_id)
values (attraction_seq.nextval, 'Seville', 'CITY', (select id from COUNTRY where NAME = 'Spain'));

insert into metadata(ID, NUMBER_OF_VISITS)
values (0, 0);

-- drop table TOURIST;
-- drop sequence tourist_seq;
-- drop table ATTRACTION;
-- drop sequence attraction_seq;
-- drop table COUNTRY;
-- drop sequence country_seq;
-- drop TABLE CONTINENT;
-- drop sequence continent_seq;
-- drop table metadata;
