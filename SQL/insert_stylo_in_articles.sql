/**
		Article a1 = new Stylo( "Bic", "BBOrange","Bic bille Orange", 1.2f, 20, "bleu");

		String sql = "insert into Articles (reference, marque, designation, prixUnitaire, qteStock, grammage, couleur, type) values ("
			+ article.getReference()
			+ ", " 
			+ article.getMarque()
			+ ", " 
			+ article.getDesignation() 
			+ ", " 
			+ article.getPrixUnitaire() 
			+ ", " 
			+ article.getQteStock() 
			+ ", " 
			+ "" // le stylo n'a pas de grammage
			+ ", " 
			+ stylo.getCouleur()
			+ ", " 
			+ "stylo"
			+ ")" ;
*/

insert into Articles (reference, marque, designation, prixUnitaire, qteStock, grammage, couleur, type) 
values ('Bic', 'BBOrange','Bic bille Orange', '1.2', '20', '', 'bleu', 'stylo');