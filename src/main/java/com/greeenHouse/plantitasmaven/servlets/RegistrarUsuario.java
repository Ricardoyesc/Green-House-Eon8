package com.greeenHouse.plantitasmaven.servlets;

import com.greeenHouse.plantitasmaven.claseses.UsuarioDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrarUser")
public class RegistrarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("error.jsp?msj=Metodo no soportado");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UsuarioDAO us = new UsuarioDAO();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String aPat = request.getParameter("aPat");
        String aMat = request.getParameter("aMat");
        String date = request.getParameter("date").substring(0, 4) + request.getParameter("date").substring(5, 7) + request.getParameter("date").substring(8, 10);
        String genero = request.getParameter("genero");
        String tipoUs = "";

        if(request.getParameter("tipoUs").equals("usuario")){
            tipoUs = "1";
        }else if(request.getParameter("tipoUs").equals("AdministradorBergas")){
            tipoUs = "2";
        }else{
            response.sendRedirect("error.jsp?msj=Algo salio mal intentalo nuevamente");
        }

        System.out.println(date);
        
        try {
            String msj = us.registrarUs(email, password, aPat, aMat, name, date, genero, tipoUs);
            if (msj.equals("Registro fallido correo ya registrado.")) {
                response.sendRedirect("error.jsp?msj=" + msj);
            } else if (msj.equals("Se ha registrado con exito.")) {
                response.sendRedirect("LogIn.jsp");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp?msj=" + ex.getMessage());
        }

    }

}
