/*
 * Otázka č. 4 - Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
 */

WITH zjednoduseni AS (
	SELECT payroll_year,
		round(avg(price_value),2) AS avg_price_value,
		round(avg(value),2) AS avg_value
	FROM t_sabina_trcova_project_sql_primary_final tstpspf 
	GROUP BY payroll_year
)
SELECT zkm2.payroll_year AS year_previous,
	zkm.payroll_year AS 'year',
	(zkm.avg_price_value - zkm2.avg_price_value) / zkm2.avg_price_value * 100 AS price_value_growth,
	(zkm.avg_value - zkm2.avg_value) / zkm2.avg_value * 100 AS value_wages_growth
FROM zjednoduseni zkm
JOIN zjednoduseni zkm2
	ON zkm.payroll_year = zkm2.payroll_year + 1
;

/*
 * V žádném roce nebyl nárůst cen potravin vyšší o 10% oproti nárůstu mezd.
 */








