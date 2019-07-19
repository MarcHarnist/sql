USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*
PROJECTION et CALCUL D'AGREGAT
*/
--regroupement de lignes
select distinct prenom from Employes;
select prenom from Employes group by prenom;

--fonctions d'agrégat
select codeService,
		COUNT(*) as NbEmployes,
		COUNT(codechef) as NbEmployesAvecChefs,
		SUM(salaire) as MasseSalariale,
		AVG(salaire) as Moyenne,
		MIN(salaire) as PlusBasSalaire,
		MAX(salaire) as PlusHautSalaire
	from Employes
	group by codeService;

select * from employes;
select COUNT(*) from Employes;
--prise en compte des valeurs non nulles uniquement
select COUNT(CodeChef) from Employes;

--le codeservice n'est pas projeté mais est toujours utilisé
--pour le regroupement
select 	COUNT(*) as NbEmployes,
		SUM(salaire) as MasseSalariale,
		AVG(salaire) as Moyenne,
		MIN(salaire) as PlusBasSalaire,
		MAX(salaire) as PlusHautSalaire
	from Employes
	group by codeService;
	
--regroupement global, le group by n'est pas necessaire
select 	COUNT(*) as NbEmployes,
		SUM(salaire) as MasseSalariale,
		AVG(salaire) as Moyenne,
		MIN(salaire) as PlusBasSalaire,
		MAX(salaire) as PlusHautSalaire
	from Employes;
	
--limiter le nombre des lignes participantes au calcul d'agregat
select 	COUNT(*) as NbEmployes,
		SUM(salaire) as MasseSalariale,
		AVG(salaire) as Moyenne,
		MIN(salaire) as PlusBasSalaire,
		MAX(salaire) as PlusHautSalaire
	from Employes
	where UPPER(rtrim(codeService)) in ('RESHU','INFOR');
	
select codeService,
		COUNT(*) as NbEmployes,
		SUM(salaire) as MasseSalariale,
		AVG(salaire) as Moyenne,
		MIN(salaire) as PlusBasSalaire,
		MAX(salaire) as PlusHautSalaire
	from Employes
	where UPPER(rtrim(codeService)) in ('RESHU','INFOR')
	group by codeService;
	
--clause HAVING : restriction basée sur un calcul d'agregat
select codeService,
		COUNT(*) as NbEmployes,
		COUNT(codechef) as NbEmployesAvecChefs,
		SUM(salaire) as MasseSalariale,
		AVG(salaire) as Moyenne,
		MIN(salaire) as PlusBasSalaire,
		MAX(salaire) as PlusHautSalaire
	from Employes
	where UPPER(rtrim(codeService)) in ('RESHU','INFOR')
	group by codeService
	having SUM(salaire) > 5000;
	
--regroupement sur l'année d'embauche	
select DATEPART(yyyy,dateEmbauche) anneeEmbauche,
		COUNT(*) as NbEmployes,
		SUM(salaire) as MasseSalariale,
		AVG(salaire) as MoyenneSalaire,
		MIN(salaire) as PlusPetitSalaire,
		MAX(salaire) as PlusGrandSalaire
	from Employes
	where codeService in ('RESHU','INFOR')
	group by DATEPART(yyyy,dateEmbauche)
	order by 1 desc;