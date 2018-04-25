package dao;
import java.sql.*;
import javax.sql.DataSource;
import java.util.List;
import java.util.LinkedList;
import modele.Enfant;
import modele.Section;


public class enfantsDao {
    private DataSource ds;
    private String login;
    
    public enfantsDao(DataSource ds, String login) {
        this.ds = ds;
        this.login = login;
    }
    
    public LinkedList<Enfant> getEnfants() 
                    throws Exception {
        LinkedList<Enfant> enfants = new LinkedList();
        String nom; 
        String prenom; 
        Section section;
        try (Connection c = ds.getConnection()) {
            PreparedStatement p = c.prepareStatement("SELECT NOM, PRENOM, SECTION FROM TENFANT WHERE LOGIN=?");
            p.setString(1, login);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                nom = rs.getString(1);
                prenom = rs.getString(2);
                section = Section.stringToSection(rs.getString(3));
                enfants.add(new Enfant(nom, prenom, section));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        
        return enfants;
    }
}
