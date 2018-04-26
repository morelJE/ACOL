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
<%@ page import="dao.tapDao" %>
<%@ page import="modele.animation" %>

<%!
    @Resource(name = "jdbc/acol")
    private DataSource ds;
%>
<%
    String Jour = (String) request.getAttribute("jour");
    Enfant enfant = (Enfant) request.getAttribute("enfant");
    Section section = enfant.getSection();
    regimeDao regDao = new regimeDao(ds);
    LinkedList<String> regimes = regDao.getRegimes();
    tapDao tapDao = new tapDao(ds);
    LinkedList<animation> animations = tapDao.getAnimationsDisponibles(Jour);
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
            
            <!-- CANTINE -->
            <!------------->
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
            
            <!-- REGIME -->
            <!------------>
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
            <!-- SELECTION JOUR -->
            <!-------------------->
            
            <select name="Jour">
            <% 
                out.print("<option value=\"Lundi\"");
                if (Jour.equals("Lundi")) {
                    out.print(" selected=\"selected\"");
                }
                out.println(">Lundi</option>");
                
                out.print("<option value=\"Mardi\"");
                if (Jour.equals("Mardi")) {
                    out.print(" selected=\"selected\"");
                }
                out.println(">Mardi</option>");
                
                out.print("<option value=\"Mercredi\"");
                if (Jour.equals("Mercredi")) {
                    out.print(" selected=\"selected\"");
                }
                out.println(">Mercredi</option>");
                
                out.print("<option value=\"Jeudi\"");
                if (Jour.equals("Jeudi")) {
                    out.print(" selected=\"selected\"");
                }
                out.println(">Jeudi</option>");
                
                out.print("<option value=\"Vendredi\"");
                if (Jour.equals("Vendredi")) {
                    out.print(" selected=\"selected\"");
                }
                out.println(">Vendredi</option>");
                
            %>
            </select>
            <input type="submit" value="Choisir" />
            <input type="hidden" name="action" value="jourFormulaire"/>
            
            <!-- ANIMATIONS -->
            <!---------------->
            <%
                animation anim;
                for (int i = 0; i < animations.size(); i++) {
                    anim = animations.get(i);
                    out.println(anim.getActivite());
                
                }
            %>
            
            </br>
            <input type="submit" name="action" value="enregistrer" />
            
        </form>
        <%
             
        %>
    </body>
</html>
