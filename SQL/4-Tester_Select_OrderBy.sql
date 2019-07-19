USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

--Trier le r�sultat final (clause order by)
select codeService,
		upper(nom) + ' ' + prenom as identite
	from Employes
	where UPPER(rtrim(codeService)) in ('RESHU','INFOR')
	order by codeService ASC, 2 DESC;

