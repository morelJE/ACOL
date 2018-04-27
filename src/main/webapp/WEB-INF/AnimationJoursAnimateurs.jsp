<%-- 
    Document   : AnimationJoursAnimateurs
    Created on : Apr 27, 2018, 1:22:03 PM
    Author     : hamme
--%>

<%@page import="modele.Animateur"%>
<%@page import="dao.AnimateursDao"%>
<%@page import="modele.Jour"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="modele.Animation"%>
<%@page import="dao.AnimationDao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.annotation.Resource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    @Resource(name = "jdbc/acol")
    private DataSource ds;
%>

<%
    //HttpSession session = request.getSession();
    AnimationDao animationDao = ((AnimationDao)(session.getAttribute("animationDao")));
    Animation animation = animationDao.getAnimation();
        
    LinkedList<Jour> jours = animation.getJours();
    AnimateursDao animateursDao = new AnimateursDao(ds);
    LinkedList<Animateur> animateurs = animateursDao.retrieveAnimateurs();
%>
<html lang="fr">
    <head>
        <meta charset="UTF-8" />
        <title>Animateurs</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Ajout d'animateurs pour chaque jour</h1>
        
        Sélectionnez les animateurs pour chaque jour de l'animation : 
        </br>
        <form action="controleur" method="post" accept-charset="UTF-8">
        <%
            
            
            for (Jour j : jours) {
                out.println(j + " : ");
                int i = 0;
                out.println("</br>");
                for (Animateur a : animateurs) {
                    i++;
                    out.println("<label for=\"" + Jour.toString(j) + i + "\">" + a.getNom() + " " + a.getPrenom() + "</label>");
                    out.println("<input name=\"Periode\" type=\"checkbox\" value=\"" + a.getNom() + " " + a.getPrenom() + "\" id=\"" + j + i + "\" />");
                    out.println("</br>");

                }
                out.println("</br>");
                
            }
            %>  
        </br>

            <input type="submit" value="Envoyer" />
            <input type ="hidden" name="action" value ="animationJoursAnimateurs" />
        
       
        
            
            
        </form>
        <form action="controleur" method="post" accept-charset="UTF-8">
            <input type="submit" value="Retourner à l'accueil" />
            <input type="hidden" name="action" value="retourAccueil" /></br>
        </form> 
        
    </body>
</html>

