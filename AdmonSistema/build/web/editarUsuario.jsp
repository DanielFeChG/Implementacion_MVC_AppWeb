<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuario - Plataforma Usuarios</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        html, body {
            height: 100%;
            font-family: Inter, 'Segoe UI', Roboto, Arial, sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #0f387a 50%, #0b5a9b 100%);
            color: #0f172a;
        }
        .wrap {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 32px;
        }
        .card {
            width: 100%;
            max-width: 920px;
            background: linear-gradient(180deg, rgba(255, 255, 255, 0.06), rgba(255, 255, 255, 0.03));
            backdrop-filter: blur(8px);
            border-radius: 20px;
            padding: 28px;
            box-shadow: 0 10px 30px rgba(2, 6, 23, 0.6);
            display: grid;
            grid-template-columns: 1fr 420px;
            gap: 20px;
            border: 1px solid rgba(255, 255, 255, 0.06);
        }
        .hero {
            padding: 28px 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 16px;
        }
        .brand { display: flex; align-items: center; gap: 12px; }
        .logo {
            width: 56px;
            height: 56px;
            border-radius: 12px;
            background: linear-gradient(135deg, #7c3aed, #06b6d4);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-weight: 700;
            font-size: 18px;
            box-shadow: 0 6px 18px rgba(12, 12, 60, 0.35);
        }
        h1 { font-size: 28px; color: #fff; }
        p.lead {
            color: rgba(255, 255, 255, 0.85);
            line-height: 1.4;
        }
        form {
            padding: 18px;
            background: rgba(255, 255, 255, 0.02);
            border-radius: 14px;
            border: 1px solid rgba(255, 255, 255, 0.03);
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        .field { position: relative; }
        label {
            position: absolute;
            left: 14px;
            top: 0%;
            font-size: 10px;
            color: rgba(255, 255, 255, 0.6);
            pointer-events: none;
            transition: all 0.18s ease;
        }
        input[type=text], input[type=email], input[type=password], input[type=tel], select {
            width: 100%;
            padding: 16px 14px;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.06);
            background: transparent;
            color: #fff;
            font-size: 15px;
        }
        input:focus, select:focus {
            outline: none;
            border-color: rgba(124, 58, 237, 0.95);
            box-shadow: 0 6px 18px rgba(99, 102, 241, 0.12);
        }
        input:focus + label, input.filled + label {
            top: -10px;
            left: 12px;
            font-size: 12px;
            color: #7c3aed;
            background: transparent;
            padding: 0 6px;
        }
        .two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
        .btn-row { display: flex; gap: 10px; margin-top: 6px; justify-content: flex-end; }
        button.btn, a.btn {
            flex: 1;
            padding: 12px 16px;
            border-radius: 12px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            transition: all 0.25s ease;
        }
        .btn.primary {
            background: linear-gradient(90deg, #7c3aed, #06b6d4);
            color: #fff;
            box-shadow: 0 8px 20px rgba(7, 9, 37, 0.45);
        }
        .btn.ghost {
            background: transparent;
            border: 1px solid rgba(255, 255, 255, 0.06);
            color: #fff;
        }
        .btn.secondary {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #fff;
        }
        .btn.secondary:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
        }
        @media (max-width: 920px) {
            .card { grid-template-columns: 1fr; }
            .logo { width: 48px; height: 48px; }
        }
    </style>
</head>
<body>
    <%
            UsuarioDAO udao = new UsuarioDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario a = udao.listarUsuarios_Id(id);
    %>
    <div class="wrap">
        <div class="card">
            <div class="hero">
                <div class="brand">
                    <div class="logo">KS</div>
                    <div>
                        <div class="small muted">Konrad Sistema</div>
                        <h1>Editar Usuario</h1>
                    </div>
                </div>
                <p class="lead">Modifica los datos del usuario seleccionado.</p>
            </div>

            <form id="form1" name="form1" method="post" action="EditarUsuario">
                <div class="two-col">
                    <div class="field">
                        <input type="hidden" name="cidd" value="<%=id%>"/>
                        <input type="text" name="cidentificacion" id="cidentificacion" value="<%=a.getIdentificacion()%>" required/>
                        <label for="cidentificacion">Identificación *</label>
                    </div>
                    <div class="field">
                        <input type="text" name="cnombre" id="cnombre" value="<%=a.getNombre()%>" required/>
                        <label for="cnombre">Nombre *</label>
                    </div>
                </div>

                <div class="two-col">
                    <div class="field">
                        <input type="text" name="capellido" id="capellido" value="<%=a.getApellido()%>" required/>
                        <label for="capellido">Apellido *</label>
                    </div>
                    <div class="field">
                        <input type="email" name="cmail" id="cmail" value="<%=a.getEmail()%>" required/>
                        <label for="cmail">Correo electrónico *</label>
                    </div>
                </div>

                <div class="two-col">
                    <div class="field">
                        <input type="text" name="ctelefono" id="ctelefono" value="<%=a.getTelefono()%>" required/>
                        <label for="ctelefono">Teléfono *</label>
                    </div>
                    <div class="field">
                        <input type="text" name="cusuario" id="cusuario" value="<%=a.getUsuario()%>" required/>
                        <label for="cusuario">Usuario *</label>
                    </div>
                </div>

                <div class="two-col">
                    <div class="field">
                        <input type="password" name="cclave" id="cclave" value="<%=a.getClave()%>" required/>
                        <label for="cclave">Contraseña *</label>
                    </div>
                    <div class="field">
                        <input type="text" name="cidperfil" id="cidperfil" value="<%=a.getIdperfil()%>" required/>
                        <label for="cidperfil">Perfil *</label>
                    </div>
                </div>

                <div class="btn-row">
                    <button type="submit" class="btn primary">Actualizar Usuario</button>
                    <a href="listaUsuarios.jsp" class="btn secondary">Cancelar</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
