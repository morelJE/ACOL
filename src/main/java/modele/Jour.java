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
    
    public static int toInt(String j) {
        switch (j) {
            case "Lundi":
                return 0;
            case "Mardi":
                return 1;
            case "Mercredi":
                return 2;
            case "Jeudi":
                return 3;
            case "Vendredi":
                return 4;
            default:
                return 5;
        }
    }
    
    public static String toString(int i) {
        switch (i) {
            case 0:
                return "Lundi";
            case 1:
                return "Mardi";
            case 2:
                return "Mercredi";               
            case 3:
                return "Jeudi";                
            case 4:
                return "Vendredi";                
            default:
                return null;
        }
    }

    public static String toString(Jour j) {
        
        switch (j) {
            case Lundi :
                return "Lundi";
            case Mardi :
                return "Mardi";
            case Mercredi :
                return "Mercredi";
            case Jeudi : 
                return "Jeudi";
            case Vendredi :
                return "Vendredi";
                        
        }
        
        return null;
    }
}
