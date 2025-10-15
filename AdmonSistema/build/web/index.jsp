<%-- 
    Document   : index
    Created on : 27/09/2025, 9:44:05 a. m.
    Author     : Usuario
--%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuario</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            form {
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                width: 350px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            label {
                display: block;
                margin-top: 10px;
                color: #555;
            }
            input, select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="submit"] {
                margin-top: 15px;
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <form id="form1" name="form1" method="post" action="ControladorUsuario">
            <h1>Registro de Usuario</h1>

            <label for="cidentificacion">Identificación:</label>
            <input type="text" id="cidentificacion" name="cidentificacion" required>

            <label for="cnombre">Nombre:</label>
            <input type="text" id="cnombre" name="cnombre" required>

            <label for="capellido">Apellido:</label>
            <input type="text" id="capellido" name="capellido" required>

            <label for="cmail">Email:</label>
            <input type="email" id="cmail" name="cmail" required>

            <label for="cusuario">Usuario:</label>
            <input type="text" id="cusuario" name="cusuario" required>

            <label for="cclave">Clave:</label>
            <input type="password" id="cclave" name="cclave" required>

            <label for="cidperfil">Perfil:</label>
            <select id="cidperfil" name="cidperfil" required>
                <option value="">Seleccione un perfil</option>
                <option value="1">Administrador</option>
                <option value="2">Usuario</option>
                <option value="3">Invitado</option>
            </select>

            <input type="submit" value="Registrar">
        </form>
    </body>
</html>
