<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modification des prix des TAP</title>
    </head>
    <body>
        <form action="controleur" method="post" accept-charset="UTF-8">
            <input type="submit" value="Modifier" />
            <input type="hidden" name="action" value="modifCantine" /></br>
        </form>
        <form action="controleur" method="post" accept-charset="UTF-8">
            <input type="submit" value="Modifier" />
            <input type="hidden" name="action" value="modifGarderie" /></br>
        </form>
    </body>
</html>
