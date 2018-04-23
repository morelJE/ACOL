/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

/**
 *
 * @author morel2
 */
public class tap {
    private int tarif;
    private categorie categorie;
    
    public int getTarif() {
        return this.tarif;
    }
    
    public categorie getCategorie() {
        return this.categorie;
    }
    
    public tap(int tarif, categorie cat) {
        this.tarif = tarif;
        this.categorie = cat;
    }
}
