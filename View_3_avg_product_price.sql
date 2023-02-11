CREATE OR REPLACE VIEW avg_product_price AS
    SELECT 
        product_category_name_english,
        FORMAT(AVG(price), 2) AS average_price
    FROM
        olist_order_items_dataset A
            LEFT JOIN
        olist_products_dataset C ON C.product_id = A.product_id
            LEFT JOIN
        product_category_name_translation D ON D.product_category_name = C.product_category_name
    GROUP BY product_category_name_english;