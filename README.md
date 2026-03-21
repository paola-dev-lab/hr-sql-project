# 📊 Analyse SQL de données RH - Projet SIRH

## 🛠️ Environnement technique

- PostgreSQL
- SQL
- pgAdmin

## Fonctions spécifiques utilisées :

random()
generate_series()
AGE()
GROUP BY
ORDER BY
INNER JOIN()
AVG()

## Présentation

Ce projet consiste à modéliser et analyser un jeu de données RH à l'aide de SQL.

L'objectif est de démontrer comment SQL peut être utilisé pour :

- structurer des données RH dans une base relationnelle
- simuler un dataset RH réaliste
- analyser des indicateurs RH
- produire des requêtes analytiques
- vérifier la cohérence et la qualité des données

Le projet reproduit des problématiques courantes rencontrées dans les environnements **SIRH / HRIS**.

Les données utilisées sont simulées et représentent **un échantillon d'employés** afin de permettre l'exploration et l'analyse de données RH.

---

## Contexte métier

Entreprise fictive : **NovaTech**

L'entreprise dispose de plusieurs départements et suit les données RH de ses collaborateurs dans un système d'information RH.

Les équipes RH souhaitent exploiter les données du SIRH afin de produire des indicateurs de pilotage tels que :

- effectif par département
- répartition des collaborateurs
- ancienneté moyenne
- suivi des absences
- analyse de la structure organisationnelle

Ce projet simule ces données afin de reproduire des analyses RH typiques réalisées dans un environnement **HR analytics**.

---

## Modèle de données

La base de données repose sur une structure relationnelle composée des tables suivantes :

### `departments`
Référentiel des départements de l'entreprise.

| colonne |
|-------|
department_id  
department_name  

---

### `employees`
Informations collaborateurs.

| colonne |
|-------|
employee_id  
first_name  
last_name  
hire_date  
department_id  

---

### `absences`
Suivi des absences des collaborateurs.

| colonne |
|-------|
absence_id  
employee_id  
start_date  
end_date  
absence_type  
 ---
 
## Structure du projet
``` 
├── schema.sql
├── seed.sql
├── queries.sql
├── hr_analysis.sql
├── data_quality_checks.sql
└── README.md
 ```
 ---

 ## 📈 Analyses réalisées
 
 - Effectif par département

```
SELECT
    d.department_name,
    COUNT(e.employee_id) AS effectif
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name;
```

**Insight** : permet d’identifier la répartition des effectifs et les départements les plus représentés.

Absences par département

```
SELECT
    d.department_name,
    COUNT(*) AS absences
FROM absences a
JOIN employees e
    ON a.employee_id = e.employee_id
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name;
```

**Insight** : permet de détecter les départements présentant un niveau d’absentéisme plus élevé.

Ancienneté des employés

```
SELECT
    first_name,
    last_name,
    AGE(CURRENT_DATE, hire_date) AS anciennete
FROM employees;
```
**Insight** : l’ancienneté permet d’analyser la rétention des collaborateurs et d’identifier les profils expérimentés.

# 🔍 Contrôles de qualité des données

Requêtes mises en place pour vérifier la cohérence des données :

-- employés sans date d'embauche (anomalie)
SELECT *
FROM employees
WHERE hire_date IS NULL;

-- absences sans employé associé (anomalie de relation)
SELECT *
FROM absences
WHERE employee_id IS NULL;

-- absences avec date incohérente
SELECT *
FROM absences
WHERE end_date < start_date;

**Objectif** : garantir l’intégrité des données et identifier les anomalies pouvant impacter les analyses.

# 💡 Insights clés

- La répartition des effectifs permet d’identifier les départements dominants dans l’organisation.
- L’analyse des absences met en évidence des différences potentielles d’absentéisme entre départements.
- L’ancienneté moyenne des collaborateurs est un indicateur clé de rétention et de stabilité organisationnelle.

## Compétences mises en œuvre

- SQL
- modélisation de données
- analyse de données RH
- jointures et agrégations
- calcul d'indicateurs RH
- contrôle de qualité des données
- structuration d'un projet data

---

# 🚀 Perspectives d’amélioration

- Intégration des données de contrats et de rémunération
- Ajout d’indicateurs RH avancés (turnover, taux d’absentéisme)
- Connexion à un outil de visualisation (Power BI / Tableau)
- Automatisation des analyses via scripts SQL ou pipeline data
---
## Auteur
Projet réalisé dans le cadre d'un portfolio orienté **SIRH / HR Tech / analyse de données RH**.
