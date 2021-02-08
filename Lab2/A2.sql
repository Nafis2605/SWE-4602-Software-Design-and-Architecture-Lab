drop table  sale;
create table sale (
    sale_id int not null auto_increment primary key,
    customer_id int,
    product_id int ,
    unit_price float,
    count int,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

drop table employee;
create  table employee(
  employee_id int not null auto_increment primary key,
  name varchar(100)
);

drop table invoice;
create table invoice(
    invoice_id int not null auto_increment primary key,
    customer_id int,
    seller_id int ,
    date_time TIMESTAMP default now(),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (seller_id) REFERENCES employee(employee_id)
);

insert into _changelog(applied_at, created_by, filename) VALUE (now(), 'Nafis04', 'A2.sql');
