<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Usuarios</title>
    <style>
        *{box-sizing:border-box;margin:0;padding:0}
        html,body{
            height:100%;
            font-family:Inter,'Segoe UI',Roboto,Arial,sans-serif;
            background:linear-gradient(135deg,#0f172a 0%, #0f387a 50%, #0b5a9b 100%);
            color:#fff;
        }
        .wrap{
            min-height:100vh;
            display:flex;
            align-items:center;
            justify-content:center;
            padding:32px;
        }
        .card{
            width:100%;
            max-width:1080px;
            background:linear-gradient(180deg,rgba(255,255,255,0.06),rgba(255,255,255,0.03));
            backdrop-filter:blur(8px);
            border-radius:20px;
            padding:28px;
            box-shadow:0 10px 30px rgba(2,6,23,0.6);
            border:1px solid rgba(255,255,255,0.06);
        }
        h1{
            font-size:28px;
            color:#fff;
            margin-bottom:20px;
            text-align:center;
        }
        table{
            width:100%;
            border-collapse:collapse;
            margin-top:10px;
            border-radius:10px;
            overflow:hidden;
            background:rgba(255,255,255,0.02);
        }
        th,td{
            padding:12px 16px;
            text-align:left;
            font-size:15px;
            border-bottom:1px solid rgba(255,255,255,0.06);
        }
        th{
            background:rgba(255,255,255,0.05);
            color:#7dd3fc;
            text-transform:uppercase;
            font-size:14px;
            letter-spacing:0.5px;
        }
        tr:hover{
            background:rgba(255,255,255,0.05);
        }
        a.action{
            color:#06b6d4;
            text-decoration:none;
            font-weight:600;
            margin-right:10px;
            transition:color .2s ease;
        }
        a.action:hover{
            color:#7c3aed;
        }
        .btn-row{
            display:flex;
            justify-content:flex-end;
            margin-bottom:14px;
        }
        .btn{
            background:linear-gradient(90deg,#7c3aed,#06b6d4);
            color:#fff;
            border:none;
            border-radius:12px;
            padding:10px 18px;
            font-weight:600;
            text-decoration:none;
            box-shadow:0 8px 20px rgba(7,9,37,0.45);
            transition:transform .2s ease,box-shadow .2s ease;
        }
        .btn:hover{
            transform:translateY(-2px);
            box-shadow:0 10px 25px rgba(7,9,37,0.6);
        }
        @media(max-width:768px){
            table{font-size:13px;}
            th,td{padding:8px;}
        }
    </style>
</head>
<body>
<div class="wrap">
    <div class="card">
        <h1>Listado de Usuarios</h1>
        <div class="btn-row">
            <a href="regUusario.jsp" class="btn">Registrar nuevo usuario</a>
        </div>
        <table>
            <tr>
                <th>Identificación</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>E-mail</th>
                <th>Usuario</th>
                <th>Contraseña</th>
                <th>Perfil</th>
                <th>Acción</th>
            </tr>
            <%
                UsuarioDAO udao = new UsuarioDAO();
                List<Usuario> lista = udao.listadoUsuarios();
                for (Usuario a : lista) {
            %>
            <tr>
                <td><%=a.getIdentificacion()%></td>
                <td><%=a.getNombre()%></td>
                <td><%=a.getApellido()%></td>
                <td><%=a.getEmail()%></td>
                <td><%=a.getUsuario()%></td>
                <td><%=a.getClave()%></td>
                <td><%=a.getIdperfil()%></td>
                <td>
                    <a href="editarUsuario.jsp?id=<%=a.getIddato()%>" class="action">Editar</a>
                    <a href="EliminarUsuario?cidd=<%= a.getIddato() %>" class="action">Eliminar</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>
</body>
</html>
