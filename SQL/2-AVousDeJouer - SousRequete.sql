USE GESTION_EMPLOYES;
GO

/*********************************************************************************/

--A VOUS DE JOUER


--l'employé le mieux payé par service
--version 1 : corrélée
select * 
	from Employes externe
	where salaire = (select MAX(salaire) 
						from Employes interne
						where interne.codeService = externe.codeService);

--version 2 : imbriquée
select * 
	from Employes
		inner join 
		(select codeservice, MAX(salaire) plusHautSalaire
				from Employes
				group by codeservice) T1 
		on employes.codeService = T1.codeService
	where Employes.salaire = T1.plusHautSalaire;
	
					
--les employés qui ont pris plus de congés que la moyenne en 2006
select nom, SUM(nbJoursPris) totalJoursPris , m.moyennecp
	from Employes e
			inner join Conges_Mens c on e.codeEmp = c.codeEmp
			cross join (select SUM(nbjourspris)/COUNT(distinct codeemp) moyennecp from Conges_Mens where annee=2006) m
	where annee = 2006
	group by nom, m.moyennecp
	having SUM(nbJoursPris) > m.moyennecp;

			