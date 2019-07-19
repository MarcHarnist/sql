USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*
MISE EN RELATION DES ENSEMBLES
*/

--JOINTURE
--syntaxe ANSI
--les services non associ�s � au moins 1 employ�
--ne figurent pas dans le r�sultat
select s.codeService, libelle, nom, prenom
	from [Services] s 
								--condition de jointure
		inner join Employes e on s.codeService = e.codeService;


--syntaxe simplifi�e
--les services non associ�s � au moins 1 employ�
--ne figurent pas dans le r�sultat
select s.codeService, libelle, nom, prenom
	from [Services] s, Employes e
	where 
		--condition de jointure
		s.codeService = e.codeService



		
		

--detail des cong�s pris par employ� en 2005
--ecriture ANSI
select nom, prenom, libelle, c.annee, nbJoursAcquis,mois, nbJoursPris
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
					inner join Conges_Mens cm on c.codeEmp = cm.codeEmp and
													c.annee = cm.annee
	where  c.annee = 2005
	order by e.codeService,nom,mois;


--ecriture simplifi�e
select nom, prenom, libelle, c.annee, nbJoursAcquis,mois, nbJoursPris
	from Employes e, [Services] s, Conges c, Conges_Mens cm
	where e.codeService = s.codeService and
			e.codeEmp = c.codeEmp and
			c.codeEmp = cm.codeEmp and
			c.annee = cm.annee and
			c.annee = 2005
	order by e.codeService,nom,mois;
	

	
