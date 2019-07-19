-- Définir la db
USE Locations
GO
select c.nom "Noms", ville "Villes d'habitation"  from clients as c where ville = 'Paris';
