package modele;

public enum categorie {
    CANTINE,
    GARDERIE0,
    GARDERIE1,
    GARDERIE2,
    GARDERIE3,
    GARDERIE4,
    ANIMATION;
    
    private static double tarifCantine = 2.5;
    private static double tarifGarderie = 1;
    
    public static double getTarifCantine() {
        return tarifCantine;
    }
    
    public static double getTarifGarderie() {
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
