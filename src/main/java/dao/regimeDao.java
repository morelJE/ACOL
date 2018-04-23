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
    
    public void ajoutRegime(String regime) {
        
    }
    
    public void enleveRegime(String regime) {
        
    }
}
