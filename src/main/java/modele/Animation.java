/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.util.LinkedList;

/**
 *
 * @author hamme
 */
public class Animation {
    
    private String nom;
    private LinkedList<Jour> jours;
    private int effectif;
    private int tarif;
    private LinkedList<Section> sections;
    private LinkedList<Periode> periodes;
    private Jour jour;
    
    public Animation(String nom, LinkedList<Jour> jours, int effectif, int tarif) {
        
        this.nom = nom;
        this.jours = jours;
        this.effectif = effectif;
        this.tarif = tarif;
        
    }
    
    public Animation(String nom, Jour jour) {
        
        this.nom = nom;
        this.jour = jour;
        
    }
    
    public String getNom() {
        return nom;
    }
    
    public LinkedList<Jour> getJours() {
        return this.jours;
    }
    
    public int getEffectif() {
        return effectif;
    }
    
    public int getTarif() {
        return this.tarif;
    }
    
    public void setSections(LinkedList<Section> s) {
        this.sections = s;
    }
    
    public void setPeriodes(LinkedList<Periode> p) {
        this.periodes = p;
    }
    
    public LinkedList<Section> getSections() {
        return this.sections;
    }
    
    public LinkedList<Periode> getPeriodes() {
        return this.periodes;
    }
    
    public String getJour() {
        return Jour.toString(jour);
    }
}
