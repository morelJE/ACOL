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
public enum Jour {
    Lundi,
    Mardi,
    Mercredi,
    Jeudi,
    Vendredi;
    
    public static Jour toEnum(String j) {
        if (j.equals("Lundi")) {
            return Lundi;
        }
        else if (j.equals("Mardi")) {
            return Mardi;
        }
        else if (j.equals("Mercredi")) {
            return Mercredi;
        }
        else if (j.equals("Jeudi")) {
            return Jeudi;
        }
        else if (j.equals("Vendredi")) {
            return Vendredi;
        }
        else {
            System.out.println("Non recognized : " + j);
            return null;
        }
    }
}
