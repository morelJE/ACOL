package dao;
import java.sql.*;
import javax.sql.DataSource;
import java.util.LinkedList;
import java.util.List;

public class EnfantDao {
    private DataSource ds;
    private String prenom;
    private String login;
    
    public EnfantDao(DataSource ds, String login, String prenom) {
        this.ds = ds;
        this.prenom = prenom;
        this.login = login;
    }    
    
    public void ajouteRegimes(String[] regimes)
                    throws SQLException {
        for (int i = 0; i < regimes.length; i++) {
            try (Connection c = ds.getConnection()) {
                PreparedStatement p = c.prepareStatement("INSERT INTO ASSOREGIMEENFANT VALUES (?,?,?)");
                p.setString(1, this.login);
                p.setString(2, this.prenom);
                p.setString(3, regimes[i]);
                ResultSet rs = p.executeQuery();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }  
        }
    }
}
