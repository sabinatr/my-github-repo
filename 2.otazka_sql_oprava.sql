/*
 * Otázka č.2 - Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
 * 
 * 114,201 - mléko
 * 111,301 - chléb
 */


SELECT ROUND(AVG(price_value),2) AS avg_price,
	payroll_year,
	category_code,
	AVG(value) AS avg_wages_value,
	ROUND(AVG(value)/ROUND(AVG(price_value),2)) AS purchase_total -- celková průměrná mzda za daný rok pro všechna odvětví dohromady / průměrná hodnota vybrané kategorie potravin
FROM t_sabina_trcova_project_sql_primary_final tstpspf  
WHERE category_code IN (114201, 111301)
	AND payroll_year IN (2006, 2018)
GROUP BY category_code, payroll_year 
	;


/*
 * Závěr: 
 * Rok 2006 - chléb - 1313 Kg
 * Rok 2018 - chléb - 1365 Kg
 * Rok 2006 - mléko - 1466 l
 * Rok 2018 - mléko - 1670 l
 */













