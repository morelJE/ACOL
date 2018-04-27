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
import javax.annotation.Resource;
import javax.sql.DataSource;
import modele.Animateur;
import modele.Section;

/**
 *
 * @author hamme
 */
public class AnimateursDao {
    
    private DataSource ds;
    
    private LinkedList<Animateur> animateurs;
    
    public AnimateursDao(DataSource ds) {
        this.ds = ds;
    }
    
    public LinkedList<Animateur> retrieveAnimateurs() throws SQLException {
        
        Connection c = ds.getConnection(); 
            
        PreparedStatement statement = c.prepareStatement(
            "SELECT * FROM TAnimateur"
        );
        ResultSet r = statement.executeQuery();

        this.animateurs = new LinkedList<>();


        while (r.next()) {
            this.animateurs.add(new Animateur(r.getString(1), r.getString(2)));
        }
        c.close();
        return this.animateurs;
            
        
        
    }
    
    public LinkedList<Animateur> getAnimateurs() {
        return this.animateurs;
    }
    
}
