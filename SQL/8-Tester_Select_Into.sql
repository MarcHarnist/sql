USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*
STOCKER LE RESULTAT D'UNE REQUETE
*/
--Notre problématique : lister les employés dont le salaire est superieur à la moyenne
-- Le résultat doit présenter le détail nom, prenom, salaire de chaque employé
-- tout en s'appuyant sur le résultat du calcul de la moyenne des salaires tout employé confondu

--Dans l'état actuel du cours, il nous est impossible de réaliser cela en 1 seule requête.
--Etape 1 : stocker le résultat du calcul de la moyenne du salaire des employes
--Etape 2 : sélectionner les employes dont le salaire est supérieur à la moyenne calculée

--Etape 1 :
select AVG(salaire) as moyenne
	into #T1	--table temporaire locale
	from Employes;

--select * from #T1;

--Etape 2 :
select nom, prenom, salaire, moyenne
	from Employes
	cross join #T1
	where salaire > moyenne;

drop table #T1;

