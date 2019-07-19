USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/* Opérateurs UNION, INTERSECT, EXCEPT */
/***************************************/
select distinct Employes.codeService, libelle
	from Employes inner join [Services] on Employes.codeService = [Services].codeService
union --all
select codeservice, libelle
	from [Services];
	

--détail des jours pris par Edmond Bosapin en 2005 + présentation du résultat
select nom, prenom, libelle, convert(char,c.annee) annee, 
		convert(char,nbJoursAcquis) nbJoursAcquis, 
		convert(char,mois) mois, convert(char,nbJoursPris) nbJoursPris
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
					left outer join Conges_Mens cm on c.codeEmp = cm.codeEmp and
													c.annee = cm.annee
	where  c.annee = 2005 and nom = 'Bosapin'
union
select '', '', '', '', '','Total', sum(nbJoursPris)
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
					left outer join Conges_Mens cm on c.codeEmp = cm.codeEmp and
													c.annee = cm.annee
	where  c.annee = 2005 and nom = 'Bosapin'
	order by mois;


--liste des services sans employés
--ATTENTION Les alias sont placés sur le 1er Select, le tri toujours sur le
--dernier
select codeservice as service from [services]
except
select distinct codeservice from Employes
order by codeService desc;

--équivalent à
select codeservice as service 
	from [services] where codeservice not in (select distinct codeservice from Employes);