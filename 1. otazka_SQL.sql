SELECT DISTINCT industry_branch_code  
FROM czechia_payroll cp ;


/* 
 * V oborou A - Zemědělství, lesnictví, rybářství mzda od roku 2000 meziročně rostla, zlom nastal v roce 2020, kdy průměrná. hrubá mzda byla vyšší než v následujícím roce 2021, minimální výkyv také nastal v letech 2008-2009.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'A'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/* 
 * V oborou B - Těžba a dobývání průměrná mzda rosta do roku 2012, poté klesla. Další malý výkyv nastal v letech 2015 a 2016, od té doby znovu roste.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'B'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/* 
 * V oborou C - Zpracovatelský průmysl mzda v letech 2000-2021 meziročně roste.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'C'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru D - Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu průměrná mzda kolísala v letech 2012-2015, od té doby postupně roste.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'D'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru E - Zásobování vodou; činnosti související s odpady a sanacemi průměrná mzda v letech 2000-2021 meziročně roste.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'E'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru F - Stavebnictví průměrná mzda až na malé výkyvy v letech 2013 a 2021 meziročně roste.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'F'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru G - Velkoobchod a maloobchod; opravy a údržba motorových vozidel průměrná mzda až na malý výkyv v roce 2013 meziročně roste.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'G'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru H - Doprava a skladování průměrná mzda až na minimální rozdíl 1 Kč po zaokrouhlení v roce 2011 meziročně roste, proto zahrnuto ve finálních shnutí mezi rostoucí trend.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'H'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru I - Ubytování, stravování a pohostinství nastal pokles v letech 2009, 2011, 2020 oproti předchozímu roku.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'I'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru J - Informační a komunikační činnosti průměrná mzda až na malý výkyv v roce 2013 meziročně roste.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'J'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru K - Peněžnictví a pojišťovnictví nastal pokles průměrné mzdy v roce 2013, poté postupně zase rostla.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'K'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru L - Ubytování, stravování a pohostinství nastal pokles v letech 2009, 2013 oproti předchozímu roku.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'L'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru M - Profesní, vědecké a technické činnosti nastal pokles v letech 2010, 2013 oproti předchozímu roku.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'M'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru N - Administrativní a podpůrné činnosti nastal pokles v roce 2013 oproti předchozímu roku, poté znovu rostoucí trend.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'N'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru O - Veřejná správa a obrana; povinné sociální zabezpečení nastal pokles v roce 2010 a 2021 oproti předchozím rokům.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'O'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru O - Vzdělávání nastal pokles v roce 2010 a 2021 oproti předchozím rokům.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'P'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/* 
 * V oborou Q - Zdravotní a sociální péče mzda v letech 2000-2021 meziročně roste.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'Q'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/*
 * V oboru R - Kulturní, zábavní a rekreační činnosti nastal pokles v roce 2013 a 2021 oproti předchozím rokům.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'R'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/* 
 * V oborou S - Ostatní činnosti mzda v letech 2000-2021 meziročně roste.
 */
SELECT payroll_year,
	value_type_code,
	unit_code,
	industry_branch_code, 
	ROUND(AVG(value)) AS round_value
FROM czechia_payroll cp 
WHERE industry_branch_code = 'S'
	AND value_type_code = '5958'
	AND unit_code = '200'
	AND calculation_code = '200'
GROUP BY payroll_year;

/* 
 * Závěr:
 * 
 * Odvětví, která zaznamenala sebemenší meziroční pokles mzdy jsou: A, B, D, F, G, H, I, J, K, L, N, O, P
 * Odvětví, jejichž mzda meziročně roste jsou: C, E, H, Q
 */