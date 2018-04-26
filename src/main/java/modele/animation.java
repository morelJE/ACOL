package modele;

public class animation extends tap {
    private int effectif;
    private String activite;
    
    public int getEffectif() {
        return this.effectif;
    }
    
    public String getActivite() {
        return this.activite;
    }
    
    public animation(int eff, double tarif, String jour, String activite) {
        super(categorie.ANIMATION, jour);
        this.effectif = eff;
        super.setTarif(tarif);
        this.activite = activite;
    }
    
}
