/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import model.Usuario;
/**
 *
 * @author Usuario
 */
public interface CRUD {
    public int agregarUsuario(Usuario u);
    public int actualizarDatos(Usuario u);
    public int eliminarDatos(int id);
    public Usuario listarDatos_Id(int id);
}
