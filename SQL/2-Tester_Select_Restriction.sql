USE GESTION_EMPLOYES;
GO

--EXEMPLES du cours

/*
RESTRICTION
*/
select * from Employes
	where dateNaissance is null or salaire = 0;


--alias de colonne n'est pas utilisable dans la restriction
select codeEmp,
		upper(nom) + ' ' + prenom as identite,
		isnull(convert(varchar,dateNaissance,103), '<non renseignée>') [Ne le],
		convert(varchar,dateEmbauche,103) [Embauche le],
		SalaireAugmente = salaire * 1.1,
		Cout = (salaire * 1.1) - salaire 
	from Employes
	where (salaire * 1.1) - salaire > 250;


--attention au test sur les chaines de caractères
select codeEmp,
		upper(nom) + ' ' + prenom as identite,
		isnull(convert(varchar,dateNaissance,103), '<non renseignée>') [Ne le],
		convert(varchar,dateEmbauche,103) [Embauche le],
		SalaireAugmente = salaire * 1.1,
		Cout = (salaire * 1.1) - salaire 
	from Employes
	where upper(rtrim(codeService)) = 'RESHU';


--restriction sur calcul
select codeEmp,
		upper(nom) + ' ' + prenom as identite,
		isnull(convert(varchar,dateNaissance,103), '<non renseignée>') [Ne le],
		convert(varchar,dateEmbauche,103) [Embauche le],
		SalaireAugmente = salaire * 1.1,
		Cout = (salaire * 1.1) - salaire 
	from Employes
	where DATEDIFF(year,dateEmbauche,getdate()) > 10;