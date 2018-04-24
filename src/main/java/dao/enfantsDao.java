/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.*;
import javax.sql.DataSource;
import java.util.List;
import java.util.LinkedList;

/**
 *
 * @author morel2
 */
public class enfantsDao {
    private DataSource ds;
   
    public enfantsDao(DataSource ds) {
        this.ds = ds;
    }
    
    public List<String> getEnfants() {
        List enfants = new LinkedList();
        return enfants;
    }
}
