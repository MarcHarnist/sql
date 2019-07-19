/*********************************************************************************/

--A VOUS DE JOUER


--l'employé le mieux payé par service
with T1 as (
	select codeservice, MAX(salaire) plusHautSalaire
		from Employes
		group by codeservice
)
select * 
	from Employes
		inner join T1 on employes.codeService = T1.codeService
	where Employes.salaire = T1.plusHautSalaire;