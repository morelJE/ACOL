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
        <form>
        <%
            
            for (int i = 0; i < enfants.size(); i++) {
                enfant =  enfants.get(i);
                out.println(enfant.getNom());
                out.println(enfant.getPrenom());
                    out.println("\t\t\t<form action=\"controleur\" method= \"post\" accept-charset=\"UTF-8\">");
                    out.println("\t\t\t\t<input type=\"submit\" value=\"Supprimer\" />");
                    out.println("\t\t\t\t<input type=\"hidden\" name=\"action\" value=\"allerFormulaire" + 0 + "\" />");
                    out.println("\t\t\t</form></p>");
                out.println("</br>");
            }
        %>
        </form>
    </body>
</html>
