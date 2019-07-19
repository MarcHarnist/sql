USE GESTION_EMPLOYES;
GO

/*Utilisation des sous requetes*/
/*******************************/

--EXEMPLES du cours

--dans une instruction Delete
--suppression des services non utilisés
begin tran
	--requete imbriquée
	delete from [Services]
		where codeService not in (
					select distinct codeservice from Employes);
				
	--requete corrélée
	delete from [Services]
		where not exists (
					select distinct codeservice from Employes
						where Employes.codeService = [Services].codeService);

rollback tran



--dans une instruction Update
--changement de responsable au service des Ressources humaines. Malalaniche en prend
--la direction
begin tran
	update Employes set codeChef = (select codeEmp from Employes where nom = 'Malalaniche')
		where codeService = 'RESHU';

rollback tran



--dans un insert
--Maintenance sur la base, nous souhaitons historiser les congés de l'année 2006
--drop table HistoConges;
create table HistoConges(
	codeEmp int,
	annee numeric(4),
	nbJoursAcquis numeric(2),
	mois numeric(2),
	nbJoursPris numeric(2)
);

begin tran
	insert into HistoConges (codeEmp, annee, nbJoursAcquis, mois, nbJoursPris)
		(select c.codeEmp, c.annee, nbJoursAcquis, mois, nbJoursPris
			from Conges c inner join Conges_Mens cm on c.codeEmp = cm.codeEmp and
														c.annee = cm.annee
			where c.annee = 2006);
	delete from Conges where annee = 2006;
	
	select * from HistoConges;
rollback tran
