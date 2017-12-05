package com.greeenHouse.plantitasmaven.servlets;

import com.greeenHouse.plantitasmaven.claseses.PlantaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EliminaDeColeccion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String str = "Metodo no soportado";
        response.sendRedirect("error.jsp?m=" + str);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String idCol = request.getParameter("idCol");
        
    PlantaDAO p = new PlantaDAO();
        try {
            p.eliminDeColeccion(email, idCol);
            response.sendRedirect("coleccion.jsp");
        } catch (Exception e) {
            response.sendRedirect("error.jsp?msj=" + e.getMessage());
        
        }
    }

}
