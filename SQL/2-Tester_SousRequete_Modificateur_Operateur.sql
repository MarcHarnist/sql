USE GESTION_EMPLOYES;
GO

--modificateurs d'opérateur ALL, ANY,SOME
CREATE TABLE T1
(ID int) ;
GO
INSERT T1 VALUES (1) ;
INSERT T1 VALUES (2) ;
INSERT T1 VALUES (3) ;
INSERT T1 VALUES (4) ;

-- renvoie TRUE car 3 est inférieur à certaines des valeurs de la table.
SELECT 'TRUE'
	where 3 < SOME (select ID from T1);

-- renvoie FALSE car 3 n'est pas inférieur à toutes les valeurs de la table. 
SELECT 'TRUE'
	where 3 < ALL (select ID from T1);