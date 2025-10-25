/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Usuario
 */
public class Usuario {
     int idDato;
     String identificacion;
     String nombre;
     String apellido;
     String email;
     long telefono;
     String usuario;
     String clave;
     int idPerfil;

     public Usuario() {
     }
     
     public Usuario(int idDato, String identificacion, String nombre, String apellido, String email, long telefono, String usuario, String clave, int idPerfil) {
        this.idDato = idDato;
        this.identificacion = identificacion;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.usuario = usuario;
        this.clave = clave;
        this.idPerfil = idPerfil;
     }
     public int getIddato() {
     return idDato;
     }
     public void setIddato(int iddato) {
     this.idDato = iddato;
     }
     public String getIdentificacion() {
     return identificacion;
     }
     public void setIdentificacion(String identificacion) {
     this.identificacion = identificacion;
     }
     public String getNombre() {
    return nombre;
    }
    public void setNombre(String nombre) {
    this.nombre = nombre;
    }
    public String getApellido() {
    return apellido;
    }
    public void setApellido(String apellido) {
    this.apellido = apellido;
    }
    public String getEmail() {
    return email;
    }
    public void setEmail(String email) {
    this.email = email;
    }
    public long getTelefono() {
    return telefono;
    }
    public void setTelefono(long telefono) {
    this.telefono = telefono;
    }
    public String getUsuario() {
    return usuario;
    }
    public void setUsuario(String usuario) {
    this.usuario = usuario;
    }
    public String getClave() {
    return clave;
    }
    public void setClave(String clave) {
    this.clave = clave;
    }
    public int getIdperfil() {
    return idPerfil;
    }
    public void setIdperfil(int idperfil) {
    this.idPerfil = idperfil;
    }

}
