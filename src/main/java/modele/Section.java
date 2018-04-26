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
public enum Section {
    PS,
    MS,
    GS,
    CP,
    CE1,
    CE2,
    CM1,
    CM2;
    
    public static Section stringToSection(String s) {
        switch (s) {
            case "PS":
                return Section.PS;
            case "MS":
                return Section.MS;
            case "GS":
                return Section.GS;
            case "CP":
                return Section.CP;
            case "CE1":
                return Section.CE1;
            case "CE2":
                return Section.CE2;
            case "CM1":
                return Section.CM1;          
            case "CM2":
                return Section.CM2;
            default:
                throw new IllegalArgumentException("La section n'est pas reconnue, ohlala");
        }
    }
    
    public static String sectionToString(Section s) {
        if (s.equals(PS)) {
            return "PS";
        }
        else if (s.equals(MS)) {
            return "MS";
        }
        else if (s.equals(GS)) {
            return "GS";
        }
        else if (s.equals(CP)) {
            return "CP";
        }
        else if (s.equals(CE1)) {
            return "CE1";
        }
        else if (s.equals(CE2)) {
            return "CE2";
        }
        else if (s.equals(CM1)) {
            return "CM1";
        }
        else if (s.equals(CM2)) {
            return "CM2";
        }
        else {
            return null;
        }
        
    } 
}

