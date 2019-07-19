USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*
MISE EN RELATION DES ENSEMBLES
*/
--PRODUIT CARTESIEN
--syntaxe simplifi�e
select *
	from [Services], Employes;
	
--syntaxe ANSI
select * 
	from [Services] cross join Employes;
	
--lever les ambiguit�s sur les colonnes projet�es
select [Services].codeService, libelle, nom, prenom
	from [Services] cross join Employes;
	
--lever les ambiguit�s sur les colonnes projet�es (alias de table)
--syntaxe ANSI
select s.codeService, libelle, nom, prenom
	from [Services] as s cross join Employes e;

--syntaxe simplifi�e
select s.codeService, libelle, nom, prenom
	from [Services] as s, Employes e;