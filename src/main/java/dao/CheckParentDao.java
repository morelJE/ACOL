/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author hamme
 */
public class CheckParentDao {
    
    private DataSource ds;
    private String login;
    private String password;
    
    
    public CheckParentDao(DataSource ds) {
       
        
        this.ds = ds;
        
    }
    
    
    public boolean isLoginValid(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException {
        
        request.setCharacterEncoding("UTF-8");
        login = request.getParameter("login");
        password = request.getParameter("password");
        
        if (login == null || password == null) {
            return false;
        }
        try (Connection c = ds.getConnection()) {
            /* Un PreparedStatement évite les injections SQL */
            PreparedStatement s = c.prepareStatement(
                "SELECT login FROM TParent WHERE login = ? AND mdp = ?"
            );
            s.setString(1, login);
            s.setString(2, password);
            ResultSet r = s.executeQuery();
            /* r.next() renvoie vrai si et seulement si la réponse contient au moins 1 ligne */
            c.close();
            return r.next();
        }
        
       
        
    }
    
}
