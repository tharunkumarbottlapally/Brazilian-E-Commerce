CREATE OR REPLACE VIEW top_states_by_product AS

	WITH ranked_states AS (
		SELECT product_category_name_english,seller_state,COUNT(ORDER_ITEM_ID) AS order_item_count
				,DENSE_RANK() OVER(PARTITION BY product_category_name_english ORDER BY count(order_item_id) DESC) AS state_rank_by_product
		FROM olist_order_items_dataset A 
		LEFT JOIN olist_sellers_dataset B ON A.seller_id=B.seller_id
		LEFT JOIN olist_products_dataset C ON C.product_id=A.product_id
		LEFT JOIN product_category_name_translation D ON D.product_category_name=C.product_category_name
  
		GROUP BY product_category_name_english,seller_state
		HAVING count(order_item_id)>1
		ORDER BY product_category_name_english,COUNT(ORDER_ITEM_ID)DESC) 
	SELECT *
	FROM ranked_states
	WHERE state_rank_by_product=1;