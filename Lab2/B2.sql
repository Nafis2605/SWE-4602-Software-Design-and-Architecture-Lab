/* Task B2A */

alter table sale add column seller_id int;
alter table sale add column category_id int;
alter table sale add column total_sale int;



/*
-- Dummy data for sale table

insert into sale (customer_id, product_id, unit_price, count, seller_id, category_id) VALUE (1,1,300,2,1,1);
insert into sale (customer_id, product_id, unit_price, count, seller_id, category_id) VALUE (1,2,500,3,2,1);
insert into sale (customer_id, product_id, unit_price, count, seller_id, category_id) VALUE (2,3,100,2,1,2);
insert into sale (customer_id, product_id, unit_price, count, seller_id, category_id) VALUE (3,4,500,1,1,2);
insert into sale (customer_id, product_id, unit_price, count, seller_id, category_id) VALUE (4,5,400,2,3,2);
insert into sale (customer_id, product_id, unit_price, count, seller_id, category_id) VALUE (3,6,800,1,3,3);
insert into sale (customer_id, product_id, unit_price, count, seller_id, category_id) VALUE (4,1,250,5,2,1);
insert into sale (customer_id, product_id, unit_price, count, seller_id, category_id) VALUE (3,2,600,2,2,1);

*/

/* Task B2B */

drop procedure get_sale_per_category;
delimiter //
create procedure get_sale_per_category(
    IN employee_id int,
    OUT category_sale int
)
begin
    update sale s
        set total_sale = unit_price*count
    where 1 = 1;
    SELECT category_id, sum(total_sale) as category_sale
    FROM sale
        where sale.seller_id = employee_id
        group by category_id
        order by category_id;
end;//
delimiter ;

/* This is for testing procedure */

Call get_sale_per_category(3,@total_sale);


/* Task B2C */

drop procedure set_product_category;
delimiter //
create procedure set_product_category(
    IN id_product int,
    IN id_category int
)
begin
    UPDATE product p
        SET category_id=id_category where id=id_product;
    UPDATE sale s
        SET category_id=id_category where product_id=id_product;
end;//
delimiter ;

/* This is for testing procedure */
Call set_product_category(1,5);
Call set_product_category(1,1);


insert into _changelog(applied_at, created_by, filename) VALUE (now(), 'Nafis04', 'B2.sql');



