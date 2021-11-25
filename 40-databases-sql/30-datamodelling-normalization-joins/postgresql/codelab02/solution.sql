create schema BILL;

create table bill.ZIP
(
    zipcode int not null
        constraint zip_pk
            primary key,
    city text not null,
    state text not null
);

create table bill.address
(
    address_id int not null
constraint address_pk
primary key ,
    street_number text not null,
    zipcode int
constraint zipcode_fk foreign key
)

