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
public class animation extends tap {
    private int effectif;
    
    public int getEffectif() {
        return this.effectif;
    }
    
    public animation(int tarif, categorie cat, int eff) {
        super(tarif, cat);
        this.effectif = eff;
    }
}
