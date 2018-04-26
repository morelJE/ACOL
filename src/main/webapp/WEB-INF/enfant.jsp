<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.annotation.Resource" %>
<%@ page import="modele.Enfant" %>
<%@ page import="modele.categorie" %>
<%@ page import="dao.enfantsDao" %>
<%@ page import="modele.Section" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.regimeDao" %>

<%!
    @Resource(name = "jdbc/acol")
    private DataSource ds;
%>
<%
    Enfant enfant = (Enfant) request.getAttribute("enfant");
    Section section = enfant.getSection();
    regimeDao regDao = new regimeDao(ds);
    LinkedList<String> regimes = regDao.getRegimes();
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
            <%  
                out.println("<input type=\"hidden\" name=\"prenom\" value=\"" + enfant.getPrenom() + "\"/>");
                out.println("<h2>Cantine</h2>");
                out.println("<h3>Tarif Cantine : " + categorie.getTarifCantine() + "€ le repas</h3>");
            %>
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
            
            <h2>Régime</h2>
            <%
                String reg;
                out.println("<ul>");
                for (int i = 0; i < regimes.size(); i++) {
                    reg = regimes.get(i);
                    out.println("<li><label for=\"" + reg + "\">" + reg + "</label>");
                    out.println("<input name=\"regimeSel\" type=\"checkbox\" value =\"" + reg + "\" id=\"" + reg + "\"/></li>");
                }
                out.println("\t\t</ul>");
            %>
            
            <h2>TAP</h2>
            <select name="Jour">
                <option value="Lundi">Lundi</option>
                <option value="Mardi">Mardi</option>
                <option value="Mercredi">Mercredi</option>
                <option value="Jeudi">Jeudi</option>
                <option value="Vendredi">Vendredi</option>
            </select>
            <input type="submit" name="action" value="Choisir" />
            <input type=hidden" value="jourFormulaire"/>
            
            
            </br>
            <input type="submit" name="action" value="enregistrer" />
            
        </form>
        <%
             
        %>
    </body>
</html>
