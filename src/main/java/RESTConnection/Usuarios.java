package RESTConnection;

import com.greeenHouse.plantitasmaven.claseses.Planta;
import com.greeenHouse.plantitasmaven.claseses.PlantaDAO;
import com.greeenHouse.plantitasmaven.claseses.Usuario;
import com.greeenHouse.plantitasmaven.claseses.UsuarioDAO;
import com.google.gson.Gson;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.*;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONArray;
import org.json.JSONObject;

@Path("/servicioUsuarios")
public class Usuarios {

    @GET
    @Path("/users/{email}")
    @Produces(MediaType.APPLICATION_XML)
    public Response getUser(@PathParam("email") String email) {
        UsuarioDAO us = new UsuarioDAO();
        JSONObject jsonObject;
        jsonObject = new JSONObject();
        String output = "";

        try {
            Usuario user = us.BuscarPorCorreo(email);
            jsonObject.put("email", user.getEmail());
            jsonObject.put("password", user.getPassword());
            jsonObject.put("nombre", user.getNombre());
            jsonObject.put("apellidoPaterno", user.getaPat());
            jsonObject.put("apellidoMaterno", user.getaMat());
            jsonObject.put("edad", user.getEdad());
            jsonObject.put("fechaNacimiento", user.getFechaNac());
            output = jsonObject.toString();
            return Response.status(200).entity(output).build();
        } catch (Exception ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(500).entity(output).build();
        }
    }

    @DELETE
    @Path("/users/{email}/{pass}")
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response BajaUsuario(@PathParam("email") String email, @PathParam("pass") String password) {
        String output = "";
        UsuarioDAO us = new UsuarioDAO();
        JSONObject jsonObject;
        jsonObject = new JSONObject();
        String msj = "";
        Usuario user;
        try {
            user = us.BuscarPorCorreo(email);
        } catch (SQLException ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(503).entity(output).build();
        } catch (Exception ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(500).entity(output).build();
        }
        System.out.println(email);

        if (password.equals(user.getPassword())) {
            try {
                us.BajaPorCorreo(email);
                msj = "Eliminado correctamente";
                jsonObject.put("Msj", msj);
                output = jsonObject.toString();
                return Response.status(200).entity(output).build();
            } catch (SQLException ex) {
                jsonObject.put("desError", ex.getMessage());
                output = jsonObject.toString();
                return Response.status(503).entity(output).build();
            } catch (Exception e) {
                jsonObject.put("desError", e.getMessage());
                output = jsonObject.toString();
                return Response.status(500).entity(output).build();
            }
        } else {
            jsonObject.put("Razon", "Correo o contraseña invalida");
            output = jsonObject.toString();
            return Response.status(503).entity(output).build();
        }
    }

    @POST
    @Path("/users")
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response RegistrarUsuario(@FormParam("email") String email, @FormParam("password") String password, @FormParam("name") String name, @FormParam("aPat") String aPat, @FormParam("aMat") String aMat, @FormParam("date") String date, @FormParam("genero") String genero) {
        String output = "";
        UsuarioDAO us = new UsuarioDAO();
        JSONObject jsonObject;
        jsonObject = new JSONObject();
        String msj = " ";
        try {
            msj = us.registrarUs(email, password, aPat, aMat, name, date, genero, "1");
            jsonObject.put("Msj", msj);
            output = jsonObject.toString();
            return Response.status(200).entity(output).build();
        } catch (SQLException ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(503).entity(output).build();
        } catch (Exception e) {
            jsonObject.put("desError", e.getMessage());
            output = jsonObject.toString();
            return Response.status(500).entity(output).build();
        }
    }

    @PUT
    @Path("/users")
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response ModificarInfoUsuario(@FormParam("name") String name, @FormParam("aPat") String aPat, @FormParam("aMat") String aMat, @FormParam("date") String date, @FormParam("genero") String genero, @FormParam("email") String email, @FormParam("password") String password) {
        String output = "";
        UsuarioDAO us = new UsuarioDAO();
        String msj = "";
        JSONObject jsonObject;
        jsonObject = new JSONObject();
        try {
            msj = us.CambiarInfoUs(email, aPat, aMat, name, date, genero);
            jsonObject.put("Msj", msj);
            output = jsonObject.toString();
            return Response.status(200).entity(output).build();
        } catch (SQLException ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(503).entity(output).build();
        } catch (Exception e) {
            jsonObject.put("desError", e.getMessage());
            output = jsonObject.toString();
            return Response.status(500).entity(output).build();
        }
    }

    @PUT
    @Path("/users/usData")
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response ModificarUsuario(@FormParam("email") String email, @FormParam("emailN") String emailN, @FormParam("password") String password) {
        String output = "";
        UsuarioDAO us = new UsuarioDAO();
        String msj = "";
        JSONObject jsonObject;
        jsonObject = new JSONObject();
        try {
            msj = us.CambiarUs(email, emailN, password);
            jsonObject.put("Msj", msj);
            output = jsonObject.toString();
            return Response.status(200).entity(output).build();
        } catch (SQLException ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(503).entity(output).build();
        } catch (Exception e) {
            jsonObject.put("desError", e.getMessage());
            output = jsonObject.toString();
            return Response.status(500).entity(output).build();
        }
    }

    @GET
    @Path("/users/coleccion/{email}")
    @Produces(MediaType.APPLICATION_XML)
    public Response getColUser(@PathParam("email") String email) {
        String output = "";
        UsuarioDAO us = new UsuarioDAO();
        Usuario user = new Usuario();
        PlantaDAO plantae = new PlantaDAO();
        ArrayList<Planta> coleccion = null;
        JSONObject jsonObject;
        jsonObject = new JSONObject();
        Gson gson = new Gson();
        try {
            user = us.BuscarPorCorreo(email);
        } catch (SQLException ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(503).entity(output).build();
        } catch (Exception ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(500).entity(output).build();
        }

        try {
            coleccion = (ArrayList<Planta>) plantae.buscarPlantasColeccion(user.getEmail());
            String arreglo = gson.toJson(coleccion);
            return Response.status(200).entity(arreglo).build();
        } catch (SQLException ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(503).entity(output).build();
        } catch (Exception ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(500).entity(output).build();
        }

    }

    @POST
    @Path("/users/coleccion/")
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response RelacionarCatalogo(@FormParam("email") String email, @FormParam("idPlanta") String idPlanta, @FormParam("nickName") String nickName, @FormParam("fertVal") String fertVal) {
        String output = "";
        UsuarioDAO us = new UsuarioDAO();
        PlantaDAO plantae = new PlantaDAO();
        JSONObject jsonObject;
        jsonObject = new JSONObject();
        if (email != null && idPlanta != null && nickName != null && fertVal != null) {
            try {
                plantae.AñadeAColeccion(email, idPlanta, nickName, fertVal);
                jsonObject.put("msj", "Añadido correctamente");
                output = jsonObject.toString();
                return Response.status(200).entity(output).build();
            } catch (SQLException ex) {
                jsonObject.put("desError", ex.getMessage());
                output = jsonObject.toString();
                return Response.status(503).entity(output).build();
            } catch (Exception ex) {
                jsonObject.put("desError", ex.getMessage());
                output = jsonObject.toString();
                return Response.status(500).entity(output).build();
            }
        } else {
            jsonObject.put("desError", "campos vacios");
            output = jsonObject.toString();
            return Response.status(500).entity(output).build();
        }

    }

    @DELETE
    @Path("/users/coleccion/{email}/{idCol}")
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response EliminaColeccion(@PathParam("email") String email, @PathParam("idCol") String idCol) {
        String output = "";
        PlantaDAO plantae = new PlantaDAO();
        JSONObject jsonObject;
        jsonObject = new JSONObject();
        String msj = "";
        Usuario user;
        try {
            plantae.eliminDeColeccion(email,idCol);
            msj = "Eliminado correctamente";
            jsonObject.put("Msj", msj);
            output = jsonObject.toString();
            return Response.status(200).entity(output).build();
        } catch (SQLException ex) {
            jsonObject.put("desError", ex.getMessage());
            output = jsonObject.toString();
            return Response.status(503).entity(output).build();
        } catch (Exception e) {
            jsonObject.put("desError", e.getMessage());
            output = jsonObject.toString();
            return Response.status(500).entity(output).build();
        }
    }

}
