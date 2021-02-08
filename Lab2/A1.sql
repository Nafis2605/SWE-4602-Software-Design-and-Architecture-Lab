drop table  customer;
create table customer (
    customer_id int not null auto_increment primary key,
    name varchar(100)
);

alter table rating
    add column timestamp TIMESTAMP default now();

insert into _changelog(applied_at, created_by, filename) VALUE (now(), 'Nafis04', 'A1.sql');
