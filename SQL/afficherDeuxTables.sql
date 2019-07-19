USE Locations
go
select c.nom, c.prenom, c.adresse, c.cpo, c.ville, f.etat "Etat"

from clients as c

join  fiches as f
on f.noCli = c.noCli
where f.etat = 'ec'

/* Ordre à respecter: use, go, select, from, join, on where  */ 
