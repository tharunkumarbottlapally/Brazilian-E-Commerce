
use  final;

INSERT INTO final.population_growth (customer_state,pop_year,pop_growth_rate) 
VALUES ('NC', 20016, '-0.019');

INSERT INTO final.population_growth (customer_state,pop_year,pop_growth_rate) 
VALUES ('NC', 2023, '-0.019');


UPDATE final.olist_customers_dataset
SET customer_state ='NC'
WHERE customer_id ='fc7d4defa8e1ac093d000adc4a69f9kd';

UPDATE final.olist_customers_dataset
SET customer_state ='NC' AND customer_zip_code_prefix ='111111111111111111111111111111111111111111111555555555555555555555555555555555555555555555555555'
WHERE customer_id ='fc7d4defa8e1ac093d000adc4a69f9kd';

DELETE FROM final.olist_customers_dataset
WHERE customer_id ='fc7d4defa8e1ac093d000adc4a69f9kd';

DELETE FROM final.olist_customers_dataset
WHERE customer_id ='fc7d4defa8e1ac093d000adcdsaa4a69thaed';

SELECT * FROM final.olist_order_items_dataset;

USE final;
DROP PROCEDURE IF EXISTS pop_growth;
 
DELIMITER //
 
CREATE PROCEDURE pop_growth()
BEGIN
  DECLARE total_pop_growth_var DECIMAL(9,4);
SELECT 
    SUM(pop_growth_rate)
INTO total_pop_growth_var FROM
    population_growth
WHERE
    customer_state = GET_STATES('consoles_games');

SELECT 
    GET_STATES('consoles_games') as state,
    CONCAT(FORMAT(total_pop_growth_var * 100, 2),'%') AS growth_rate_over_time;

END//

DELIMITER ;
 
CALL pop_growth();


