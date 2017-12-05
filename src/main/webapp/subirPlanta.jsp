<%@page import="com.greeenHouse.plantitasmaven.claseses.Usuario"%>
<!DOCTYPE html>
<%
    boolean inicioSes = false;
    boolean admin = false;
    
    Usuario us = new Usuario();
    try {
        us = ((Usuario) session.getAttribute("user"));
    } catch (Exception e) {
        e.printStackTrace();
    }
    if (us != null) {
        inicioSes = true;
    }
    if(inicioSes){
        if(us.getTipoUsuario().equals("Administrador")){
            admin = true;
        }
    }

%>

<html lang="es">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Añadir plantas - Administrador</title>

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

        <%if (inicioSes) {%>

        <header class="bg-primary text-white">
            <div class="container text-center">
                <h1>Bienvenido <%=us.getNombre()%></h1>
                <p class="lead">Aqui añadir nuevas plantas al catalogo</p>
            </div>
        </header>

        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2>Añade una planta:</h2>
                        <form name="añadePlanta" enctype="multipart/form-data"  id="añadePlanta" action="SubirPlantas" method="POST" novalidate>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Tipo de planta</label>
                                    <input class="form-control" name="tipoPlanta" id="tipoPlanta" type="text" placeholder="Tipo de planta" required>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Descripcion de la planta</label>
                                    <input class="form-control" name="DescripcionPlanta" id="DescripcionPlanta" type="text" placeholder="Descripción de la planta" required maxlength="50">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Nivel de luz</label>
                                    <input class="form-control" name="NivLuz" id="NivLuz" type="text" placeholder="Describe el tipo de luz que recibira la planta" required>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Frecuncia con la que regar</label>
                                    <input class="form-control" name="desRegAgua" id="desRegAgua" type="text" placeholder="Describe la forma de la que se regara la planta" required>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Seleccione imagen 1 (700 x 300px)</label>
                                    <br>
                                    <input type="file" name="img" id="img" />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Seleccione imagen 2 (700 x 400px)</label>
                                    <br>
                                    <input type="file" name="img2" id="img2" />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Escribe tu contraseña actual para confirmar los cambios</label>
                                    <input class="form-control" id="password" name="password" type="password" rows="5" placeholder="Contraseña" required data-validation-required-message="Please enter a message.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <br>
                            <div id="success"></div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success btn-lg" id="sendMessageButton">Enviar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%} else {%>
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template -->
        <link href="css/freelancer.min.css" rel="stylesheet">



        <header class="masthead" style="padding-top: 8em;">
            <div class="container">
                <img class="img-fluid" src="img/profile.png" alt="">
                <div class="intro-text">
                    <span class="name">Green House</span>
                    <hr class="star-light">
                    <span class="skills">Inicia sesión para acceder a este contenido.</span>
                </div>
            </div>
        </header>


        <%}%>


        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Green House 2017</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom JavaScript for this theme -->
        <script src="js/scrolling-nav.js"></script>

    </body>

</html>

