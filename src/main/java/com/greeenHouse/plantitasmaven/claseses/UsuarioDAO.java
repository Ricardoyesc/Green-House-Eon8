package com.greeenHouse.plantitasmaven.claseses;

import com.greeenHouse.plantitasmaven.util.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class UsuarioDAO {

    private DB db = new DB();

    public Usuario BuscarPorCorreo(String correo) throws SQLException {
        String query = "SELECT infouser.apPaterno, infouser.apMaterno, infouser.nombres, infouser.feNacimiento, infouser.id_Sexo, usuario.correoUser, usuario.passwordUser, tipoUsuario.desc_TipoUser FROM infouser INNER JOIN usuario ON  infouser.id_User=usuario.id_User INNER JOIN tipoUsuario ON tipoUsuario.id_TipoUser = infouser.id_TipoUser WHERE usuario.correoUser = '" + correo + "';";
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            rs.first();
            Usuario us = crearDTOUsuario(rs);
            return us;
        }
    }

    public String registrarUs(String email, String password, String aPat, String aMat, String nombres, String fecNac, String genero, String tipoUs) throws SQLException {
        String query = "call registrarUs(?,?,?,?,?,?,?,?);";
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nombres);
            ps.setString(2, aPat);
            ps.setString(3, aMat);
            ps.setString(4, email);
            ps.setString(5, password);
            ps.setString(6, fecNac);
            ps.setString(7, genero);
            ps.setString(8, tipoUs);
            ResultSet rs = ps.executeQuery();
            rs.first();
            return rs.getString("msj");
        }

    }

    public String CambiarUs(String email, String emailN, String passwordN) throws SQLException {
        String query = "call CambiaUS(?,?,?);";
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, emailN);
            ps.setString(3, passwordN);
            ResultSet rs = ps.executeQuery();
            rs.first();
            return rs.getString("msj");
        }
    }

        

    public String CambiarInfoUs(String email, String aPatN, String aMatN, String nombreN, String fecNacN, String generoN) throws SQLException {
        String query = "call CambiaInfoUs(?,?,?,?,?,?);";
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, aPatN);
            ps.setString(3, aMatN);
            ps.setString(4, nombreN);
            ps.setString(5, fecNacN);
            ps.setString(6, generoN);
            ResultSet rs = ps.executeQuery();
            rs.first();
            return rs.getString("msj");
        }

    }

    public void BajaPorCorreo(String correo) throws SQLException {
        String query = "call BajaUs(?);";
        try (Connection con = db.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, correo);
            ResultSet rs = ps.executeQuery();

        }
    }

    public DB getDb() {
        return db;
    }

    public void setDb(DB db) {
        this.db = db;
    }

    private Usuario crearDTOUsuario(ResultSet rs) throws SQLException {
        String fecNac = rs.getString("feNacimiento");
        String año = fecNac.substring(0, 4);
        String mes = fecNac.substring(5, 7);
        String dia = fecNac.substring(8, 10);

        Usuario p;
        p = new Usuario(rs.getString("nombres"), rs.getString("apPaterno"), rs.getString("apMaterno"), rs.getString("correoUser"), rs.getString("passwordUser"), rs.getString("desc_TipoUser"), LocalDate.of(Integer.parseInt(año), Integer.parseInt(mes), Integer.parseInt(dia)));
        return p;
    }

}
