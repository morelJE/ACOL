package modele;

public class animation extends tap {
    private int effectif;
    
    public int getEffectif() {
        return this.effectif;
    }
    
    public animation(int eff, double tarif) {
        super(categorie.ANIMATION);
        this.effectif = eff;
        super.setTarif(tarif);
    }
    
}
