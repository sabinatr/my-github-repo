/*
Otázka č.3 - Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
*/

-- řešeno přes WITH kvůli rychlosti načítání dotazů

WITH zjednoduseni_kategorie AS (  
	SELECT category_code,
		round(avg(price_value),2) AS avg_price_value,
		payroll_year
	FROM t_sabina_trcova_project_sql_primary_final tstpspf 
	GROUP BY payroll_year, category_code
)
SELECT zk.category_code,
	sum((zk.avg_price_value - zk2.avg_price_value) / zk2.avg_price_value * 100) AS value_growth
FROM zjednoduseni_kategorie zk
JOIN zjednoduseni_kategorie zk2
	ON zk.category_code = zk2.category_code
	AND zk.payroll_year = zk2.payroll_year + 1
GROUP BY zk.category_code
ORDER BY value_growth;

/*
 * Nejpomaleji zdražuje položka 118,101 - Cukr krystalový
 */

