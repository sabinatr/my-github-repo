/* 
 * Otázka č.1 - Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
 */

SELECT payroll_year,
	value_type_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM t_sabina_trcova_project_sql_primary_final tstpspf 
GROUP BY industry_branch_code,
	payroll_year ;


/* 
 * Závěr:
 * 
 * Odvětví, která zaznamenala sebemenší meziroční pokles mzdy jsou: A, B, D, F, G, H, I, J, K, L, N, O, P
 * Odvětví, jejichž mzda meziročně pouze roste jsou: C, E, H, Q
 */