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
    String jourActuel = "2018-04-24";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Récapitulatif des Inscriptions</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Voici la liste des activités pour la periode en cours</h1>
        <%
        out.println("\t\t<ul>");
        out.println("\t\t\t<li>" + "Nous sommes le : " + jourActuel);
        try (Connection c = ds.getConnection()) {
                        PreparedStatement p = c.prepareStatement("SELECT ACTIVITE,DEBUT,JOUR FROM AssocAnimationPeriode");
                        ResultSet rs = p.executeQuery();
                        while (rs.next()) {
                            String nomActivite = rs.getString(1);
                            if(jourActuel.compareTo(rs.getString(2))>=0){                                
                                out.println("\t\t\t<li>" + "L'activité " + nomActivite + " du " + rs.getString(3) + " est en cours actuellement");
                            }
                        }
        }
         %>
    </body>
</html>