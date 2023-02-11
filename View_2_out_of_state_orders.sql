CREATE OR REPLACE VIEW out_of_state_orders AS
    SELECT 
        seller_state,
        out_of_state_orders / total_orders AS percent_out_of_state_orders,
        total_orders
    FROM
        (SELECT 
            seller_state,
                COUNT(A.order_id) AS total_orders,
                SUM(CASE
                    WHEN seller_state = customer_state THEN 1
                    ELSE 0
                END) AS in_state_orders,
                SUM(CASE
                    WHEN seller_state <> customer_state THEN 1
                    ELSE 0
                END) AS out_of_state_orders
        FROM
            olist_order_items_dataset A
        INNER JOIN olist_orders_dataset B ON A.order_id = B.order_id
        INNER JOIN olist_sellers_dataset C ON C.seller_id = A.seller_id
        INNER JOIN olist_customers_dataset D ON D.customer_id = B.customer_id
        GROUP BY seller_state) A
;