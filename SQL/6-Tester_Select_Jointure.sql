USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*
MISE EN RELATION DES ENSEMBLES
*/

--JOINTURE
--syntaxe ANSI
--les services non associés à au moins 1 employé
--ne figurent pas dans le résultat
select s.codeService, libelle, nom, prenom
	from [Services] s 
								--condition de jointure
		inner join Employes e on s.codeService = e.codeService;


--syntaxe simplifiée
--les services non associés à au moins 1 employé
--ne figurent pas dans le résultat
select s.codeService, libelle, nom, prenom
	from [Services] s, Employes e
	where 
		--condition de jointure
		s.codeService = e.codeService



		
		

--detail des congés pris par employé en 2005
--ecriture ANSI
select nom, prenom, libelle, c.annee, nbJoursAcquis,mois, nbJoursPris
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
					inner join Conges_Mens cm on c.codeEmp = cm.codeEmp and
													c.annee = cm.annee
	where  c.annee = 2005
	order by e.codeService,nom,mois;


--ecriture simplifiée
select nom, prenom, libelle, c.annee, nbJoursAcquis,mois, nbJoursPris
	from Employes e, [Services] s, Conges c, Conges_Mens cm
	where e.codeService = s.codeService and
			e.codeEmp = c.codeEmp and
			c.codeEmp = cm.codeEmp and
			c.annee = cm.annee and
			c.annee = 2005
	order by e.codeService,nom,mois;
	

	
