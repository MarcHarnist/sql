USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*Définition des vues*/
create view v_SouventEnConges
	as select e.codeEmp, nom, sum(nbJoursPris) totcp, m.moyennecp 
			from	employes e, conges_mens cm, 
					(select sum(nbjourspris)/count(distinct codeemp) moyennecp 
						from conges_mens) m
			where e.codeEmp = cm.codeEmp 
			group by e.codeEmp, nom, m.moyennecp
			having sum(nbJoursPris) > m.moyennecp;
GO

select * from v_SouventEnConges

drop view v_SouventEnConges;
GO


create view v_Employes with encryption
	as select e.nom, e.prenom, CONVERT(varchar,e.dateEmbauche,103) dateEmbauche,
			e.salaire, isnull(chefs.nom,'<pas de responsable>') chef,
			e.codeService, libelle
			from Employes e
				left outer join Employes chefs on e.codeChef = chefs.codeEmp
				inner join Services s on e.codeService = s.codeService;
GO


--vues et les instructions du dml
USE GESTION_EMPLOYES;
GO

drop view V_EMPLOYES_INFO;
GO

create view V_EMPLOYES_INFO
	as 
	select codeemp, nom, prenom, 
		dateEmbauche, salaire, codeservice
		from employes
		where codeservice = 'INFOR'
	with check option;
GO

select * from V_EMPLOYES_INFO;

begin tran;

	--seuls les employes visibles au travers de la vue sont modifiables
	update V_EMPLOYES_INFO set prenom = UPPER(prenom);
	--seuls les employes visibles au travers de la vue sont supprimables
	delete from V_EMPLOYES_INFO;

	--seuls les employes visibles au travers de la vue sont insérables
	insert into V_EMPLOYES_INFO (nom, prenom, 
			dateEmbauche, salaire, codeservice)
			values ('VIEW','Vue',GETDATE(),5555.55,'INFOR');

	insert into V_EMPLOYES_INFO (nom, prenom, 
			dateEmbauche, salaire, codeservice)
			values ('VIEW','Vue',GETDATE(),5555.55,'RESHU');
		
rollback tran;

