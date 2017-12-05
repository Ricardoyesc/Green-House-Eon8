<%@page import="com.greeenHouse.plantitasmaven.claseses.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    if (inicioSes) {
        if (us.getTipoUsuario().equals("Administrador")) {
            admin = true;
        }
    }

%>
<!DOCTYPE html>
<html lang="es">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>GreenHouse Inicio</title>

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
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index.jsp">Green House</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <%if (inicioSes) {
                                if (admin) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="subirPlanta.jsp">Administración</a>
                        </li>
                        <%}%>
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
        <header class="masthead">
            <div class="container">
                <img class="img-fluid" src="img/profile.png" alt="">
                <div class="intro-text">
                    <span class="name"> Green House</span>
                    <hr class="star-light">
                    <span class="skills">Cuidado de plantas al alcance de un click</span>
                </div>
            </div>
        </header>

        <!-- Portfolio Grid Section -->
        <section id="portfolio">
            <div class="container">
                <h2 class="text-center">Colección</h2>
                <hr class="star-primary">
                <div class="row">
                    <div class="col-sm-4 portfolio-item">
                        <a class="portfolio-link" href="#portfolioModal1" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"></i>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio/cabin.jpg" alt="">
                        </a>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <a class="portfolio-link" href="#portfolioModal2" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"></i>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio/cake.jpg" alt="">
                        </a>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <a class="portfolio-link" href="#portfolioModal3" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"></i>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio/circus.png" alt="">
                        </a>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <a class="portfolio-link" href="#portfolioModal4" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"></i>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio/game.png" alt="">
                        </a>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <a class="portfolio-link" href="#portfolioModal5" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"></i>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio/safe.png" alt="">
                        </a>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <a class="portfolio-link" href="#portfolioModal6" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"></i>
                                </div>
                            </div>
                            <img class="img-fluid" src="img/portfolio/submarine.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section class="success" id="about">
            <div class="container">
                <h2 class="text-center">Nosotros</h2>
                <hr class="star-light">
                <div class="row">
                    <div class="col-lg-4 ml-auto">
                        <p>Somos una empresa de jóvenes emprendedores comprometidos con el desarrollo de  software para tener un alcance mayor en nuestros servicios y poder brindar atención  a nuestros  usuarios,ofrecer un
                        </p>
                    </div>
                    <div class="col-lg-4 mr-auto">
                        <p>servicio de calidad  y personalizado para las distintas versiones del producto, utilizando tecnologías vanguardistas con la finalidad de  adaptarnos a las nuevas  tendencias</p>
                    </div>
                    <div class="col-lg-8 mx-auto text-center">

                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact">
            <div class="container">
                <h2 class="text-center">Contactanos</h2>
                <hr class="star-primary">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                        <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                        <form name="sentMessage" id="contactForm" novalidate>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Nombre</label>
                                    <input class="form-control" id="name" type="text" placeholder="Nombre" required data-validation-required-message="Please enter your name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Dirección de Email</label>
                                    <input class="form-control" id="email" type="email" placeholder="Dirección de Email" required data-validation-required-message="Please enter your email address.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Numero de telefono</label>
                                    <input class="form-control" id="phone" type="tel" placeholder="Numero de telefono" required data-validation-required-message="Please enter your phone number.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Mensaje</label>
                                    <textarea class="form-control" id="message" rows="5" placeholder="Mensaje" required data-validation-required-message="Please enter a message."></textarea>
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

        <!-- Footer -->
        <footer class="text-center">
            <div class="footer-above">
                <div class="container">
                    <div class="row">
                        <div class="footer-col col-md-4">
                            <h3>Ubicación</h3>
                            <p>Mar Mediterráneo 227, Nextitla 
                                <br>11400 Ciudad de México, CDMX</p>
                        </div>
                        <div class="footer-col col-md-4">
                            <h3>Otros sitios</h3>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <a class="btn-social btn-outline" href="#">
                                        <i class="fa fa-fw fa-facebook"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="btn-social btn-outline" href="#">
                                        <i class="fa fa-fw fa-google-plus"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="btn-social btn-outline" href="#">
                                        <i class="fa fa-fw fa-twitter"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="btn-social btn-outline" href="#">
                                        <i class="fa fa-fw fa-linkedin"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="btn-social btn-outline" href="#">
                                        <i class="fa fa-fw fa-dribbble"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="footer-col col-md-4">
                            <h3>EON8 Technology S.A. de C.V. </h3>
                            <p>Cruzando la barrera del Software
                                .</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-below">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            Copyright &copy; Propiedad de GreenHouse
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
        <div class="scroll-top d-lg-none">
            <a class="btn btn-primary js-scroll-trigger" href="#page-top">
                <i class="fa fa-chevron-up"></i>
            </a>
        </div>

        <!-- Portfolio Modals -->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl"></div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 mx-auto">
                                <div class="modal-body">
                                    <h2>Nombre de la planta</h2>
                                    <hr class="star-primary">
                                    <img class="img-fluid img-centered" src="img/portfolio/cabin.png" alt="">
                                    <p>Descripcion de la planta
                                        <a></a></p>
                                    <ul class="list-inline item-details">
                                        <li>Tipo:
                                            <strong>
                                                <a>Tipo de la planta</a>
                                            </strong>
                                        </li>
                                        <li>Regado:
                                            <strong>
                                                <a>Horario de regado</a>
                                            </strong>
                                        </li>
                                        <li>Cuidados Extra:
                                            <strong>
                                                <a>Cuidados adicionales</a>
                                            </strong>
                                        </li>
                                    </ul>
                                    <button class="btn btn-success" type="button" data-dismiss="modal">
                                        <i class="fa fa-times"></i>
                                        Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl"></div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 mx-auto">
                                <div class="modal-body">
                                    <h2>Nombre de la planta</h2>
                                    <hr class="star-primary">
                                    <img class="img-fluid img-centered" src="img/portfolio/cabin.png" alt="">
                                    <p>Descripcion de la planta
                                        <a></a></p>
                                    <ul class="list-inline item-details">
                                        <li>Tipo:
                                            <strong>
                                                <a>Tipo de la planta</a>
                                            </strong>
                                        </li>
                                        <li>Regado:
                                            <strong>
                                                <a>Horario de regado</a>
                                            </strong>
                                        </li>
                                        <li>Cuidados Extra:
                                            <strong>
                                                <a>Cuidados adicionales</a>
                                            </strong>
                                        </li>
                                    </ul>
                                    <button class="btn btn-success" type="button" data-dismiss="modal">
                                        <i class="fa fa-times"></i>
                                        Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl"></div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 mx-auto">
                                <div class="modal-body">
                                    <h2>Nombre de la planta</h2>
                                    <hr class="star-primary">
                                    <img class="img-fluid img-centered" src="img/portfolio/cabin.png" alt="">
                                    <p>Descripcion de la planta
                                        <a></a></p>
                                    <ul class="list-inline item-details">
                                        <li>Tipo:
                                            <strong>
                                                <a>Tipo de la planta</a>
                                            </strong>
                                        </li>
                                        <li>Regado:
                                            <strong>
                                                <a>Horario de regado</a>
                                            </strong>
                                        </li>
                                        <li>Cuidados Extra:
                                            <strong>
                                                <a>Cuidados adicionales</a>
                                            </strong>
                                        </li>
                                    </ul>
                                    <button class="btn btn-success" type="button" data-dismiss="modal">
                                        <i class="fa fa-times"></i>
                                        Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl"></div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 mx-auto">
                                <div class="modal-body">
                                    <h2>Nombre de la planta</h2>
                                    <hr class="star-primary">
                                    <img class="img-fluid img-centered" src="img/portfolio/cabin.png" alt="">
                                    <p>Descripcion de la planta
                                        <a></a></p>
                                    <ul class="list-inline item-details">
                                        <li>Tipo:
                                            <strong>
                                                <a>Tipo de la planta</a>
                                            </strong>
                                        </li>
                                        <li>Regado:
                                            <strong>
                                                <a>Horario de regado</a>
                                            </strong>
                                        </li>
                                        <li>Cuidados Extra:
                                            <strong>
                                                <a>Cuidados adicionales</a>
                                            </strong>
                                        </li>
                                    </ul>
                                    <button class="btn btn-success" type="button" data-dismiss="modal">
                                        <i class="fa fa-times"></i>
                                        Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl"></div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 mx-auto">
                                <div class="modal-body">
                                    <h2>Nombre de la planta</h2>
                                    <hr class="star-primary">
                                    <img class="img-fluid img-centered" src="img/portfolio/cabin.png" alt="">
                                    <p>Descripcion de la planta
                                        <a></a></p>
                                    <ul class="list-inline item-details">
                                        <li>Tipo:
                                            <strong>
                                                <a>Tipo de la planta</a>
                                            </strong>
                                        </li>
                                        <li>Regado:
                                            <strong>
                                                <a>Horario de regado</a>
                                            </strong>
                                        </li>
                                        <li>Cuidados Extra:
                                            <strong>
                                                <a>Cuidados adicionales</a>
                                            </strong>
                                        </li>
                                    </ul>
                                    <button class="btn btn-success" type="button" data-dismiss="modal">
                                        <i class="fa fa-times"></i>
                                        Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl"></div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 mx-auto">
                                <div class="modal-body">
                                    <h2>Nombre de la planta</h2>
                                    <hr class="star-primary">
                                    <img class="img-fluid img-centered" src="img/portfolio/cabin.png" alt="">
                                    <p>Descripcion de la planta
                                        <a></a></p>
                                    <ul class="list-inline item-details">
                                        <li>Tipo:
                                            <strong>
                                                <a>Tipo de la planta</a>
                                            </strong>
                                        </li>
                                        <li>Regado:
                                            <strong>
                                                <a>Horario de regado</a>
                                            </strong>
                                        </li>
                                        <li>Cuidados Extra:
                                            <strong>
                                                <a>Cuidados adicionales</a>
                                            </strong>
                                        </li>
                                    </ul>
                                    <button class="btn btn-success" type="button" data-dismiss="modal">
                                        <i class="fa fa-times"></i>
                                        Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Contact Form JavaScript -->
        <script src="js/jqBootstrapValidation.js"></script>
        <script src="js/contact_me.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/freelancer.min.js"></script>

    </body>

</html>
