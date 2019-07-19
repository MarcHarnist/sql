USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*
MISE EN RELATION DES ENSEMBLES
*/
--PRODUIT CARTESIEN
--syntaxe simplifiée
select *
	from [Services], Employes;
	
--syntaxe ANSI
select * 
	from [Services] cross join Employes;
	
--lever les ambiguités sur les colonnes projetées
select [Services].codeService, libelle, nom, prenom
	from [Services] cross join Employes;
	
--lever les ambiguités sur les colonnes projetées (alias de table)
--syntaxe ANSI
select s.codeService, libelle, nom, prenom
	from [Services] as s cross join Employes e;

--syntaxe simplifiée
select s.codeService, libelle, nom, prenom
	from [Services] as s, Employes e;