use LOCATIONS
GO

-- a --
SELECT *
FROM clients
WHERE nom LIKE 'D%';

-- b --
SELECT nom, prenom
FROM clients;

-- c --
SELECT noFic, etat, nom, prenom
FROM clients c INNER JOIN fiches f ON c.noCli = f.noCli
WHERE convert(integer,cpo) IN (44000, 44100, 44200, 44300);

SELECT noFic, etat, nom, prenom
FROM clients c INNER JOIN fiches f ON c.noCli = f.noCli
WHERE substring(cpo,1,2) = '44';

SELECT noFic, etat, nom, prenom
FROM clients c INNER JOIN fiches f ON c.noCli = f.noCli
WHERE cpo like '44%';

-- d --
SELECT	l.noFic [numéro de fiche],
		nom,
		prenom AS 'prénom',
		l.refart 'référence',
		designation [désignation],
		CONVERT(VARCHAR, depart, 103) 'départ',
		ISNULL(CONVERT(VARCHAR, retour, 103), '-') retour,
		prixJour AS [prix par jour],
		montant=(DATEDIFF("DD", depart, ISNULL(retour, GETDATE()))+1)*prixJour
FROM fiches f
	INNER JOIN clients c ON f.noCli = c.noCli
	INNER JOIN lignesFic l ON f.noFic = l.noFic
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t	ON g.codeTarif = t.codeTarif
WHERE l.noFic = 1002;

-- e --

SELECT g.libelle AS Gamme, AVG(prixJour) [tarif journalier moyen]
FROM gammes g
INNER JOIN grilleTarifs gt ON g.codeGam = gt.codeGam
INNER JOIN tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY g.libelle;


-- f --
SELECT l.refart, designation, COUNT(*) AS [nombre de locations]
FROM lignesFic l
INNER JOIN articles a ON l.refart = a.refart
GROUP BY l.refart, designation
HAVING COUNT(*)>=3;

-- g --
DROP TABLE #T1;
SELECT	l.noFic [numéro de fiche],
		SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour) as total
INTO #T1
FROM lignesFic l 
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t	ON g.codeTarif = t.codeTarif
WHERE l.noFic = 1002
GROUP BY l.noFic;

SELECT	l.noFic [numéro de fiche],
		nom,
		prenom AS 'prénom',
		l.refart 'référence',
		designation [désignation],
		CONVERT(VARCHAR, depart, 103) 'départ',
		ISNULL(CONVERT(VARCHAR, retour, 103), '-') retour,
		prixJour AS [prix par jour],
		(DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour as montant,
		total		
FROM fiches f
	INNER JOIN clients c ON f.noCli = c.noCli
	INNER JOIN lignesFic l ON f.noFic = l.noFic
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t	ON g.codeTarif = t.codeTarif
	CROSS JOIN #T1
WHERE l.noFic = 1002;

-- h --
SELECT c.libelle [Catégorie], g.libelle Gamme, t.libelle AS 'Nom du tarif', prixJour AS [Prix à la journée]
FROM grilleTarifs gt
INNER JOIN gammes g ON gt.codeGam = g.codeGam
INNER JOIN categories c ON gt.codeCate = c.codeCate
INNER JOIN tarifs t ON gt.codeTarif = t.codeTarif;

-- i --
SELECT l.refart 'référence',  designation 'désignation', COUNT(l.refart) AS 'nombre de locations'
	FROM categories c
	INNER JOIN articles a ON c.codeCate = a.codeCate
	INNER JOIN lignesFic l ON a.refart = l.refart
	WHERE libelle = 'SURF'
	GROUP BY l.refart, designation;

-- j --
SELECT CONVERT(NUMERIC, COUNT(*)) nbloc
INTO #T1
	FROM lignesFic
	GROUP BY noFic;

SELECT AVG(nbloc) AS 'nombre d''articles loués en moyenne par fiche'
FROM #T1;

DROP TABLE #T1;

-- k --
SELECT libelle 'catégorie', COUNT(*) 'nombre de location'
FROM lignesFic l
INNER JOIN articles a ON l.refart = a.refart
INNER JOIN categories c ON a.codeCate = c.codeCate
WHERE libelle IN ('Ski Alpin', 'Surf', 'Patinette')
GROUP BY libelle;

-- l --
SELECT montant=SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour)
into #T1
	FROM lignesFic l
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
	GROUP BY noFic;

SELECT CONVERT(NUMERIC(8,2),AVG(montant)) 'montant moyen d''une fiche de location'
FROM #T1;

DROP TABLE #T1;