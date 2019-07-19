USE GESTION_EMPLOYES;
GO


/*********************************************************************************/

--A VOUS DE JOUER

--liste des employés pour qui il restait + de 10 jours à prendre en 2006
--écriture simplifiée
select nom, prenom,libelle,nbJoursAcquis, sum(nbJoursPris) TotalJoursPris
	from Employes e, [Services] s, Conges c, Conges_Mens cm
	where e.codeService = s.codeService and
			e.codeEmp = c.codeEmp and
			c.codeEmp = cm.codeEmp and
			c.annee = cm.annee and
			c.annee = 2006
	group by nom, prenom,libelle,nbJoursAcquis
	having nbJoursAcquis - SUM(nbjourspris) >= 10
	order by nom;

--ecriture ANSI	
select nom, prenom,libelle,nbJoursAcquis, sum(nbJoursPris) TotalJoursPris
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
					inner join Conges_Mens cm on c.codeEmp = cm.codeEmp and
													c.annee = cm.annee
	where  c.annee = 2006
	group by nom, prenom,libelle,nbJoursAcquis
	having nbJoursAcquis - SUM(nbjourspris) >= 10
	order by nom;