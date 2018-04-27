<%-- 
    Document   : AjoutAnimation
    Created on : Apr 26, 2018, 3:30:45 PM
    Author     : hamme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8" />
        <title>Ajout d'une Animation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Ajout de l'animation</h1>

        <form action="controleur" method="post" accept-charset="UTF-8">
            
            <ul>
                <li> Nom : <input type="text" name="nom"/></li>
                <li> Effectif : <input type="number" name="effectif" min='0'/></li>
                <li> Prix <input type="number" name="prix" min="1"/> </li>
            </ul>
            Selectionnez au moins un jour pour l'animation : 
            <label for="Lun">Lundi</label>
            <input name="JourAnimation" type="checkbox" value="Lundi" id="Lun" />
            <label for="Mar">Mardi</label>
            <input name="JourAnimation" type="checkbox" value="Mardi" id="Mar"/>
            <label for="Mer">Mercredi</label>
            <input name="JourAnimation" type="checkbox" value="Mercredi" id="Mer"/>
            <label for="Jeu">Jeudi</label>
            <input name="JourAnimation" type="checkbox" value="Jeudi" id="Jeu"/>
            <label for="Ven">Vendredi</label>
            <input name="JourAnimation" type="checkbox" value="Vendredi" id="Ven"/>
            
            <input type="submit" value="Envoyer" />
            <input type ="hidden" name="action" value ="animationRemplie" />
        </form>
        <form action="controleur" method="post" accept-charset="UTF-8">
            <input type="submit" value="Retourner à l'accueil" />
            <input type="hidden" name="action" value="retourAccueil" /></br>
        </form> 
        
    </body>
</html>
