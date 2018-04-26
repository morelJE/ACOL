<%-- 
    Document   : AjoutAnimationPeriodeSection
    Created on : Apr 26, 2018, 6:26:43 PM
    Author     : hamme
--%>

<%@page import="modele.Periode"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.annotation.Resource" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.PeriodeDao" %>
<%!
    @Resource(name = "jdbc/acol")
    private DataSource ds;
%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8" />
        <title>Sections et Périodes</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Ajout de sections et de périodes</h1>

        <form action="controleur" method="post" accept-charset="UTF-8">
            
            
            Selectionnez au moins une section pour l'animation : 
            <label for="PS">PS</label>
            <input name="Section" type="checkbox" value="PS" id="PS" />
            <label for="MS">MS</label>
            <input name="Section" type="checkbox" value="MS" id="MS" />
            <label for="GS">GS</label>
            <input name="Section" type="checkbox" value="GS" id="GS" />
            <label for="CP">CP</label>
            <input name="Section" type="checkbox" value="CP" id="CP" />
            <label for="CE1">CE1</label>
            <input name="Section" type="checkbox" value="CE1" id="CE1" />
            <label for="CE2">CE2</label>
            <input name="Section" type="checkbox" value="CE2" id="CE2" />
            <label for="CM1">CM1</label>
            <input name="Section" type="checkbox" value="CM1" id="CM1" />
            <label for="CM2">CM2</label>
            <input name="Section" type="checkbox" value="CM2" id="CM2" />
            </br>
            Selectionnez au moins une période :
            <% 
                PeriodeDao periodeDao = new PeriodeDao(ds);
                LinkedList<Periode> periodes = periodeDao.getPeriodes();
                int i = 0;
                for (Periode p : periodes) {
                    i++;
                    out.println("<label for=\"" + i + "\">" + p.getDebut() + " à " + p.getFin() + "</label>");
                    out.println("<input name=\"Periode\" type=\"checkbox\" value=\"" + p.getDebut() + "\" id=\"" + i + "\" />");
                }
                
            %>
            
            </br>

            <input type="submit" value="Envoyer" />
            <input type ="hidden" name="action" value ="animationPeriodeSection" />
        </form>
        
    </body>
</html>
