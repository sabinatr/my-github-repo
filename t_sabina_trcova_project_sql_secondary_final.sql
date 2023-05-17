CREATE OR REPLACE TABLE t_sabina_trcova_project_sql_secondary_final 
SELECT e.country,
	e.gini,
	e.population,
	e.GDP, 
	e.`year` AS `year`,
	e2.`year` AS year_previous,
	(e.gdp - e2.gdp) / e2.gdp * 100 AS gdp_growth
FROM economies e 
JOIN countries c 
	ON e.country = c.country 
JOIN economies e2 
	ON e.`year` = e2.`year` + 1
	AND e.country = e2.country 
WHERE c.continent = 'Europe'
	AND e.`year` > 2005
	AND e.`year` < 2019;






	
