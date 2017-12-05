<%@page import="com.greeenHouse.plantitasmaven.claseses.Usuario"%>
<!DOCTYPE html>
<%
    String msj = "";
    if(request.getParameter("msj") != null){
        msj = request.getParameter("msj");
    }else{
        msj = "Algo salio mal intentalo de nuevo.";
    }
    
    boolean inicioSes = false;
    Usuario us = new Usuario();
    try {
        us = ((Usuario) session.getAttribute("user"));
    } catch (Exception e) {
        e.printStackTrace();
    }
    if (us != null) {
        inicioSes = true;
    }

%>
<html lang="es">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Error</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template -->
        <link href="css/freelancer.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top navbar-shrink" id="mainNav">
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
                        <%if (inicioSes) {%>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="perfil.jsp"><%=us.getNombre()%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="coleccion.jsp">Colección</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="catalogo.jsp">Catalogo</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="CerrarSes">Cerrar sesión</a>
                        </li>
                        <%} else {%>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="SingUp.jsp">Registro</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="LogIn.jsp">Login</a>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Header -->
        <header class="masthead" style="padding-top: 5em;">
            <div class="container">
                <img class="img-fluid" src="img/error.png" alt="">
                <div class="intro-text">
                    <span class="name">Green House</span>
                    <hr class="star-light">
                    <span class="skills"><%=msj%></span>
                </div>
            </div>
        </header>


        
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Contact Form JavaScript -->
        <script src="js/jqBootstrapValidation.js"></script>
        <script src="js/contact_me.js"></script>


    </body>

</html>
