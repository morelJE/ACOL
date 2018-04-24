/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import javax.sql.DataSource;

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
        System.out.println("coucou");
        try (Connection c = ds.getConnection()) {
            System.out.println("INSERT INTO TREGIME (REGIME) VALUES (' +" + regime + "')");
            PreparedStatement p = c.prepareStatement("INSERT INTO TREGIME (REGIME) VALUES ('?')");
            p.setString(1, regime);
            p.executeQuery();
        }
    }
    
    public void enleveRegime(String regime) {
        
    }
}
