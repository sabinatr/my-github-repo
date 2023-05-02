CREATE TABLE t_sabina_trcova_project_sql_primary_final 
SELECT cp.value AS price_value,
	cp.category_code,
	cp.date_from,
	cp.date_to,
	cpa.value AS wages_value,
	cpa.industry_branch_code,
	cpa.payroll_year
FROM czechia_price cp
JOIN czechia_payroll cpa
	ON YEAR(cp.date_from) = cpa.payroll_year 
WHERE cpa.value_type_code = '5958'
	AND cpa.unit_code = '200'
	AND cpa.calculation_code = '200'
	AND cpa.industry_branch_code IS NOT NULL 
ORDER BY payroll_year ASC ;