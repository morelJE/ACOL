/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

/**
 *
 * @author hamme
 */
public class Periode {
    
    private java.sql.Date debut;
    private java.sql.Date fin;
    
    public Periode(java.sql.Date debut, java.sql.Date fin) {
        
        this.debut = debut;
        this.fin = fin;
        
    }
    
    public java.sql.Date getDebut() {
        return this.debut;
    }
    
    public java.sql.Date getFin() {
        return this.fin;
    }
    
    
}
