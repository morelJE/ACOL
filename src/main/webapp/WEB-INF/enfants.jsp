<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modele.Enfant" %>
<%@ page import="dao.enfantsDao" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>

<%
    enfantsDao enfDao = (enfantsDao) request.getAttribute("enfants");
    LinkedList<Enfant> enfants = enfDao.getEnfants();
    Enfant enfant;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enfants</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <%
            out.println("\t\t<ul>");
            for (int i = 0; i < enfants.size(); i++) {
                enfant =  enfants.get(i);
                out.print("\t\t\t<li>");
                out.println(enfant.getPrenom() + " " + enfant.getNom());
                out.println("\t\t\t<form action=\"controleur\" method= \"post\" accept-charset=\"UTF-8\">");
                out.println("\t\t\t\t<input type=\"submit\" value=\"Remplir le Formulaire\" />");
                out.println("\t\t\t\t<input type=\"hidden\" name=\"action\" value=\"allerForm" + enfant.getPrenom() + "\" />");
                out.println("\t\t\t</form></li></br>");
            } 
            out.println("\t\t</ul>");
        %>
    </body>
</html>
