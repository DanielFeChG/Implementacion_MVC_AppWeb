<%-- 
    Document   : mensaje
    Created on : 27/09/2025
    Author     : Usuario
    Descripción: Página de confirmación de registro con estilo y acciones
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Exitoso</title>

    <style>
        *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body{
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter','Segoe UI',Roboto,Arial,sans-serif;
            background: linear-gradient(135deg,#0f172a 0%, #0f387a 50%, #0b5a9b 100%);
            color: #fff;
        }
        .card{
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 20px;
            padding: 40px 50px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(2,6,23,0.6);
            width: 90%;
            max-width: 480px;
        }
        h1{
            font-size: 26px;
            margin-bottom: 14px;
            color: #10b981;
        }
        p{
            color: rgba(255,255,255,0.85);
            margin-bottom: 28px;
            font-size: 15px;
        }
        .btn-group{
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .btn{
            display: block;
            padding: 12px 18px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.25s ease;
            font-size: 15px;
            text-decoration: none;
            text-align: center;
        }
        .btn.primary{
            background: linear-gradient(90deg,#7c3aed,#06b6d4);
            color: #fff;
        }
        .btn.primary:hover{
            box-shadow: 0 0 12px rgba(124,58,237,0.6);
            transform: translateY(-2px);
        }
        .btn.secondary{
            background: rgba(255,255,255,0.08);
            color: #fff;
            border: 1px solid rgba(255,255,255,0.1);
        }
        .btn.secondary:hover{
            background: rgba(255,255,255,0.15);
        }
        .logo{
            width: 64px;
            height: 64px;
            margin: 0 auto 18px;
            border-radius: 14px;
            background: linear-gradient(135deg,#7c3aed,#06b6d4);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 22px;
            box-shadow: 0 6px 18px rgba(12,12,60,0.4);
        }
        .small{
            font-size: 13px;
            margin-top: 24px;
            color: rgba(255,255,255,0.5);
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="logo">KS</div>
        <h1>¡Registro Exitoso!</h1>
        <p>La información del usuario fue registrada correctamente en el sistema.</p>

        <div class="btn-group">
            <a href="index.jsp" class="btn primary">Volver al Inicio</a>
            <a href="editarUsuario.jsp" class="btn secondary">Editar Usuario</a>
            <a href="listaUsuarios.jsp" class="btn secondary">Ver Lista de Usuarios</a>
        </div>

        <div class="small">Konrad Sistema © 2025 — Proyecto académico</div>
    </div>
</body>
</html>
