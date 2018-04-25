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
    
    public static Section stringToSection(String s) throws Exception {
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
                throw new Exception("La section n'est pas reconnue, ohlala");
        }
    } 
}

