USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/* Compl�ment sur les jointures (jointure externe)*/
/**************************************************/
select * from [Services];

--par d�faut, seules les lignes validant la condition de jointure
--font partie du r�sultat
select s.codeservice, libelle, nom, prenom
	from [Services] s inner join Employes e on s.codeService = e.codeService
	order by 1;
	
--jointure externe : toutes les lignes de la table Services 
-- + �ventuellement les informations Employes si elles existent
select s.codeservice, libelle, COUNT(e.codeEmp) as NbEmployes
	from [Services] s left outer join Employes e on s.codeService = e.codeService
	group by s.codeservice, libelle
	order by 1;

--ou	
select s.codeservice, libelle, COUNT(e.codeEmp) as NbEmployes
	from Employes e right outer join [Services] s on s.codeService = e.codeService
	group by s.codeservice, libelle
	order by 1;

