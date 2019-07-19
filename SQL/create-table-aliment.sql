USE BDD_DEMO_JAVA_EE
GO
CREATE TABLE dbo.Aliment(
	noAliment int IDENTITY(1,1) NOT NULL,
	nom varchar(255),
	refA varchar(255),
	 CONSTRAINT PK_noAliment PRIMARY KEY (	noAliment )
	 /* CONSTRAINT FK_refRepas FOREIGN KEY (refR) */
)
GO
