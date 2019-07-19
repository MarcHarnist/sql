USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*
STOCKER LE RESULTAT D'UNE REQUETE
*/
--Notre probl�matique : lister les employ�s dont le salaire est superieur � la moyenne
-- Le r�sultat doit pr�senter le d�tail nom, prenom, salaire de chaque employ�
-- tout en s'appuyant sur le r�sultat du calcul de la moyenne des salaires tout employ� confondu

--Dans l'�tat actuel du cours, il nous est impossible de r�aliser cela en 1 seule requ�te.
--Etape 1 : stocker le r�sultat du calcul de la moyenne du salaire des employes
--Etape 2 : s�lectionner les employes dont le salaire est sup�rieur � la moyenne calcul�e

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

