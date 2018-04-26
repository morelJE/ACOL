package dao;

import java.sql.*;
import javax.sql.DataSource;
import java.util.LinkedList;
import java.util.List;

public class regimeDao {
   private DataSource ds;
   
   
    public regimeDao(DataSource ds) {
        this.ds = ds;
    }
    
    public void ajoutRegime(String regime) throws SQLException {
        try (Connection c = ds.getConnection()) {
            PreparedStatement p = c.prepareStatement("INSERT INTO TREGIME VALUES (?)");
            p.setString(1, regime);
            ResultSet rs = p.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void enleveRegime(String regime) {
        try (Connection c = ds.getConnection()) {
            PreparedStatement p = c.prepareStatement("DELETE FROM TREGIME WHERE REGIME=?");
            p.setString(1, regime);
            ResultSet rs = p.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public LinkedList<String> getRegimes() throws SQLException {
        LinkedList<String> regimes = new LinkedList();
        try (Connection c = ds.getConnection()) {
            PreparedStatement p = c.prepareStatement("SELECT REGIME FROM TREGIME");
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                String regime = rs.getString(1);
                regimes.add(regime);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return regimes;
    }
}
