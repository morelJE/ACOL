package modele;

public enum categorie {
    CANTINE,
    GARDERIE0,
    GARDERIE1,
    GARDERIE2,
    GARDERIE3,
    ANIMATION;
    
    private double tarifCantine = 2.5;
    private double tarifGarderie = 1;
    
    public double getTarifCantine() {
        return tarifCantine;
    }
    
    public double getTarifGarderie() {
        return tarifGarderie;
    }
    
    public double getTarif(categorie categorie) {
        if (categorie == categorie.CANTINE) {
            return tarifCantine;
        } else if (categorie == ANIMATION) {
            return 0;
        } else {
            return tarifGarderie;
        }
    }
}
