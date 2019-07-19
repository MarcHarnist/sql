use Locations
go
select c.nom,c.noCli, f.noCli 
 from clients as c,
  fiches as f
  , articles as a 