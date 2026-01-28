COPY customers 
FROM '<DATA_PATH>/olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

COPY sellers 
FROM '<DATA_PATH>/olist_sellers_dataset.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

COPY products 
FROM '<DATA_PATH>/olist_products_dataset.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

COPY orders 
FROM '<DATA_PATH>/olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

COPY order_items 
FROM '<DATA_PATH>/order_items_dataset.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

COPY order_payments 
FROM '<DATA_PATH>/order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

COPY geolocation 
FROM '<DATA_PATH>/olist_geolocation_dataset.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';


COPY product_category_name_translation
FROM '<DATA_PATH>/product_category_name_translation_dataset.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';