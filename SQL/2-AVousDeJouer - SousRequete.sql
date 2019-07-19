USE GESTION_EMPLOYES;
GO

/*********************************************************************************/

--A VOUS DE JOUER


--l'employ� le mieux pay� par service
--version 1 : corr�l�e
select * 
	from Employes externe
	where salaire = (select MAX(salaire) 
						from Employes interne
						where interne.codeService = externe.codeService);

--version 2 : imbriqu�e
select * 
	from Employes
		inner join 
		(select codeservice, MAX(salaire) plusHautSalaire
				from Employes
				group by codeservice) T1 
		on employes.codeService = T1.codeService
	where Employes.salaire = T1.plusHautSalaire;
	
					
--les employ�s qui ont pris plus de cong�s que la moyenne en 2006
select nom, SUM(nbJoursPris) totalJoursPris , m.moyennecp
	from Employes e
			inner join Conges_Mens c on e.codeEmp = c.codeEmp
			cross join (select SUM(nbjourspris)/COUNT(distinct codeemp) moyennecp from Conges_Mens where annee=2006) m
	where annee = 2006
	group by nom, m.moyennecp
	having SUM(nbJoursPris) > m.moyennecp;

			