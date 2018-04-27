<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modele.Enfant" %>
<%@ page import="dao.enfantsDao" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.annotation.Resource" %>

<%!
    @Resource(name = "jdbc/acol")
    private DataSource ds;
%>

<%
    enfantsDao enfDao = (enfantsDao) request.getAttribute("enfants");
    LinkedList<Enfant> enfants = enfDao.getEnfants();
    double prixTotal = 0;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enfants</title>
        <link rel="stylesheet" type="text/css" href="stylesFacture.css">
    </head>
    <body>
        <h1> Facture d'activités periscolaires </h1>
        <%
            out.println("\t\t<ul>");
            for (int i = 0; i < enfants.size(); i++) {
                LinkedList<String> animations = enfDao.getAnimations(enfants.get(i).getPrenom());
                for(int j =0; j<animations.size();j++){
                    try (Connection c = ds.getConnection()) {
                        PreparedStatement p = c.prepareStatement("SELECT ACTIVITE,PRIX FROM TANIMATION");
                        ResultSet rs = p.executeQuery();
                        while (rs.next()) {
                            String nomActivite = rs.getString(1);
                            if(nomActivite.equals(animations.get(j))){
                                double prix = rs.getDouble(2);
                                out.println("\t\t\t<li>" + enfants.get(i).getPrenom() + " participe à l'activité : " + nomActivite + " pour un prix de " + prix + "euros.");
                                prixTotal += prix;
                                break;
                            }
                    }
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
            }
            }
            out.println("\t\t<ul>");
            out.println("\t\t\t<li>" + "Vous allez donc devoir payer : " + prixTotal + " euros pour cette semaine.");
            out.println("\t\t</ul>");

        %>
        <form action="controleur" method="post" accept-charset="UTF-8">
            <input type="submit" value="Retourner à l'accueil" />
            <input type="hidden" name="action" value="retourAccueil" /></br>
        </form> 
    </body>
</html>