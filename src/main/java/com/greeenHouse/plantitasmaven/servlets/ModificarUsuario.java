package com.greeenHouse.plantitasmaven.servlets;

import com.greeenHouse.plantitasmaven.claseses.Usuario;
import com.greeenHouse.plantitasmaven.claseses.UsuarioDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ModificarUsuario extends HttpServlet {

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

        String passwordN = request.getParameter("passwordN");
        String emailN = request.getParameter("emailN");
        String password = request.getParameter("password1");

        if (us != null) {
            if (us.getPassword().equals(password)) {
                UsuarioDAO usuarios = new UsuarioDAO();

                try {
                    usuarios.CambiarUs(us.getEmail(), emailN, passwordN);
                    us = usuarios.BuscarPorCorreo(emailN);
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
