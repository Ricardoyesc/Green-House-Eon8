<%@page import="com.greeenHouse.plantitasmaven.claseses.PlantaDAO"%>
<%@page import="com.greeenHouse.plantitasmaven.claseses.Planta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.greeenHouse.plantitasmaven.claseses.Usuario"%>
<!DOCTYPE html>
<%
    boolean inicioSes = false;
    Usuario us = new Usuario();
    PlantaDAO plantaD = new PlantaDAO();
    ArrayList<Planta> plantas = new ArrayList<Planta>();
    try {
        plantas = (ArrayList<Planta>) plantaD.buscarPlantasCatalogo();
    } catch (Exception e) {
        response.sendRedirect("error.jsp?msj=" + e.getMessage());
    }

    try {
        us = ((Usuario) session.getAttribute("user"));
    } catch (Exception e) {
        response.sendRedirect("error.jsp?msj=" + e.getMessage());
    }
    if (us != null) {
        inicioSes = true;
    }

%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Catalogo</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-homepage.css" rel="stylesheet">

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
                            <a class="nav-link js-scroll-trigger" href="coleccion.jsp">Colección</a>
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

        <!-- Page Content -->
        <%if (inicioSes) {%>
        <div class="container">

            <div class="row">

                <header class="col-lg-3">
                    <div class="container text-center">
                        <h1>Catalogo</h1>
                        <p class="lead">Aqui podras ver todas las plantas que nuestra base de datos tiene</p>
                    </div>
                </header>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">


                    <div class="row">
                        <%for (int i = 0; i < plantas.size(); i++) {%>
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <img class="card-img-top" src="<%=plantas.get(i).getImgRute()%>" alt="">
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <p><%=plantas.get(i).getDes_tipoPlanta()%> </p>
                                    </h4>
                                </div>
                                <div class="card-footer">
                                    <form action="RelacionarCatalogo" method="POST" >
                                        <input type="text" name="idPlanta" hidden value="<%=plantas.get(i).getId()%>"/>
                                        <input type="text" name="email" hidden value="<%=us.getEmail()%>"/>
                                        <input type="text" name="nickName" placeholder="Nickname"/>
                                        <div class="form-group floating-label-form-group controls">
                                            <label>¿Se usara fertilizante?</label>
                                            <br>
                                            <label class="btn"><input class="form-control" name="fertVal" id="fertVal" type="radio" value="1" required>Si</label>
                                            <label class="btn"><input class="form-control" name="fertVal" id="fertVal" type="radio" value="2" required>No</label>
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <input class="btn btn-primary" type="submit" value="Añadir a la colección"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
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
                <p class="m-0 text-center text-white">Copyright &copy; GreenHouse 2017</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
