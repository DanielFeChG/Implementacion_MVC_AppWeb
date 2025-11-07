/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author Universidad
 */
public class LoginDAO {

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs;

    public LoginDAO() {
    }

    public Usuario Login_datos(String usuario, String clave) {
        Usuario datos = null;
        try {
            Conexion cn = new Conexion();
            con = cn.crearConexion();
            stmt = (PreparedStatement) con.prepareStatement("SELECT * FROM datos WHERE usuario =  ? AND  clave =  ?");
            stmt.setString(1, usuario);
            stmt.setString(2, clave);
            rs = stmt.executeQuery();
            if (rs.next()) {
                datos = new Usuario();
                datos.setUsuario(rs.getString("usuario"));
                datos.setClave(rs.getString("clave"));
            }
            else{
                System.out.println("Error de login");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
        }
        return datos;
    }
}
