/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author hamme
 */
public class CheckEtablissementDao {
    
    
    private DataSource ds;
    private String login;
    private String password;
    
    
    public CheckEtablissementDao(DataSource ds) {
       
        
        this.ds = ds;
        
    }
    
    
    public boolean isLoginValid(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException {
        
        request.setCharacterEncoding("UTF-8");
        login = request.getParameter("login");
        password = request.getParameter("password");
        
        
        if (login.equals("etablissement") && password.equals("proviseur")) {
            return true;
        }
        return false;
       
        
    }
    
}
