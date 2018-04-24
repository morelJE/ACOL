

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listes des régimes</h1>
        
        <form action="controleur" method="post" accept-charset="UTF-8">
            <input type="text" name="regime" />
            <input type="submit" value="Ajouter" />
            <input type="hidden" name="action" value="ajouterRegime" /></br>
        </form> 
    </body>
</html>
