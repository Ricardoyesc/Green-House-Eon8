package com.greeenHouse.plantitasmaven.servlets;

import com.greeenHouse.plantitasmaven.claseses.Usuario;
import com.greeenHouse.plantitasmaven.claseses.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BajaUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("error.jsp?msj=Metodo no soportado");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String password = request.getParameter("password");
        System.out.println(password);
        Usuario us = null;
        try {
            us = (Usuario) session.getAttribute("user");
        } catch (Exception e) {
            response.sendRedirect("error.jsp?msj=Inicie sesión para acceder al contenido");

        }
        if (us != null) {
            if (password.equals(us.getPassword())) {
                UsuarioDAO usuarios = new UsuarioDAO();
                try {
                    usuarios.BajaPorCorreo(us.getEmail());
                    session.invalidate();
                    response.sendRedirect("index.jsp");
                } catch (Exception ex) {
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
