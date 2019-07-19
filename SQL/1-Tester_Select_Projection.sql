USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*
PROJECTION
*/
select * from Employes;

select codeEmp,nom,prenom from Employes;

--par defaut, la projection retourne toutes les lignes
select prenom from Employes;
select all prenom from Employes;

--pour éliminer les doublons en fonction de la projection
select distinct prenom from Employes;

--calculs élémentaires
select codeEmp,
		upper(nom) + ' ' + prenom,
		isnull(convert(varchar,dateNaissance,103), '<non renseignée>'),
		convert(varchar,dateEmbauche,103),
		salaire * 1.1,
		(salaire * 1.1) - salaire 
	from Employes;
	
--alias de colonne
select codeEmp,
		upper(nom) + ' ' + prenom as identite,
		isnull(convert(varchar,dateNaissance,103), '<non renseignée>') Nele,
		convert(varchar,dateEmbauche,103) [Embauche le],
		SalaireAugmente = salaire * 1.1,
		Cout = (salaire * 1.1) - salaire 
	from Employes;