DROP FUNCTION IF EXISTS get_states;

DELIMITER //

CREATE FUNCTION get_states
(
   state_param TEXT
)
RETURNS TEXT
DETERMINISTIC READS SQL DATA
BEGIN
  DECLARE state_var TEXT;
  SELECT seller_state
  INTO state_var
  FROM top_states_by_product
  WHERE product_category_name_english = state_param;
  
  RETURN(state_var);
END//

DELIMITER ;
