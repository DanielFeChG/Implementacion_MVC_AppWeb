<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuario</title>
    <style>
        *{box-sizing:border-box;margin:0;padding:0}
        body{font-family:Inter, 'Segoe UI', sans-serif;background:linear-gradient(135deg,#0f172a 0%,#0b5a9b 100%);color:#fff;display:flex;align-items:center;justify-content:center;height:100vh;padding:20px}
        .card{width:100%;max-width:600px;background:rgba(255,255,255,0.05);border-radius:16px;padding:28px;box-shadow:0 10px 30px rgba(0,0,0,0.4)}
        h1{text-align:center;margin-bottom:20px;color:#fff}
        form{display:flex;flex-direction:column;gap:14px}
        .field{position:relative}
        label{display:block;margin-bottom:4px;font-size:14px;color:rgba(255,255,255,0.7)}
        input,select{width:100%;padding:12px 14px;border-radius:8px;border:1px solid rgba(255,255,255,0.15);background:rgba(255,255,255,0.05);color:#fff;font-size:15px}
        input:focus,select:focus{outline:none;border-color:#7c3aed;box-shadow:0 0 8px rgba(124,58,237,0.6)}
        .btn-row{display:flex;gap:10px;margin-top:10px}
        button{flex:1;padding:12px;border:none;border-radius:10px;cursor:pointer;font-weight:600;font-size:15px}
        .primary{background:linear-gradient(90deg,#7c3aed,#06b6d4);color:#fff}
        .ghost{background:transparent;border:1px solid rgba(255,255,255,0.25);color:#fff}
    </style>
</head>
<body>
    <div class="card">
        <h1>Editar Usuario</h1>
        <form action="ControladorUsuario" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="iddato" value="${usuario.iddato}">

            <div class="field">
                <label for="identificacion">Identificación *</label>
                <input type="text" id="identificacion" name="identificacion" value="${usuario.identificacion}" readonly>
            </div>

            <div class="field">
                <label for="nombre">Nombre *</label>
                <input type="text" id="nombre" name="nombre" value="${usuario.nombre}" required>
            </div>

            <div class="field">
                <label for="apellido">Apellido *</label>
                <input type="text" id="apellido" name="apellido" value="${usuario.apellido}" required>
            </div>

            <div class="field">
                <label for="telefono">Teléfono *</label>
                <input type="text" id="telefono" name="telefono" value="${usuario.telefono}" required>
            </div>

            <div class="field">
                <label for="email">Correo electrónico *</label>
                <input type="email" id="email" name="email" value="${usuario.email}" required>
            </div>

            <div class="field">
                <label for="usuario">Usuario *</label>
                <input type="text" id="usuario" name="usuario" value="${usuario.usuario}" required>
            </div>

            <div class="field">
                <label for="clave">Contraseña *</label>
                <input type="password" id="clave" name="clave" value="${usuario.clave}" required>
            </div>

            <div class="field">
                <label for="idperfil">Perfil *</label>
                <select id="idperfil" name="idperfil" required>
                    <option value="" disabled>Selecciona perfil *</option>
                    <option value="1" ${usuario.idperfil==1?"selected":''}>Administrador</option>
                    <option value="2" ${usuario.idperfil==2?"selected":''}>Usuario</option>
                    <option value="3" ${usuario.idperfil==3?"selected":''}>Invitado</option>
                </select>
            </div>

            <div class="btn-row">
                <button type="submit" class="primary">Actualizar</button>
                <button type="button" class="ghost" onclick="window.location.href='listarUsuarios.jsp'">Cancelar</button>
            </div>
        </form>
    </div>
</body>
</html>
