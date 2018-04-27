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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import modele.Animation;
import modele.Jour;
import modele.Periode;
import modele.Section;

/**
 *
 * @author hamme
 */
public class AnimationDao {
    
    private DataSource ds;
    private Animation animation;
    
    public Animation getAnimation() {
        return this.animation;
    }
    
    public AnimationDao(DataSource ds, Animation animation) {
        
        this.ds = ds;
        this.animation = animation;
        
    }
    
    public void ajoutTAnimation() throws SQLException {
        
        Connection c = ds.getConnection(); 
        /* Un PreparedStatement évite les injections SQL */
        
        for (Jour j : animation.getJours()) {
            PreparedStatement s = c.prepareStatement(
                "INSERT INTO TAnimation VALUES(?, ?, ?, ?)"
            );
            s.setString(1, animation.getNom());
            s.setString(2, j.toString());
            s.setInt(3, animation.getEffectif());
            s.setInt(4, animation.getTarif());
            ResultSet r = s.executeQuery();
        }
        c.close();
    }
    
    public void ajoutAssocAnimationSection() throws SQLException {
        Connection c = ds.getConnection(); 
        /* Un PreparedStatement évite les injections SQL */
        
        for (Section s : animation.getSections()) {
            System.out.println(Section.sectionToString(s));
            for (Jour j : animation.getJours()) {
            
            PreparedStatement statement = c.prepareStatement(
                "INSERT INTO AssocAnimationSection VALUES(?, ?, ?)"
            );
            statement.setString(1, animation.getNom());
            statement.setString(2, Jour.toString(j));
            statement.setString(3, Section.sectionToString(s));
            
            ResultSet r = statement.executeQuery();
            }
           
        }
        c.close();
    }

    
    public void ajoutAssocAnimationPeriode() throws SQLException {
        Connection c = ds.getConnection(); 
        /* Un PreparedStatement évite les injections SQL */
        
        for (Periode p : animation.getPeriodes()) {
            for (Jour j : animation.getJours()) {
            
            PreparedStatement statement = c.prepareStatement(
                "INSERT INTO AssocAnimationPeriode VALUES(?, ?, ?)"
            );
            System.out.println(p.getDebut());
            System.out.println(animation.getNom());
            System.out.println(Jour.toString(j));
            statement.setDate(1, p.getDebut());
            statement.setString(2, animation.getNom());
            statement.setString(3, Jour.toString(j));
            
            ResultSet r = statement.executeQuery();
            }
           
        }
        c.close();
    }
}
