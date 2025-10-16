/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import model.*;
import interfaces.CRUD;
import interfaces.CRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class UsuarioDAO implements CRUD {
        @Override
        public int agregarUsuario(Usuario u) {
            Conexion cn = new Conexion();
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
            int estatus = 0;

            try {
            con = cn.crearConexion();
            String q = "INSERT INTO tb_user (identificacion, nombre, apellido, email, telefono, usuario, clave, perfil)" + "values (?,?,?,?,?,?,?,?)";

            ps = con.prepareStatement(q);

            ps.setString(1, u.getIdentificacion());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getApellido());
            ps.setString(4, u.getEmail());
            ps.setLong(5, u.getTelefono());
            ps.setString(6, u.getUsuario());
            ps.setString(7, u.getClave());
            ps.setInt(8, u.getIdperfil());

            estatus = ps.executeUpdate();
            con.close();

            System.out.print("REGISTRO GUARDADO DE FORMA EXITOSA...");

            }catch (SQLException ex) {
                System.out.println("❌ ERROR AL REGISTRAR LA ACTIVIDAD:");
                ex.printStackTrace();
            }

            return estatus;
        }
    
        @Override
        public int actualizarUsuarios(Usuario u) {
            Conexion cn = new Conexion();
            Connection con;
            PreparedStatement ps;
            int estatus = 0;

            try {
                con = cn.crearConexion();
                String q = "UPDATE user SET identificacion=?, nombre=?, apellido=?, email=?, usuario=?,clave =  ? WHERE  iddato =  ?";

                ps = con.prepareStatement(q);

                ps.setString(1, u.getIdentificacion());
                ps.setString(2, u.getNombre());
                ps.setString(3, u.getApellido());
                ps.setString(4, u.getEmail());
                ps.setString(5, u.getUsuario());
                ps.setString(6, u.getClave());
                ps.setInt(7, u.getIddato());

                estatus = ps.executeUpdate();
                con.close();

                System.out.print("REGISTRO ACTUALIZADO DE FORMA EXITOSA...");

            } catch (SQLException ex) {
                System.out.print("ERROR AL ACTUALIZAR LA ACTIVIDAD...");
                System.out.print(ex.getMessage());
            }
            return estatus;
        }
        
        @Override
        public int eliminarUsuarios(int id) {
            Conexion cn = new Conexion();
            Connection con;
            PreparedStatement ps;

            int estatus = 0;

            try {
            con = cn.crearConexion();
            String q = "DELETE FROM user WHERE iddato =?";

            ps = con.prepareStatement(q);
            ps.setInt(1, id);

            estatus = ps.executeUpdate();
            con.close();

            System.out.print("REGISTRO ELIMINADO DE FORMA EXITOSA...");

            }catch (SQLException ex){
            System.out.print("ERROR AL ELIMINAR EL REGISTRO...");
            System.out.print(ex.getMessage());
            }
            return estatus;
        }
        
        @Override
        public Usuario listarUsuarios_Id(int id) {
            Conexion cn = new Conexion();
            Usuario u = new Usuario();
            Connection con;
            PreparedStatement ps;
            ResultSet rs;

            try {
                con = cn.crearConexion();
                String q = "SELECT * FROM user WHERE iddato =?";

                ps = con.prepareStatement(q);
                ps.setInt(1, id);

                rs = ps.executeQuery();

                if (rs.next()) {
                    u.setIddato(rs.getInt("iddato"));
                    u.setIdentificacion(rs.getString("identificacion"));
                    u.setNombre(rs.getString("nombre"));
                    u.setApellido(rs.getString("apellido"));
                    u.setEmail(rs.getString("email"));
                    u.setUsuario(rs.getString("usuario"));
                    u.setClave(rs.getString("clave"));
                    u.setIdperfil(rs.getInt("id_perfil"));
                }

                System.out.print("REGISTRO ENCONTRADO DE FORMA EXITOSA...");
                con.close();

            } catch (SQLException ex) {
                System.out.print("ERROR AL BUSCAR EL REGISTRO...");
                System.out.print(ex.getMessage());
            }
            return u;
        }

    @Override
    public List<Usuario> listadoUsuarios() {
        List<Usuario> lista = new ArrayList<Usuario>();
        Conexion cn = new Conexion();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;

        try {
            con = cn.crearConexion();
            String q = "SELECT * FROM user";

            ps = con.prepareStatement(q);

            rs = ps.executeQuery();

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIddato(rs.getInt("iddato"));
                u.setIdentificacion(rs.getString("identificacion"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setEmail(rs.getString("email"));
                u.setUsuario(rs.getString("usuario"));
                u.setClave(rs.getString("clave"));
                u.setIdperfil(rs.getInt("id_perfil"));

                lista.add(u);
            }

            System.out.print("REGISTROS ENCONTRADO DE FORMA EXITOSA...");
            con.close();

        } catch (SQLException ex) {
            System.out.print("ERROR AL BUSCAR LOS REGISTROS...");
            System.out.print(ex.getMessage());
        }
        return lista;
    }

}
