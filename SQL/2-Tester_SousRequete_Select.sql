USE GESTION_EMPLOYES;
GO

/*Utilisation des sous requetes*/
/*******************************/


--EXEMPLES du cours


--dans un select
--s�lectionner les employ�s dont le salaire est sup�rieur � la moyenne

select nom, prenom, salaire 
	from Employes
	where salaire > (select AVG(salaire) moyenne from Employes);
	
--visualiser la moyenne dans la projection
select nom, prenom, salaire, (select AVG(salaire) moyenne from Employes) moyenne
	from Employes
	where salaire > (select AVG(salaire) moyenne from Employes);
	
select nom, prenom, salaire, T1.moyenne
	from Employes cross join (select AVG(salaire) moyenne from Employes) T1
	where salaire > T1.moyenne;
	
--l'employ� le mieux pay�
select nom,prenom,salaire
	from Employes
	where salaire = (select MAX(salaire) from Employes);

	

