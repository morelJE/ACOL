<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modele.Enfant" %>
<%@ page import="dao.enfantsDao" %>
<%@ page import="modele.Section" %>

<%
    Enfant enfant = (Enfant) request.getAttribute("enfant");
    Section section = enfant.getSection();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <form>
            <%
                out.println("<title>" + enfant.getPrenom() + " " + enfant.getNom() + "</title>");
            %>
        </form>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        
        <form action="controleur" method="post" accept-charset="UTF-8">
            <h2>Cantine</h2>
            <label for="Lun">Lundi</label>
            <input name="JourCantine" type="checkbox" value="Lundi" id="Lun" />
            <label for="Mar">Mardi</label>
            <input name="JourCantine" type="checkbox" value="Mardi" id="Mar"/>
            <label for="Mer">Mercredi</label>
            <input name="JourCantine" type="checkbox" value="Mercredi" id="Mer"/>
            <label for="Jeu">Jeudi</label>
            <input name="JourCantine" type="checkbox" value="Jeudi" id="Jeu"/>
            <label for="Ven">Vendredi</label>
            <input name="JourCantine" type="checkbox" value="Vendredi" id="Ven"/>
            
            
            
            
        </form>
        <%
             
        %>
    </body>
</html>
