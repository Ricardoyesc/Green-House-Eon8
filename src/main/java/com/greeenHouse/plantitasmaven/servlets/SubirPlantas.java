package com.greeenHouse.plantitasmaven.servlets;

import com.greeenHouse.plantitasmaven.claseses.PlantaDAO;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import java.io.*;
import java.sql.SQLException;

public class SubirPlantas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("error.jsp?msj=Metodo no soportado");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipoPlanta = null;
        String DescripcionPlanta = null;
        String NivLuz = null;
        String desRegAgua = null;

        /*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();

        /*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        /*sacando los FileItem del ServletFileUpload en una lista */
        List items = null;
        try {
            items = servlet_up.parseRequest(request);
        } catch (FileUploadException ex) {
            ex.printStackTrace();
        }

        getServletContext().getRealPath("index.jsp");
        ArrayList<String> arr = new ArrayList<String>();

        for (int i = 0; i < items.size(); i++) {
            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(i);
            /*item.isFormField() false=input file; true=text field*/
            if (!item.isFormField()) {
                File archivo_server = new File((getServletContext().getRealPath("index.jsp").replace("index.jsp", "img\\") + item.getName()).replaceAll("\\s","_"));
                try {
                    /*y lo escribimos en el servido*/
                    item.write(archivo_server);
                    arr.add("img\\" + item.getName().replaceAll("\\s","_"));

                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            } else {
                String key = item.getFieldName();
                switch(key){
                    case "tipoPlanta" :
                        tipoPlanta = item.getString();
                        break;
                    case "DescripcionPlanta" :
                        DescripcionPlanta = item.getString();
                        break;
                    case "NivLuz" :
                        NivLuz = item.getString();
                        break;
                    case "desRegAgua" :
                        desRegAgua = item.getString();
                        break;
                }
                        
                }
            }
            PlantaDAO plantae = new PlantaDAO();
            try {
                plantae.insertarPlantaCatalogo(DescripcionPlanta, NivLuz, desRegAgua, tipoPlanta, arr.get(0), arr.get(1));
                response.sendRedirect("catalogo.jsp");
            } catch (SQLException ex) {
                response.sendRedirect("error.jsp?msj="+ ex.getMessage() );
            }
        }

    }
