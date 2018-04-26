/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.sql.DataSource;
import modele.Jour;
import modele.Periode;

/**
 *
 * @author hamme
 */
public class PeriodeDao {
    
    DataSource ds;
    
    public PeriodeDao(DataSource ds) {
        this.ds = ds;
    }
    
    public LinkedList<Periode> getPeriodes() throws SQLException {
    
        Connection c = ds.getConnection(); 
        /* Un PreparedStatement évite les injections SQL */
        
       
        PreparedStatement s = c.prepareStatement(
            "SELECT * FROM TPeriode"
        );
        
        LinkedList<Periode> periodes = new LinkedList<>();
        ResultSet r = s.executeQuery();
        while (r.next()) {
            periodes.add(new Periode(r.getDate(1), r.getDate(2))); 
        }
        return periodes;
    
    }
    
}
