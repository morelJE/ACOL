package modele;
import java.util.LinkedList;
import java.util.List;

public class GestionTap {
    
    public List<tap> getTaps() {
        List taps = new LinkedList();
        taps.add(new tap(categorie.CANTINE));
        taps.add(new tap(categorie.GARDERIE0));
        taps.add(new tap(categorie.GARDERIE1));
        taps.add(new tap(categorie.GARDERIE2));
        taps.add(new tap(categorie.GARDERIE3));
        return taps;
    }
    
    public GestionTap() {
        
    }
}
