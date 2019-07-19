CREATE TABLE AVIS
(
	identifiant int IDENTITY(1,1) CONSTRAINT PK_AVIS PRIMARY KEY,
	description varchar(150) NOT NULL,
	note tinyint NOT NULL CONSTRAINT CK_AVIS_note CHECK(note between 1 and 5)
);