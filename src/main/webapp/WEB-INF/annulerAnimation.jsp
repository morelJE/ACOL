<%-- 
    Document   : annulerAnimation
    Created on : Apr 27, 2018, 5:57:51 PM
    Author     : hamme
--%>

<%@page import="modele.Animation"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="dao.EnfantDao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.annotation.Resource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    @Resource(name = "jdbc/acol")
    private DataSource ds;
%>
<%
    //HttpSession session = request.getSession();
    EnfantDao enfant = ((EnfantDao)(session.getAttribute("enfant")));
    LinkedList<Animation> animations = enfant.getAnimationsJour();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Annulation</title>
    </head>
    <body>
        <h1>Selectionnez quelle(s) animation(s) vous voulez annuler</h1>
        </br>
        <form action="controleur" method="post" accept-charset="UTF-8">
        <%
            
            
            for (Animation a : animations) {
                
                int i = 0;
                out.println("</br>");
                
                out.println("<label for=\"" +  i + "\">" + a.getNom() + "   " + a.getJour() + "</label>");
                out.println("<input name=\"" + "annulation" + "\" type=\"checkbox\" value=\"" + a.getNom() + " " + a.getJour() + "\" id=\"" + i + "\" />");
                out.println("</br>");

                
                out.println("</br>");
                
            }
        %>  
        
        <input type="submit" value="Envoyer" />
        <input type ="hidden" name="action" value ="animationsAnnulees" />
        
    </body>
</html>
