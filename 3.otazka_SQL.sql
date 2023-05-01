/*
Otázka č.3 - Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
*/

CREATE TABLE czechia_price_year
SELECT *, 
	round(avg(value),2) AS avg_value,
	YEAR(date_from) AS year
FROM czechia_price 
GROUP BY category_code, YEAR asc;


/*
 * Vytvořen pomocný view z důvodu rychlejšího načítání dat než z tabulky.
 */
CREATE OR REPLACE VIEW v_czechia_price_year AS
SELECT cpy.category_code, 
	cpy.`year`,
	cpy2.`year` AS year_prev,
	(cpy.avg_value - cpy2.avg_value) / cpy2.avg_value * 100 AS value_growth
FROM czechia_price_year cpy 
JOIN czechia_price_year cpy2 
	ON cpy.category_code = cpy2.category_code
	AND cpy.`year` = cpy2.`year` + 1
GROUP BY `year` , category_code ;


SELECT *
FROM v_czechia_price_year ;


SELECT category_code,
	sum(value_growth) AS sum_growth_value
FROM v_czechia_price_year
GROUP BY category_code
ORDER BY sum_growth_value ASC ;

SELECT *
FROM czechia_price_category cpc ;

/*
 * Nejpomaleji zdražuje položka 118,101 - Cukr krystalový
 */
