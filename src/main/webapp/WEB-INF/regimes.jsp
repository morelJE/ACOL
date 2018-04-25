

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
        <form>
            <% for (int i = 0; i < regimes.size(); i++) {
                    out.println(regimes.get(i)+"</br>");
               }
            %>
        </form>
            

        
        <form action="controleur" method="post" accept-charset="UTF-8">
            <input type="text" name="regime" />
            <input type="submit" value="Ajouter" />
            <input type="hidden" name="action" value="ajouterRegime" /></br>
        </form> 
    </body>
</html>
