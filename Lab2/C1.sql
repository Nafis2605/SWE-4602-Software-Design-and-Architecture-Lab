/* Task C1A */

CREATE TABLE reporting_category(
    category_id int not null auto_increment primary key,
    category_name varchar(100),
    category_average_rating float
);
/*
Dummy Data for reporting category

INSERT reporting_category(category_name, category_average_rating) values ('toy',3.5);
INSERT reporting_category(category_name, category_average_rating) values ('dress',4.5);
INSERT reporting_category(category_name, category_average_rating) values ('food',4);
*/


CREATE TABLE reporting_product(
    product_id int not null auto_increment primary key,
    product_name varchar(100),
    product_average_rating float
);

/*
Dummy Data for reporting product

INSERT reporting_product(product_name, category_id, product_average_rating) values ('car',1,4.5);
INSERT reporting_product(product_name, category_id, product_average_rating) values ('bat',1,5);
INSERT reporting_product(product_name, category_id, product_average_rating) values ('frock',2,3.5);
INSERT reporting_product(product_name, category_id, product_average_rating) values ('shirt',2,4.3);
INSERT reporting_product(product_name, category_id, product_average_rating) values ('milk',3,4.67);
INSERT reporting_product(product_name, category_id, product_average_rating) values ('cheese',3,4);
*/


CREATE TABLE reporting_rating(
    rating_id int not null auto_increment primary key,
    rater_id varchar(100),
    product_id int,
    category_id int,
    rating_value int not null,
    timestamp TIMESTAMP default now()
);

/*

Dummy Data for reporting rating

INSERT reporting_rating(rater_id, product_id, category_id, rating_value) values (1,1,1,3);
INSERT reporting_rating(rater_id, product_id, category_id, rating_value) values (2,1,1,4);
INSERT reporting_rating(rater_id, product_id, category_id, rating_value) values (2,1,1,2);
INSERT reporting_rating(rater_id, product_id, category_id, rating_value) values (3,2,1,3);
INSERT reporting_rating(rater_id, product_id, category_id, rating_value) values (1,3,2,4);
INSERT reporting_rating(rater_id, product_id, category_id, rating_value) values (1,3,2,3);
INSERT reporting_rating(rater_id, product_id, category_id, rating_value) values (2,4,2,1);
INSERT reporting_rating(rater_id, product_id, category_id, rating_value) values (3,5,3,3);
*/

CREATE TABLE reporting_sale(
    sale_id int not null auto_increment primary key,
    category_id int,
    product_id int,
    rating_id int,
    timestamp TIMESTAMP default now(),
    FOREIGN KEY (category_id) REFERENCES reporting_category(category_id),
    FOREIGN KEY (product_id) REFERENCES reporting_product(product_id),
    FOREIGN KEY (rating_id) REFERENCES reporting_rating(rating_id)
);


/* Task C1B */
drop procedure get_top_3_products;
delimiter //
create procedure get_top_3_products()
begin
    SELECT product_name
    FROM reporting_product
    ORDER BY product_average_rating DESC LIMIT 3;
end;//
delimiter ;

/* This is for testing procedure */
Call get_top_3_products();


/* Task C1C */
drop procedure get_top_2_categories;
delimiter //
create procedure get_top_2_categories()
begin
    SELECT category_name
    FROM reporting_category
    ORDER BY category_average_rating DESC LIMIT 2;
end;//
delimiter ;

/* This is for testing procedure */
Call get_top_2_categories();


/* Task C1D */
drop procedure get_frequent_rater;
delimiter //
create procedure get_frequent_rater()
begin
    SELECT rater_id
    FROM reporting_rating
    group by rater_id
    ORDER BY count(rater_id) DESC LIMIT 1;
end;//
delimiter ;

/* This is for testing procedure */
Call get_frequent_rater();



/* Task C1F */
drop procedure get_top_product_by_category;
delimiter //
create procedure get_top_product_by_category(
    IN id_category int
)
begin
    SELECT product_id
    FROM reporting_rating
    where reporting_rating.category_id=id_category
    group by product_id
    ORDER BY avg(rating_value) DESC LIMIT 1;
end;//
delimiter ;

/* This is for testing procedure */
Call get_top_product_by_category(1);


/* Task C1G */
drop procedure populate_reporting_db;
delimiter //
create procedure populate_reporting_db()
begin

end;//
delimiter ;

/* This is for testing procedure */
Call populate_reporting_db();

insert into _changelog(applied_at, created_by, filename) VALUE (now(), 'Nafis04', 'C1.sql');


