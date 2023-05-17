/*
 * Otázka č.5 - Má výška HDP vliv na změny ve mzdách a cenách potravin? 
 * Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách 
 * ve stejném nebo násdujícím roce výraznějším růstem?
 */

WITH zjednoduseni AS (
	SELECT tstpspf.payroll_year,
		round(avg(tstpspf.price_value),2) AS avg_price_value,
		round(avg(tstpspf.value),2) AS avg_value,
		tssf.gdp_growth
	FROM t_sabina_trcova_project_sql_primary_final tstpspf 
	JOIN t_sabina_trcova_project_sql_secondary_final tssf
		ON tstpspf.payroll_year = tssf.year 
	WHERE tssf.country = 'Czech Republic'
	GROUP BY tstpspf.payroll_year
)
SELECT zkm2.payroll_year AS year_previous,
	zkm.payroll_year AS 'year',
	(zkm.avg_price_value - zkm2.avg_price_value) / zkm2.avg_price_value * 100 AS price_value_growth,
	(zkm.avg_value - zkm2.avg_value) / zkm2.avg_value * 100 AS value_wages_growth,
	zkm.gdp_growth
FROM zjednoduseni zkm
JOIN zjednoduseni zkm2
	ON zkm.payroll_year = zkm2.payroll_year + 1;
	
/*
 * V datech není vidět prokazatelná souvislost změny HDP na ceny potravin nebo mezd.
 * Např. mezi roky 2012 a 2013 HDP pokleslo a i přesto mzdy a ceny potravin 2013/2014
 * vzrostly.
 */