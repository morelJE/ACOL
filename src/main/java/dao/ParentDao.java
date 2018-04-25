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
import javax.sql.DataSource;

/**
 *
 * @author hamme
 */
public class ParentDao {
    
    private DataSource ds;
    private String login;
    private String telephone;
    private String adresse;
    
    
    public ParentDao(DataSource ds, String login) {
        
        this.ds = ds;
        this.login = login;
        
        
    }
    
    public void updateInfos(String telephone, String adresse) throws SQLException {
        
        this.telephone = telephone;
        this.adresse = adresse;
        try (Connection c = ds.getConnection()) {
            /* Un PreparedStatement évite les injections SQL */
            PreparedStatement s = c.prepareStatement(
                "UPDATE TParent SET Adresse=?, TEL=? WHERE LOGIN=?"
            );
            s.setString(1, adresse);
            s.setString(2, telephone);
            s.setString(3, this.login);
            ResultSet r = s.executeQuery();
            
        
        }
    
    }
}

