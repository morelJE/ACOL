/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import javax.sql.DataSource;
import java.util.LinkedList;
import java.util.List;
import modele.regime;

/**
 *
 * @author morel2
 */
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
        System.out.println("enleve regime");
        try (Connection c = ds.getConnection()) {
            PreparedStatement p = c.prepareStatement("DELETE FROM TREGIME WHERE REGIME=?");
            System.out.println(regime);
            p.setString(1, regime);
            ResultSet rs = p.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public List<regime> getRegimes() throws SQLException {
        List regimes = new LinkedList();
        try (Connection c = ds.getConnection()) {
            PreparedStatement p = c.prepareStatement("SELECT REGIME FROM TREGIME");
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                String regime = rs.getString(1);
                regimes.add(regime);
            }
        } catch (SQLException e) {
            System.out.println("gngrnejogoiehqrgiqruepog");
        }
        return regimes;
    }
}
