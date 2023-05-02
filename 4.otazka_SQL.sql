/*
 * Otázka č. 4 - Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
 */

SELECT cpy.category_code, 
	cpy.`year`,
	cpy2.`year` AS year_prev,
	(cpy.avg_value - cpy2.avg_value) / cpy2.avg_value * 100 AS value_growth
FROM czechia_price_year cpy 
JOIN czechia_price_year cpy2 
	ON cpy.category_code = cpy2.category_code
	AND cpy.`year` = cpy2.`year` + 1
GROUP BY `year` , category_code ;


CREATE TABLE czechia_price_year
SELECT *, 
	round(avg(value),2) AS avg_value,
	YEAR(date_from) AS year
FROM czechia_price 
GROUP BY category_code, YEAR asc;


CREATE TABLE czechia_payroll_avg
SELECT value,
	payroll_year,
	round(avg(value)) AS avg_value_per_year
FROM czechia_payroll cp 
WHERE unit_code = '200'
AND value_type_code = '5958'
AND calculation_code = '200'
AND industry_branch_code IS NOT NULL 
GROUP BY payroll_year ;

SELECT *,
    (cpa.avg_value_per_year  - cpa2.avg_value_per_year) / cpa2.avg_value_per_year  * 100 AS value_growth
FROM czechia_payroll_avg cpa
JOIN czechia_payroll_avg cpa2
	ON cpa.payroll_year = cpa2.payroll_year + 1
WHERE cpa.payroll_year > '2006';

SELECT cpy.category_code, 
	cpy.`year`,
	cpy2.`year` AS year_prev,
	(cpy.avg_value - cpy2.avg_value) / cpy2.avg_value * 100 AS value_growth
FROM czechia_price_year cpy 
JOIN czechia_price_year cpy2 
	ON cpy.category_code = cpy2.category_code
	AND cpy.`year` = cpy2.`year` + 1
JOIN czechia_payroll_avg cpa 
GROUP BY `year` ;

/*
 * Meziroční nárůst mezi 2007/2008.
 */








