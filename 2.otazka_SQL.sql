/*
 * Otázka č.2 - Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
 */

CREATE TABLE czechia_payroll_2
SELECT *
FROM czechia_payroll cp ;

CREATE TABLE czechia_price_2
SELECT *
FROM czechia_price cp ;

ALTER TABLE czechia_price_2 RENAME COLUMN id TO price_id;
ALTER TABLE czechia_price_2 RENAME COLUMN value TO price_value;

CREATE TABLE t_sabina_trcova_project_sql_primary_final
SELECT *
FROM czechia_price_2 AS cp2
JOIN czechia_payroll AS cpay ON cpay.payroll_year = YEAR(cp2.date_from);

/*
 * 114,201 - mléko
 * 111,301 - chléb
 */

SELECT *
FROM v_sql_project vsp ;


SELECT ROUND(AVG(price_value),2) AS avg_price,
	payroll_year,
	category_code,
	AVG(value) AS avg_value,
	ROUND(AVG(value)/ROUND(AVG(price_value),2)) AS kg_total
FROM t_sabina_trcova_project_sql_primary_final tstpspf  
WHERE category_code IN ('114201', '111301')
	AND payroll_year IN ('2006', '2018')
	AND value_type_code IN ('5958')
	AND unit_code IN ('200')
	AND calculation_code IN ('200')
GROUP BY category_code, payroll_year 
	;

/*
 * Závěr: 
 * Rok 2006 - chléb - 1308 Kg
 * Rok 2018 - chléb - 1363 Kg
 * Rok 2006 - mléko - 1460 l
 * Rok 2018 - mléko - 1667 l
 */













