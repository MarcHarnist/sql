--1 : lister les employés et les jours acquis
select nom, prenom, libelle, annee, nbJoursAcquis
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp;




--2 : lister les employés et les jours acquis pour l'année 2006
select nom, prenom, libelle, annee, nbJoursAcquis
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
	where c.annee = 2006;


--3 : lister les employés et les jours acquis pour l'année 2006 et le détail des congés pris
select nom, prenom, libelle,nbJoursAcquis,nbJoursPris as congespris
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
					inner join Conges_Mens cm on c.codeEmp = cm.codeEmp and
													c.annee = cm.annee
	where c.annee = 2006;


--4 : lister les employés et les jours acquis pour l'année 2006 et leur cumul des jours pris
select nom, prenom, libelle,nbJoursAcquis,sum(nbJoursPris) as congespris
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
					inner join Conges_Mens cm on c.codeEmp = cm.codeEmp and
													c.annee = cm.annee
	where c.annee = 2006
	group by nom, prenom, libelle,nbJoursAcquis;




--5 : ne retenir que ceux pour qui il restant encore plus de 10 jours à prendre
select nom, prenom, libelle,nbJoursAcquis,sum(nbJoursPris) as congespris, NbJoursAcquis - sum(nbJoursPris) as joursrestant
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
					inner join Conges_Mens cm on c.codeEmp = cm.codeEmp and
													c.annee = cm.annee
	where c.annee = 2006
	group by nom, prenom, libelle,nbJoursAcquis
	having NbJoursAcquis - sum(nbJoursPris) > 10;
