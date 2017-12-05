package com.greeenHouse.plantitasmaven.servlets;

import com.greeenHouse.plantitasmaven.claseses.Usuario;
import com.greeenHouse.plantitasmaven.claseses.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ModificarInfoUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("error.jsp?msj=Metodo no soportado");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario us = null;
        try {
            us = (Usuario) session.getAttribute("user");
        } catch (Exception e) {
            response.sendRedirect("error.jsp?msj=Inicie sesión para acceder al contenido");
        }

        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String aPat = request.getParameter("aPat");
        String aMat = request.getParameter("aMat");
        String fecNac = request.getParameter("date").substring(0, 4) + request.getParameter("date").substring(5, 7) + request.getParameter("date").substring(8, 10);
        String genero = request.getParameter("genero");

        if (us != null) {
            if (us.getPassword().equals(password)) {
                UsuarioDAO usuarios = new UsuarioDAO();

                try {
                    usuarios.CambiarInfoUs(us.getEmail(), aPat, aMat, name, fecNac, genero);
                    us = usuarios.BuscarPorCorreo(us.getEmail());
                    session.setAttribute("user", us);
                    response.sendRedirect("perfil.jsp");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    response.sendRedirect("error.jsp?msj=Error:" + ex.getMessage());
                }
            } else {
                response.sendRedirect("error.jsp?msj=Contraseña incorrecta, Intentelo nuevamente");
            }
        } else {
            response.sendRedirect("error.jsp?msj=Inicie sesión para acceder al contenido");
        }
    }
}
