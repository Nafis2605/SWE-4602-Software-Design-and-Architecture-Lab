/* Task B1A */
alter table rating
    add column rater_id int;


/* Task B1B */

drop procedure add_rating;
delimiter //
create procedure add_rating(
    IN id_product int,
    IN rating_value int,
    IN customer_id int
)
begin
    INSERT INTO rating (rating.product_id,rating.value,rating.rater_id) values (id_product,rating_value,customer_id);
end;//
delimiter ;

/* This is for testing procedure */

Call add_rating(6,4,10);
delete from rating order by id desc limit 1;

/* Task B1C */

drop procedure average_rating;
delimiter //
create procedure average_rating(
    IN id_product int,
    OUT average float
)
begin
    SELECT avg(value) as average
        from rating
        where rating.product_id=id_product
        group by id_product;
end;//
delimiter ;

/* This is for testing procedure */
Call average_rating(5, @average);

insert into _changelog(applied_at, created_by, filename) VALUE (now(), 'Nafis04', 'B1.sql');






