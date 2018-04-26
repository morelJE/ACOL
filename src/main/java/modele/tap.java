package modele;

public class tap {
    private double tarif;
    private categorie categorie;
    private String jour;
    
    public double getTarif() {
        return this.tarif;
    }
    
    public categorie getCategorie() {
        return this.categorie;
    }
    
    public String getJour() {
        return this.jour;
    }
    
    public void setTarif(double tarif) {
        this.tarif = tarif;
    }
    
    public void setCategorie(categorie categorie) {
        this.categorie = categorie;
    }

    public void setJour(String jour) {
        this.jour = jour;
    }
    
    public tap(categorie cat, String jour) {
        this.categorie = cat;
        this.tarif = cat.getTarif(cat);
        this.jour = jour;
    }
}
