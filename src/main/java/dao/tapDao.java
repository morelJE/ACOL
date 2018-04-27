package dao;

import java.sql.*;
import javax.sql.DataSource;
import java.util.LinkedList;
import modele.animation;
import modele.Section;
import modele.Jour;

public class tapDao {
    private DataSource ds;
    private String login;
    private String prenom;
   
    public tapDao(DataSource ds, String login, String prenom) {
        this.ds = ds;
        this.login = login;
        this.prenom = prenom;
    }
    
    public LinkedList<animation> getAnimationsDisponibles(String jour, Section section) 
                    throws SQLException {
        LinkedList<animation> animations = new LinkedList();
        try (Connection c = ds.getConnection()) {
            PreparedStatement p = c.prepareStatement("SELECT TA.ACTIVITE, TA.EFFECTIF, TA.PRIX "
                    + "FROM TANIMATION TA, ASSOCANIMATIONSECTION AAS "
                    + "WHERE TA.JOUR = AAS.Jour AND TA.ACTIVITE = AAS.ACTIVITE "
                    + "AND TA.JOUR = ? AND EFFECTIF > 0 AND AAS.SECTION = ?");
            p.setString(1, jour);
            p.setString(2, Section.sectionToString(section));
            ResultSet rs = p.executeQuery();
            
            while (rs.next()) {
                animation animation = new animation(rs.getInt(2), rs.getFloat(3), jour, rs.getString(1));
                animations.add(animation);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return animations;
    }
    
    public boolean isInList(String[] list, String mot) {
        if (list==null){
            return false;
        }
        for (int i = 0; i < list.length; i++) {
            System.out.println(list[i]);
            if (mot.equals(list[i])) {
                System.out.println("OK");
                return true;
            }
        }
        return false;
    }
    
    public void ajouteCantine(String[] cantines)
                        throws SQLException {
        if (cantines == null) {
            return;
        }
        for (int i = 0; i < cantines.length; i++) {
            try (Connection c = ds.getConnection()) {
                PreparedStatement p = c.prepareStatement("INSERT INTO ASSOCANIMATIONENFANT VALUES (?, ?, ?, ?)");
                p.setString(1, "Cantine");
                p.setString(2, cantines[i]);
                p.setString(3, this.login);
                p.setString(4, this.prenom);
                ResultSet rs = p.executeQuery();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }  
        }        
    }
    
    public void ajouteAnimations(LinkedList<String[]> animations) {
        if (animations == null) {
            return;
        }
        for (int i = 0; i < animations.size(); i++) {
            String jour = Jour.toString(i);
            if (animations.get(i) != null) {
                for (int j = 0; j < animations.get(i).length; j++) {
                    try (Connection c = ds.getConnection()) {
                        PreparedStatement p = c.prepareStatement("INSERT INTO ASSOCANIMATIONENFANT VALUES (?, ?, ?, ?)");
                        p.setString(1, animations.get(i)[j]);
                        p.setString(2, jour);
                        p.setString(3, this.login);
                        p.setString(4, this.prenom);
                        ResultSet rs = p.executeQuery();
                    } catch (SQLException e) {
                        System.out.println(e.getMessage());
                    }
                }
            }
        }    
    }
    

}
