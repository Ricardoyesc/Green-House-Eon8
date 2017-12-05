package com.greeenHouse.plantitasmaven.servlets;

import com.greeenHouse.plantitasmaven.claseses.PlantaDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RelacionarCatalogo extends HttpServlet {

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
        String idPlanta = request.getParameter("idPlanta");
        String nickName = request.getParameter("nickName");
        String fertVal = request.getParameter("fertVal");

        PlantaDAO p = new PlantaDAO();
        try {
            p.AñadeAColeccion(email, idPlanta, nickName, fertVal);
            response.sendRedirect("coleccion.jsp");
        } catch (SQLException ex) {
            response.sendRedirect("error.jsp?msj=" + ex.getMessage());
        }
    }

}
