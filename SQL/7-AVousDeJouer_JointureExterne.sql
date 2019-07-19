USE GESTION_EMPLOYES;
GO

/*********************************************************************************/

--A VOUS DE JOUER

--detail des congés pris par employé en 2005 (même ceux qui n'en ont pas pris du tout)
--ecriture ANSI
set IDENTITY_INSERT EMPLOYES ON
insert into employes (codeemp,nom,prenom,dateEmbauche,salaire,codeService,codeChef)
	values (-99,'Copter','Lily','10/01/2002',2600.20,'RESHU',-2);
insert into conges values (-99,2005,default);
set IDENTITY_INSERT EMPLOYES OFF

select nom, prenom, libelle, c.annee, nbJoursAcquis,mois, nbJoursPris
	from Employes e inner join [Services] s on e.codeService = s.codeService
					inner join Conges c on e.codeEmp = c.codeEmp
					left outer join Conges_Mens cm on c.codeEmp = cm.codeEmp and
													c.annee = cm.annee
	where  c.annee = 2005
	order by e.codeService,nom,mois;