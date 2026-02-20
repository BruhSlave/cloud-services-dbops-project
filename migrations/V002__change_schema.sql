DROP TABLE orders_date;
DROP TABLE product_info;

ALTER TABLE product 
ADD COLUMN price DOUBLE PRECISION;

ALTER TABLE orders  
ADD COLUMN date_created DATE;



