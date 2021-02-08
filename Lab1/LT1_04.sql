use kids_shop;

ALTER TABLE vote RENAME TO rating;

ALTER TABLE rating
ADD RatingValue float NOT NULL;

UPDATE rating
SET RatingValue=5
where is_up_vote=true;

UPDATE rating
SET RatingValue=0
where is_up_vote=false;

ALTER TABLE rating
DROP column is_up_vote;

ALTER TABLE product
RENAME COLUMN votes to average_rating;

ALTER TABLE product
MODIFY average_rating float(4);

ALTER TABLE product
DROP column Average_Rating;

ALTER TABLE product
ADD COLUMN Average_Rating float;

DROP PROCEDURE recalculate_product_votes;

CREATE PROCEDURE recalculate_product_votes()
    BEGIN
            UPDATE product
            SET product.Average_Rating= (
            SELECT AVG(rating.RatingValue)
            FROM rating,product
            order by rating.product_id
            )
        WHERE
            rating.product_id = product.id;
    END

