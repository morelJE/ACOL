package modele;

public class tap {
    private double tarif;
    private categorie categorie;
    
    public double getTarif() {
        return this.tarif;
    }
    
    public categorie getCategorie() {
        return this.categorie;
    }
    
    public void setTarif(double tarif) {
        this.tarif = tarif;
    }
    
    public void setCategorie(categorie categorie) {
        this.categorie = categorie;
    }
    
    public tap(categorie cat) {
        this.categorie = cat;
        this.tarif = cat.getTarif(cat);
    }
}
