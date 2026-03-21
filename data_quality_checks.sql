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

