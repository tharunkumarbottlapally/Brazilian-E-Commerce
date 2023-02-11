USE brazillian_dataset;
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