<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ page import= "model.Conexion" %>
<%
    HttpSession sesion_cli = request.getSession(true);
    String nUsuario=(String)sesion_cli.getAttribute("nUsuario");
    Connection con = null;
    Statement sentencia = null;
    ResultSet resultado = null;
    String nombre = null;
    String apellido = null;
    try {
        Conexion cn = new Conexion();
        con = cn.crearConexion();
        sentencia = con.createStatement();
        resultado = sentencia.executeQuery("SELECT nombre, apellido FROM datos WHERE usuario = '"+nUsuario+"'");
        if(resultado.next()){
            nombre = resultado.getString("nombre");
            apellido = resultado.getString("apellido");
        }
    } catch(Exception e){
        e.printStackTrace();
    } finally {
        if(con != null) con.close();
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Inicio</title>
    <style>
        body{
            font-family: Inter, 'Segoe UI', Roboto, Arial, sans-serif;
            background: #1e293b;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            margin: 0;
        }
        .welcome-card{
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(8px);
            padding: 40px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0,0,0,0.4);
        }
        .welcome-card h1{
            font-size: 28px;
            margin-bottom: 12px;
            color: #7c3aed;
        }
        .welcome-card p{
            font-size: 16px;
            color: #cbd5e1;
        }
        .welcome-card .info{
            margin-top: 20px;
            font-size: 14px;
            color: #94a3b8;
        }
    </style>
</head>
<body>
    <div class="welcome-card">
        <h1>¡Bienvenido, <%=nombre%> <%=apellido%>!</h1>
        <p>Este es tu panel principal. Desde aquí puedes acceder a tus actividades disponibles mediante el menú lateral.</p>
        <div class="info">
            Último acceso: <%= new java.util.Date() %><br>
            Usuario: <%= nUsuario %>
        </div>
    </div>
</body>
</html>
