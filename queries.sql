--aficher tous les employés
SELECT *
FROM 
	employees;

-- nombre total d'employés
SELECT COUNT(*) 
FROM 
	employees;

--nombre total d'absences
SELECT COUNT(*) 
FROM 
	absences;

--employés triés par date d'embauche 
SELECT 
	employee_id, 
	first_name, 
	last_name, 
	hire_date
FROM 
	employees
ORDER BY 
	hire_date;

--effectif par département
SELECT 
	department_id, 
		COUNT (employee_id) AS effectif_par_departement
FROM
	employees
GROUP BY 
	department_id;

--absence par type d'absence 
SELECT	
	absence_type, 
		COUNT(absence_id) AS absences_par_type
FROM
	absences
GROUP BY
	absence_type;