package com.greeenHouse.plantitasmaven.servlets;

import com.greeenHouse.plantitasmaven.claseses.Usuario;
import com.greeenHouse.plantitasmaven.claseses.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InicioSesion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("error.jsp?msj=Metodo no soportado");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        UsuarioDAO us = new UsuarioDAO();
        Usuario user;
        try {
            user = us.BuscarPorCorreo(email);
        } catch (Exception ex) {
            ex.printStackTrace();
            user = null;
        }

        if (user != null && user.getPassword().equals(password) && user.getEmail().equals(email)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");

        } else {
            response.sendRedirect("LogIn.jsp?err=true");
        }
    }

}
