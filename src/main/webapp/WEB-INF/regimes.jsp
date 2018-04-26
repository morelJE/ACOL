<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.annotation.Resource" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.regimeDao" %>
<%!
    @Resource(name = "jdbc/acol")
    private DataSource ds;
%>
<%
    regimeDao regDao = new regimeDao(ds);
    List regimes = regDao.getRegimes();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Listes des régimes</h1>
        <%  out.println("<ul>");
            for (int i = 0; i < regimes.size(); i++) {
                out.println("\t\t\t<li>" + regimes.get(i) + "<form action=\"controleur\" method= \"post\" accept-charset=\"UTF-8\">");
                out.println("\t\t\t\t<input type=\"submit\" value=\"Supprimer\" />");
                out.println("\t\t\t\t<input type=\"hidden\" name=\"action\" value=\"supprRegime " + regimes.get(i) + "\" />");
                out.println("\t\t\t</form></li>");
           }
            out.println("\t\t</ul>");
        %>
        
            

        <h1>Ajouter un régime</h1>
        <form action="controleur" method="post" accept-charset="UTF-8">
            <input type="text" name="regime" />
            <input type="submit" value="Ajouter" />
            <input type="hidden" name="action" value="ajouterRegime" /></br>
        </form> 
    </body>
</html>
