USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/* Utilisation d'une table CTE */
/*******************************/
with T1 as (
	select avg(salaire) as moyenne from Employes
)
select nom, prenom, salaire, moyenne
	from Employes cross join T1
	where salaire > moyenne;
	
with T1 (moyenne) as (
	select avg(salaire) from Employes
)
select nom, prenom, salaire, moyenne
	from Employes cross join T1
	where salaire > moyenne;



