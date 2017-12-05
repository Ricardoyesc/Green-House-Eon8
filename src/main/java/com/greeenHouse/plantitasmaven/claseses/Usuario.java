package com.greeenHouse.plantitasmaven.claseses;

import java.time.LocalDate;
import java.time.Period;

public class Usuario {

    private String nombre;
    private String aPat;
    private String aMat;
    private String email;
    private String password;
    private String tipoUsuario;
    private LocalDate fechaNac;
    private int edad;

    Usuario(String nombre, String aPat, String aMat, String email, String password, String tipoUsuario, LocalDate fechaNac) {
        this.nombre = nombre;
        this.aPat = aPat;
        this.aMat = aMat;
        this.email = email;
        this.password = password;
        this.fechaNac = fechaNac;
        this.tipoUsuario = tipoUsuario;
        LocalDate ahora = LocalDate.now();
        Period periodo = Period.between(fechaNac, ahora);

        this.edad = periodo.getYears();
    }

    public Usuario() {
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getaPat() {
        return aPat;
    }

    public void setaPat(String aPat) {
        this.aPat = aPat;
    }

    public String getaMat() {
        return aMat;
    }

    public void setaMat(String aMat) {
        this.aMat = aMat;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(LocalDate fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
}
