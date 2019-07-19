-- Marc: -- Add foreign key (KF = keyForeign name convention)
-- ALTER TABLE dbo.tarifs CONSTRAINT PK_GRILLETARIFS PRIMARY KEY (id_GRILLETARIFS,codeGam,codeCate),
ALTER TABLE dbo.tarifs ADD CONSTRAINT KF_codeTarif FOREIGN KEY (codeTarif) REFERENCES grilletarifs2 (codeTarif);