USE BDD_DEMO_JAVA_EE
GO
CREATE TABLE dbo.Repas(
	noRepas int IDENTITY(1,1) NOT NULL,
	dateRepas date,
	heure date,
	refR varchar(255),
	 CONSTRAINT PK_id PRIMARY KEY (	noRepas )
	 /* CONSTRAINT FK_refRepas FOREIGN KEY (refR) */
)
GO
