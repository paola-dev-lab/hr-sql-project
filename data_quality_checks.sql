-- Objectif : contrôler la qualité des données RH avant analyse.
-- Contexte métier : ces vérifications permettent d’identifier
-- les valeurs manquantes, incohérences et anomalies potentielles
-- susceptibles d’altérer la fiabilité des indicateurs RH.

--employées sans départment 
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees
WHERE
	department_id IS NULL;

-- employées sans date d'embauche
SELECT
	employee_id,
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	hire_date IS NULL;

--absences sans employée
SELECT
	absence_id,
	employee_id
FROM
	absences
WHERE
	employee_id IS NULL;