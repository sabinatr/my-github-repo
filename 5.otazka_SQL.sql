/*
/ Otázka č.5 - Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
*/

CREATE TABLE economies_CZ
SELECT *
FROM economies e
WHERE country = 'Czech Republic'
AND `year` > 2005;


CREATE TABLE economies_GDP
SELECT ec.`year` ,
	ec2.`year` AS year_prev,
	(ec.GDP - ec2.GDP) / ec2.GDP * 100 AS GDP_growth 
FROM economies_cz ec 
JOIN economies_cz ec2 
	ON ec.`year` = ec2.`year` +1
ORDER BY ec.`year` ;

CREATE TABLE czechia_price_gdp
SELECT cpy.category_code, 
	cpy.`year`,
	cpy2.`year` AS year_prev,
	(cpy.avg_value - cpy2.avg_value) / cpy2.avg_value * 100 AS value_growth
FROM czechia_price_year cpy 
JOIN czechia_price_year cpy2 
	ON cpy.category_code = cpy2.category_code
	AND cpy.`year` = cpy2.`year` + 1
GROUP BY `year` ;

CREATE TABLE czechia_payroll_gdp
SELECT cpa.payroll_year,
	cpa2.payroll_year AS year_previous,
    (cpa.avg_value_per_year  - cpa2.avg_value_per_year) / cpa2.avg_value_per_year  * 100 AS value_growth
FROM czechia_payroll_avg cpa
JOIN czechia_payroll_avg cpa2
	ON cpa.payroll_year = cpa2.payroll_year + 1
WHERE cpa.payroll_year > '2006';

SELECT egdp.year_prev,
	egdp.YEAR,
	egdp.GDP_growth,
	cpgdp.value_growth AS food_growth,
	cpagdp.value_growth AS wages_growth
FROM economies_gdp AS egdp
JOIN czechia_price_gdp AS cpgdp
	ON egdp.year_prev = cpgdp.year_prev
JOIN czechia_payroll_gdp AS cpagdp
	ON egdp.year_prev = cpagdp.year_previous;

/*
 * Není prokazatelný vztah mezi výšku HDP a vlivem na cenu potravin a výši mezd.
 */

