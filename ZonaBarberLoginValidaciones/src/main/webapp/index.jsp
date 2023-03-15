<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map" %>
<%
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
    Map<String, String> erroresreg = (Map<String, String>) request.getAttribute("erroresreg");
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZonaBarber</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="estilos.css">
</head>
<body>

<main>

    <div class="contenedor__todo">

        <div class="caja__trasera">

            <img id="Fondo" src="img/LogoZonaBarber.png" >



            <div class="caja__trasera-login">

                <h3> ¿Ya tienes una cuenta?</h3>
                <p>Inicia sesión para entrar en la página</p>
                <button id="btn__iniciar-sesion">Iniciar Sesión</button>

            </div>



            <div class="caja__trasera-register">
                <h3>¿Aún no tienes una cuenta?</h3>
                <p>Regístrate para que puedas iniciar sesión</p>
                <button id="btn__registrarse">Regístrarse</button>
            </div>
            <img id="Fondo1" src="img/LogoZonaBarber.png" >

        </div>

        <!--Formulario de Login y registro-->
        <div class="contenedor__login-register">
            <!--Login-->
            <form action="/ZonaBarber-1.0-SNAPSHOT/form-login" class="formulario__login" method="post">
                <h2>Iniciar Sesión</h2>
                <input name="username" type="text" placeholder="Correo Electronico">
                <%
                    if (errores != null && errores.containsKey("username")){
                        out.println("<small style='color: red;'>" + errores.get("username") + "</small>");
                    }
                %>
                <input name="password" type="password" placeholder="Contraseña">
                <%
                    if (errores != null && errores.containsKey("password")){
                        out.println("<small style='color: red;'>" + errores.get("password") + "</small>");
                    }
                %>
                <button type="submit" >Entrar</button>
            </form>

            <!--Register-->
            <form method="post" action="/ZonaBarber-1.0-SNAPSHOT/form-registro" class="formulario__register">
                <h2>Regístrarse</h2>
                <input name="txtnombre" type="text" placeholder="Nombre">
                <%
                    if (erroresreg != null && erroresreg.containsKey("txtnombre")){
                        out.println("<small style='color: red;'>" + erroresreg.get("txtnombre") + "</small>");
                    }
                %>
                <input name="txtapellido" type="text" placeholder="Apellido">
                <%
                    if (erroresreg != null && erroresreg.containsKey("txtapellido")){
                        out.println("<small style='color: red;'>" + erroresreg.get("txtapellido") + "</small>");
                    }
                %>
                <input name="txtdireccion" type="text" placeholder="Direccion">
                <%
                    if (erroresreg != null && erroresreg.containsKey("txtdireccion")){
                        out.println("<small style='color: red;'>" + erroresreg.get("txtdireccion") + "</small>");
                    }
                %>
                <input name="txttipo_Identificacion" placeholder="Tipo de identificación" name="example" >
                <select name="exampleList">
                    <option value="Tarjeta de identidad">Tarjeta de identidad</option>
                    <option value="Cédula">Cédula</option>
                    <option value="Cédula Extranjera">Cédula Extranjera</option>
                </select>
                <%
                    if (erroresreg != null && erroresreg.containsKey("txttipo_Identificacion")){
                        out.println("<small style='color: red;'>" + erroresreg.get("txttipo_Identificacion") + "</small>");
                    }
                %>
                <input name="txtidentificacion" type="text" placeholder="Número de indentificación">
                <%
                    if (erroresreg != null && erroresreg.containsKey("txtidentificacion")){
                        out.println("<small style='color: red;'>" + erroresreg.get("txtidentificacion") + "</small>");
                    }
                %>
                <input name="txtcelular" type="text" placeholder="Télefono">
                <%
                    if (erroresreg != null && erroresreg.containsKey("txtcelular")){
                        out.println("<small style='color: red;'>" + erroresreg.get("txtcelular") + "</small>");
                    }
                %>
                <input name="txtcorreo" type="email" placeholder="Correo Electronico">
                <%
                    if (erroresreg != null && erroresreg.containsKey("txtcorreo")){
                        out.println("<small style='color: red;'>" + erroresreg.get("txtcorreo") + "</small>");
                    }
                %>
                <input name="txtpassword" type="password" placeholder="Contraseña">
                <%
                    if (erroresreg != null && erroresreg.containsKey("txtpassword")){
                        out.println("<small style='color: red;'>" + erroresreg.get("txtpassword") + "</small>");
                    }
                %>
                <button name="Servlet       " value="Ingresar"> Regístrarse</button>

            </form>
        </div>
        <%
            if (errores != null && errores.size()>0){
        %>
        <ul class="alert">
            <%for (String error: errores.values()){;%>
            <li><%out.println("<small style='color: red;'>" + error + "</small>");%></li>
            <%}%>
        </ul>
        <%}%>
        <%
            if (erroresreg != null && erroresreg.size()>0){
        %>
        <ul class="alert-danger">
            <%for (String errorreg: erroresreg.values()){;%>
            <li><%out.println("<small style='color: red;'>" + errorreg + "</small>");%></li>
            <%}%>
        </ul>
        <%}%>
    </div>

</main>

<script src="scripts.js"></script>
</body>
</html>