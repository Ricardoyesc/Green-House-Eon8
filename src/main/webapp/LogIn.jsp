<%@page import="com.greeenHouse.plantitasmaven.claseses.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String err = request.getParameter("err");

    String error = "";

    if (err != null) {
        if (err.equals("true")) {
            error = "Usuario y contraseña invalido";
        }
    }

    Usuario us = new Usuario();
    try {
        us = ((Usuario) session.getAttribute("user"));
    } catch (Exception e) {
        us = null;
        e.printStackTrace();
    }
    if (us != null) {
        response.sendRedirect("perfil.jsp");
    }

%>
<html lang="es">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Inicia sesión</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/scrolling-nav.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index.jsp">Green House</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="index.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="SingUp.jsp">Registro</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2>Iniciar sesión</h2>
                        <form name="sentMessage" id="contactForm" method="POST" action="InicioSesion" >
                            <p class="help-block text-danger"><%=error%></p>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Correo electronico</label>
                                    <input class="form-control" id="email" name="email" type="email" placeholder="Correo electronico" required>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Contraseña</label>
                                    <input class="form-control" id="pass" name="pass" type="password" placeholder="Contraseña" required>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <br>
                            <div id=""></div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success btn-lg" id="sendMessageButton">Enviar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>




        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom JavaScript for this theme -->
        <script src="js/scrolling-nav.js"></script>

    </body>

</html>