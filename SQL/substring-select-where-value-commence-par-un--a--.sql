/*SELECT c.nom, c.prenom, c.ville FROM CLIENTS c WHERE substring(c.prenom, 1,1) = 'a'; */
SELECT c.titre, c.prenom, c.nom, c.ville FROM CLIENTS c WHERE ((c.titre = 'Mme' or c.titre = 'Mlle') and  c.prenom LIKE 'a%') ORDER BY c.prenom;
