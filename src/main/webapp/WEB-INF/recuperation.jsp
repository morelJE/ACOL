<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.annotation.Resource" %>

<%!
    @Resource(name = "jdbc/acol")
    private DataSource ds;
    
%>
<%
    java.sql.Date jourActuel = new java.sql.Date(2018,4,26);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Récapitulatif des Inscriptions</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Voici la liste des groupes pour la periode en cours</h1>
        <%
        out.println("\t\t<ul>");
        try (Connection c = ds.getConnection()) {
                        PreparedStatement p = c.prepareStatement("SELECT ACTIVITE,DEBUT FROM AssocAnimationPeriode");
                        ResultSet rs = p.executeQuery();
                        while (rs.next()) {
                            String nomActivite = rs.getString(1);
                            if(jourActuel.getSeconds() > java.sql.Date.valueOf(rs.getString(2)).getSeconds()){                                
                                out.println("\t\t\t<li>" + "L'activité " + nomActivite + " est en cours actuellement");
                            }
                        }
        }
         %>
    </body>
</html>