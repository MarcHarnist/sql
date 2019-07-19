USE BDD_DEMO
GO
CREATE TABLE dbo.Stagiaires(
	noStagiaire int IDENTITY(1,1) NOT NULL,
	prenom varchar(30) NOT NULL,
	nom varchar(30) NOT NULL,
	dateDeNaissance date ,
	motDePasse varchar(250),
 CONSTRAINT PK_Stagiaire PRIMARY KEY  
(
	noStagiaire
))
GO

insert into Stagiaires (prenom, nom,  dateDeNaissance, motDePasse) 
values ('Nordine', 'ATEUR', '1982-03-20', 'azerty');
insert into Stagiaires (prenom, nom, dateDeNaissance, motDePasse) 
values ('Agathe', 'Zeblouse', '1990-01-02', 'qwerty');
insert into Stagiaires (prenom, nom,   dateDeNaissance, motDePasse) 
values ('Lili', 'Coptère', NULL, 'dvorak');
