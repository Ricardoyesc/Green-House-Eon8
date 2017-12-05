package com.greeenHouse.plantitasmaven.claseses;

import com.greeenHouse.plantitasmaven.claseses.Planta;
import com.greeenHouse.plantitasmaven.util.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlantaDAO {

    private DB db = new DB();

    public List<Planta> buscarPlantasColeccion(String email) throws SQLException {
        String query = "call BuscaPlantasColeccion(?);";
        List<Planta> plantitas = new ArrayList<Planta>();
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                plantitas.add(crearDTOPlanta(rs));
            }
        }
        System.out.println(plantitas);
        return plantitas;

    }
    public void insertarPlantaCatalogo(String desPlanta,String nivLuz, String regAgua, String tipoPlanta, String ruta, String ruta2) throws SQLException {
        String query = "call añadePlantaCatalogo(?,?,?,?,?,?);";
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, desPlanta);
            ps.setString(2, nivLuz);
            ps.setString(3, regAgua);
            ps.setString(4, tipoPlanta);
            ps.setString(5, ruta);
            ps.setString(6, ruta2);
            ResultSet rs = ps.executeQuery();
        }
    }
    public void AñadeAColeccion(String email,String idPlanta, String nickName, String fertVal) throws SQLException {
        String query = "call AñadeAColeccion(?,?,?,?);";
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, idPlanta);
            ps.setString(3, nickName);
            ps.setString(4, fertVal);
            ResultSet rs = ps.executeQuery();
        }
    }
    
    public void eliminDeColeccion(String email,String idColPlanta) throws SQLException {
        String query = "call QuitaDeColeccion(?,?);";
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, idColPlanta);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
        }
    }

    public List<Planta> buscarPlantasCatalogo() throws SQLException {
        String query = "select regplanta.id_regPlata,des_nivLuz,des_regAgua,popular,des_tipoPlanta,ruta from regplanta \n"
                + "INNER JOIN nivluz on regplanta.id_nivLuz = nivluz.id_nivLuz\n"
                + "INNER JOIN regagua on regplanta.id_regAgua = regagua.id_regAgua\n"
                + "INNER JOIN tipoplanta on regplanta.id_tipoPlanta = tipoplanta.id_tipoPlanta\n"
                + "INNER JOIN rel_RutasRegPlantas on rel_RutasRegPlantas.id_regPlata = regplanta.id_regPlata\n"
                + "INNER JOIN rutas on rel_RutasRegPlantas.id_ruta = rutas.id_ruta\n"
                + "WHERE tipoRuta = 2\n"
                + "ORDER BY popular DESC";
        List<Planta> plantitas = new ArrayList<Planta>();
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                plantitas.add(crearDTOPlanta(rs));
            }
        }
        System.out.println(plantitas);
        return plantitas;

    }

    private Planta crearDTOPlanta(ResultSet rs){
        Planta plantae = new Planta();
        try {
            plantae.setNickName(rs.getString("nicknamePlanta"));
        } catch (SQLException ex) {
            plantae.setNickName(null);
        }
        
        try {
            plantae.setImgRute(rs.getString("ruta"));
        } catch (SQLException ex) {
            plantae.setImgRute(null);
        }
        
        try {
            plantae.setDesPlanta(rs.getString("desPlanta"));
        } catch (SQLException ex) {
            plantae.setDesPlanta(null);
        }
        
        try {
            plantae.setDesFertVal(rs.getString("desFertVal"));
        } catch (SQLException ex) {
            plantae.setDesFertVal(null);
        }
        
        try {
            plantae.setDes_nivLuz(rs.getString("des_nivLuz"));
        } catch (SQLException ex) {
            plantae.setDes_nivLuz(null);
        }
        
        try {
            plantae.setDes_regAgua(rs.getString("des_regAgua"));
        } catch (SQLException ex) {
            plantae.setDes_regAgua(null);
        }
        
        try {
            plantae.setDes_tipoPlanta(rs.getString("des_tipoPlanta"));
        } catch (SQLException ex) {
            plantae.setDes_tipoPlanta(null);
        }
        
        try {
            plantae.setPopular(rs.getString("popular"));
        } catch (SQLException ex) {
            plantae.setPopular(null);
        }
        
        try {
            plantae.setId(rs.getString("id_regPlata"));
        } catch (SQLException ex) {
            plantae.setPopular(null);
        }
        
        try {
            plantae.setIdCol(rs.getString("id_regColPlantas"));
        } catch (SQLException ex) {
            plantae.setPopular(null);
        }
        return plantae;
    }

}
