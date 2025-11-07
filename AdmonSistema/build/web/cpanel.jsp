<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ page import= "model.Conexion" %>
<%
HttpSession sesion_cli = request.getSession(true);
String nUsuario=(String)sesion_cli.getAttribute("nUsuario");
Connection con=null;
Statement sentencia=null;
ResultSet resultado = null;
String nombre=null;
String apellido=null;
String usu=null;
try {
    Conexion cn = new Conexion();
    con = cn.crearConexion();
    sentencia=con.createStatement();
    resultado=sentencia.executeQuery("SELECT * from datos WHERE usuario ='"+nUsuario+"'");
    if(resultado.next()) {
        nombre=resultado.getString("nombre");
        apellido=resultado.getString("apellido");
        usu=resultado.getString("usuario");
    }
} catch(Exception e) { e.printStackTrace(); } finally { if(con != null) con.close(); }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel - Konrad Sistema</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        *{box-sizing:border-box;margin:0;padding:0}
        html, body{height:100%;font-family:Inter,'Segoe UI',Roboto,Arial,sans-serif;background:#0f172a;color:#fff;}

        a{text-decoration:none;color:inherit;}

        /* Cabecera */
        #header{
            width:100%;
            height:60px;
            background:linear-gradient(90deg,#7c3aed,#06b6d4);
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:0 24px;
            box-shadow:0 4px 16px rgba(0,0,0,0.35);
            border-bottom:1px solid rgba(255,255,255,0.1);
            font-weight:500;
        }

        #header a{
            color:#fff;
            font-weight:600;
            transition:.2s;
        }

        #header a:hover{opacity:.8;transform:translateY(-2px);}

        /* Contenedor principal */
        #container{
            display:flex;
            height:calc(100vh - 60px);
        }

        /* Sidebar */
        #sidebar{
            width:260px;
            background:rgba(255,255,255,0.05);
            backdrop-filter:blur(8px);
            padding:20px;
            border-right:1px solid rgba(255,255,255,0.08);
            display:flex;
            flex-direction:column;
        }

        #sidebar h3{
            font-size:18px;
            color:#fff;
            margin-bottom:16px;
            text-shadow:0 2px 4px rgba(0,0,0,0.5);
        }

        #sidebar a{
            display:block;
            padding:10px 14px;
            margin-bottom:8px;
            border-radius:12px;
            background:rgba(255,255,255,0.02);
            transition:.2s;
            font-size:14px;
        }

        #sidebar a:hover{
            background:linear-gradient(90deg,#7c3aed,#06b6d4);
            color:#fff;
            box-shadow:0 6px 18px rgba(124,58,237,0.35);
        }

        /* Área principal */
        #main{
            flex:1;
            background:rgba(255,255,255,0.02);
            backdrop-filter:blur(6px);
            padding:16px;
        }

        iframe{
            width:100%;
            height:100%;
            border:none;
            border-radius:12px;
            box-shadow:0 8px 20px rgba(0,0,0,0.35);
        }
    </style>
</head>
<body>
    <!-- Cabecera -->
    <div id="header">
        <div>Bienvenido, <%=nombre%> <%=apellido%></div>
        <div><a href="cerrarSesion">Cerrar sesión</a></div>
    </div>

    <!-- Contenedor principal -->
    <div id="container">
        <!-- Sidebar -->
        <div id="sidebar">
            <h3>Menú</h3>
            <%
            if(usu.equals(nUsuario)){
                Conexion cn1 = new Conexion();
                con = cn1.crearConexion();
                sentencia=con.createStatement();
                resultado=sentencia.executeQuery(
                    "SELECT actividades.nom_actividad AS actividad, actividades.id_actividad AS idAct, actividades.enlace AS enlace " +
                    "FROM datos, actividades, gestactividad, perfiles    " +
                    "WHERE gestactividad.id_actividad = actividades.id_actividad " +
                    "AND gestactividad.id_perfil = perfiles.id_perfil " +
                    "AND datos.id_perfil = perfiles.id_perfil " +
                    "AND datos.usuario ='"+nUsuario+"'"
                );
                while(resultado.next()){
            %>
                    <a href="<%=resultado.getString("enlace")%>?id=<%=resultado.getInt("idAct")%>" target="marco">
                        <%=resultado.getString("actividad")%>
                    </a>
            <%      
                }
            }
            %>
        </div>

        <!-- Área principal -->
        <div id="main">
            <iframe name="marco" src="front.jsp"></iframe>
        </div>
    </div>
</body>
</html>
