<%@page import="com.greeenHouse.plantitasmaven.claseses.PlantaDAO"%>
<%@page import="com.greeenHouse.plantitasmaven.claseses.Planta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.greeenHouse.plantitasmaven.claseses.Usuario"%>
<!DOCTYPE html>
<%
    boolean inicioSes = false;
    boolean hayColeccion = false;
    Usuario us = new Usuario();
    PlantaDAO plantae = new PlantaDAO();
    ArrayList<Planta> coleccion = null;
    try {
        us = ((Usuario) session.getAttribute("user"));
    } catch (Exception e) {
        e.printStackTrace();
    }
    if (us != null) {
        inicioSes = true;
        coleccion = (ArrayList<Planta>) plantae.buscarPlantasColeccion(us.getEmail());
    }

    if (coleccion != null && inicioSes) {
        hayColeccion = true;
    }

%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Colección</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/1-col-portfolio.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    </head>

    <body>

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
        <%if (inicioSes && hayColeccion) {%>
        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading -->
            <h1 class="my-4">Colección  
                <small></small>
            </h1>

            <%for (int i = 0; i < coleccion.size(); i++) {
            %>
            <!-- Project One -->
            <div class="row">
                <div class="col-md-7">
                    <a href="#">
                        <img class="img-fluid rounded mb-3 mb-md-0" src="<%=coleccion.get(i).getImgRute()%>" alt="">
                    </a>
                </div>
                <div class="col-md-5">
                    <h3><%=coleccion.get(i).getNickName()%></h3>
                    <p><%=coleccion.get(i).getDesPlanta()%></p>
                    <a class="btn btn-primary" href="<%="#" + coleccion.get(i).toString().substring(16, coleccion.get(i).toString().length())%>" data-toggle="modal">Ver caracteristicas</a>
                    <form name="Elimina" action="EliminaDeColeccion" method="POST">
                        <input type="email" name="email" value="<%=us.getEmail()%>" hidden />
                        <input type="text" name="idCol" value="<%=coleccion.get(i).getIdCol()%>" hidden />
                        <input class="btn btn-danger" type="submit" value="Eliminar de la colección"/>
                    </form>
                </div>
            </div>
            <br>
            <!-- /.row -->
            <%}%>
            <hr>

        </div>

        <%for (int i = 0; i < coleccion.size(); i++) {%>
        <div class="portfolio-modal modal fade" id="<%=coleccion.get(i).toString().substring(16, coleccion.get(i).toString().length())%>" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2><%=coleccion.get(i).getDes_tipoPlanta()%></h2>
                                    <hr class="star-primary">
                                    <img class="img-fluid img-centered" src="img/portfolio/cabin.png" alt="">
                                    <p>Descripción: 
                                        <br>
                                    <ul type="square">
                                        <li><%=coleccion.get(i).getDesPlanta()%></li>
                                    </ul>
                                    </p>
                                    <p>Nivel de luz:  
                                        <br>
                                    <ul type="square">
                                        <li><%=coleccion.get(i).getDes_nivLuz()%></li>
                                    </ul>
                                    </p>
                                    <p>Requiere regar:
                                        <br>
                                    <ul type="square">
                                        <li><%=coleccion.get(i).getDes_regAgua()%></li>
                                    </ul>
                                    </p>
                                    <%if (coleccion.get(i).getDesFertVal().equals("true")) {%>
                                    <p style="color: red;">Requiere fertilizante</p>
                                    <%} else {%>

                                    <%}%>
                                    <button class="btn btn-success" type="button" data-dismiss="modal">
                                        <i class="fa fa-times"></i>
                                        Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%}%>


        <!-- /.container -->
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

        <!-- Contact Form JavaScript -->
        <script src="js/jqBootstrapValidation.js"></script>
        <script src="js/contact_me.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/freelancer.min.js"></script>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
