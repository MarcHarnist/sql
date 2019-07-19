USE GESTION_EMPLOYES;
GO

--modificateurs d'op�rateur ALL, ANY,SOME
CREATE TABLE T1
(ID int) ;
GO
INSERT T1 VALUES (1) ;
INSERT T1 VALUES (2) ;
INSERT T1 VALUES (3) ;
INSERT T1 VALUES (4) ;

-- renvoie TRUE car 3 est inf�rieur � certaines des valeurs de la table.
SELECT 'TRUE'
	where 3 < SOME (select ID from T1);

-- renvoie FALSE car 3 n'est pas inf�rieur � toutes les valeurs de la table. 
SELECT 'TRUE'
	where 3 < ALL (select ID from T1);