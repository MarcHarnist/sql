USE GESTION_EMPLOYES;
GO


/*********************************************************************************/

--A VOUS DE JOUER

--suppression des cong�s de 2006 pour les employes du service info
begin tran

	delete from Conges
		where codeemp in
			(select codeemp from Employes where codeService = 'INFOR')
			and annee = 2006;
		
	--ou	
	delete from Conges
			from Employes
		where Conges.codeEmp = Employes.codeEmp
			and Employes.codeService = 'INFOR'
			and annee = 2006;

rollback tran


--accorder un jour de cong�s suppl�mentaire pour cette ann�e aux employ�s ayant au moins 10 ans d'anciennet�
begin tran

	update Conges set NbJoursAcquis = NbJoursAcquis + 1
		where CodeEmp in ( select codeEmp from Employes
							where DATEDIFF(year,dateEmbauche,getdate()) >= 10)
			 and Annee = DATEPART(year,getdate());

rollback tran