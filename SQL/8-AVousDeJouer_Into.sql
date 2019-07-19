/*********************************************************************************/

--A VOUS DE JOUER

--Listez l'employe le mieux payé par service
--Etape 1 : le plus gros salaire par service
select CodeService, Max(salaire) as Plus_gros_salaire
	into #T2
	from Employes
	group by CodeService;

--Etape 2 : l'employé du service correspondant à ce salaire
select nom, prenom, salaire
	from Employes e
	inner join #T2 on e.CodeService = #T2.CodeService
	where salaire = #T2.plus_gros_salaire;

drop table #T2;