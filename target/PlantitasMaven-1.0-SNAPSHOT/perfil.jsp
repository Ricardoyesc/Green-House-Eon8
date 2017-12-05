<%@page import="com.greeenHouse.plantitasmaven.claseses.Usuario"%>
<!DOCTYPE html>
<%
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

        <title>Perfil</title>

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
                <p class="lead">Aqui podras administrar tu perfil</p>
            </div>
        </header>

        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2>Modificar datos personales:</h2>
                        <form name="UpdateInfoUs" id="UpdateInfoUs" action="ModificarInfoUsuario" method="POST" novalidate>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Nuevo(s) nombre(s)</label>
                                    <input class="form-control" name="name" id="name" type="text" placeholder="<%=us.getNombre()%>" required>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Nuevo apellido paterno</label>
                                    <input class="form-control" name="aPat" id="aPat" type="text" placeholder="<%=us.getaPat()%>" required>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Nuevo apellido materno</label>
                                    <input class="form-control" name="aMat" id="aMat" type="text" placeholder="<%=us.getaMat()%>" required>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Nueva fecha de nacimiento</label>
                                    <input class="form-control" name="date" id="date" type="date" placeholder="dd/mm/yyyy" value="<%=us.getFechaNac()%>" required>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Nuevo genero</label>
                                    <br>
                                    <br>
                                    <label class="btn"><input class="form-control" name="genero" id="genero" type="radio" value="1" required>Masculino</label>
                                    <label class="btn"><input class="form-control" name="genero" id="genero" type="radio" value="2" required>Femenino</label>
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
        <section class="bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2>Modificar datos de tu cuenta:</h2>
                        <form name="UpdateUs" id="UpdateUs" action="ModificarUsuario" method="POST" novalidate>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Nuevo correo electronico</label>
                                    <input class="form-control" id="emailN" name="emailN" type="email" placeholder="<%=us.getEmail()%>" required data-validation-required-message="Please enter your name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Nueva contraseña</label>
                                    <input class="form-control" id="passwordN" name="passwordN" type="password" placeholder="Nueva contraseña" required data-validation-required-message="Please enter your email address.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Confirmar nueva contraseña</label>
                                    <input class="form-control" id="passwordN2" name="passwordN2" type="password" placeholder="Repita la nueva contraseña" required data-validation-required-message="Please enter your phone number.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Escribe tu contraseña actual para confirmar los cambios</label>
                                    <input class="form-control" id="password1" name="password1" type="password" placeholder="Contraseña" required data-validation-required-message="Please enter your phone number.">
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

        <section id="services" style="background-color: #EBECED">
            <div class="container">
                <form name="BajaUs" action="BajaUsuario" method="POST">    
                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            <h2>Dar de baja tu cuenta</h2>
                            <div class="form-group floating-label-form-group controls">
                                <label>Contraseña</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success btn-lg" id="BajaUsButton">Aceptar</button>
                        </div>

                    </div>

                </form>
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
