package dao;

import java.sql.*;
import javax.sql.DataSource;
import java.util.LinkedList;
import modele.animation;

public class tapDao {
    private DataSource ds;
   
    public tapDao(DataSource ds) {
        this.ds = ds;
    }
    
    public LinkedList<animation> getAnimationsDisponibles(String jour) 
                    throws SQLException {
        LinkedList<animation> animations = new LinkedList();
        try (Connection c = ds.getConnection()) {
            PreparedStatement p = c.prepareStatement("SELECT ACTIVITE, EFFECTIF, PRIX FROM TANIMATION WHERE JOUR=? AND EFFECTIF>0");
            p.setString(1, jour);
            ResultSet rs = p.executeQuery();
            
            while (rs.next()) {
                animation animation = new animation(rs.getInt(2), rs.getFloat(3), jour, rs.getString(1));
                animations.add(animation);
                System.out.println("1");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return animations;
    }
}
