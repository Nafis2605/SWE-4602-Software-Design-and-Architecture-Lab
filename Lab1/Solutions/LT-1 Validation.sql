-- clean up
drop database if exists kids_shop;

-- initialize
create database kids_shop;
use kids_shop;

create table category (
    id int not null auto_increment primary key,
    name varchar(100)
);

create table product (
    id int not null auto_increment primary key,
    name varchar(100),
    category_id int not null,
    votes int not null default 0
);

create table vote (
    id int not null auto_increment primary key,
    product_id int not null,
    is_up_vote bit
);

delimiter //
create procedure recalculate_product_votes()
begin
    update product p
        set votes =
            (select count(*) from vote where product_id = p.id and is_up_vote = true)
            - (select count(*) from vote where product_id = p.id and is_up_vote = false)
    where 1 = 1;
end;//
delimiter ;

-- insert seed data
use kids_shop;

insert into category (name) values
    ('toys'),
    ('cloths'),
    ('diaper');

insert into product (name, category_id) values
    ('light ball', 1),
    ('blocks', 1),
    ('cool red shirt', 2),
    ('long blue skirt', 2),
    ('nice green pants', 2),
    ('kids comfi', 3);

insert into vote(product_id, is_up_vote) values
    (1, true),
    (1, true),
    (1, false),
    (2, false),
    (2, false),
    (3, true),
    (3, true),
    (5, false),
    (5, true),
    (5, true),
    (5, true);

call recalculate_product_votes();

-- -----------------------------------
-- -----------------------------------
-- PASTE STUDENTS CODE BELOW THIS LINE


-- PASTE STUDENT'S CODE ABOVE THIS LINE
-- ------------------------------------------
-- ------------------------------------------
-- ------------------------------------------

-- ------------------------ validate ----------------------

drop function if exists tableExists;
drop function if exists columnExists;

SET GLOBAL log_bin_trust_function_creators = 1;

create function tableExists(name varchar(100)) returns bit
begin
    return EXISTS(select * from information_schema.TABLES where TABLE_SCHEMA = 'kids_shop' and TABLE_NAME = name limit 1);
end;

create function columnExists(tableName varchar(100), columnName varchar(100)) returns bit
begin
    return EXISTS(
        select * from information_schema.COLUMNS where
            TABLE_SCHEMA = 'kids_shop' and
            TABLE_NAME = tableName and
            COLUMN_NAME = columnName
        limit 1);
end;


create function assertProductRatingNull(name varchar(100)) returns bit
begin
    return EXISTS(
        select * from product where name = name and average_rating is null limit 1
    );
end;

create function assertProductRating(name varchar(100), averageRating float) returns bit
begin
    return EXISTS(
        select * from product where name = name and abs(average_rating - averageRating) < 1 limit 1
    );
end;


--

select * from information_schema.TABLES where TABLE_SCHEMA = 'kids_shop';

set @float_data_migrated := assertProductRating('light ball', 3.66667);
set @int_data_migrated:= assertProductRating('blocks', 1) and
                         assertProductRating('cool red shirt', 5) and
                         assertProductRating('nice green pants', 4);
set @nullDataMigrated := assertProductRatingNull('long blue skirt') and
                         assertProductRatingNull('kids comfi');

set @data_count_ok := (select count(*) from product) = 6
                          and (select count(*) from rating) = 11
                          and (select count(*) from category) = 3;
set @rating_table_renamed := tableExists('rating') and !tableExists('vote');
set @product_rating_column_added := columnExists('product', 'average_rating');


set @upvote_column_dropped := !columnExists('rating', 'is_up_vote');
set @product_votes_column_dropped := !columnExists('product', 'votes');

select @float_data_migrated, @int_data_migrated, @nullDataMigrated, @data_count_ok, @product_rating_column_added, @rating_table_renamed, @upvote_column_dropped, @product_votes_column_dropped;

-- Each of the columns in this select statement gives zero or one. You get zero marks for returning zero, you get marks as mentioned below if you get a 1.
-- float_data_migrated:          1.0
-- int_data_migrated:            2.0
-- nullDataMigrated:             1.0
-- data_count_ok:                2.0
-- product_rating_column_added:  2.0
-- rating_table_renamed:         1.0
-- upvote_column_dropped:        0.5
-- product_votes_column_dropped: 0.5
