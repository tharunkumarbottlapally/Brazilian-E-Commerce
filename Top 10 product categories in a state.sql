SELECT 
    seller_state
    ,REPLACE(product_category_name_english,'_',' ') AS product_category
    ,COUNT(order_item_id) AS total_number_of_orders
FROM
    olist_order_items_dataset oid
        INNER JOIN
    olist_products_dataset opd ON opd.product_id = oid.product_id
        INNER JOIN
    product_category_name_translation pcnt ON opd.product_category_name = pcnt.product_category_name
        INNER JOIN
    olist_sellers_dataset osd ON osd.seller_id = oid.seller_id
WHERE seller_state = get_states('consoles_games')
GROUP BY     seller_state
    ,REPLACE(product_category_name_english,'_',' ')
ORDER BY total_number_of_orders DESC
LIMIT 10;

