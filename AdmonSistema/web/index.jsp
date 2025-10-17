<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Plataforma Usuarios</title>

    <style>
        *{box-sizing:border-box;margin:0;padding:0}
        html,body{
            height:100%;
            font-family:Inter,'Segoe UI',Roboto,Arial,sans-serif;
            background:linear-gradient(135deg,#0f172a 0%, #0f387a 50%, #0b5a9b 100%);
            color:#0f172a
        }
        .wrap{
            min-height:100vh;
            display:flex;
            align-items:center;
            justify-content:center;
            padding:32px
        }
        .card{
            width:100%;
            max-width:920px;
            background:linear-gradient(180deg,rgba(255,255,255,0.06),rgba(255,255,255,0.03));
            backdrop-filter:blur(8px);
            border-radius:20px;
            padding:28px;
            box-shadow:0 10px 30px rgba(2,6,23,0.6);
            display:grid;
            grid-template-columns:1fr 420px;
            gap:20px;
            border:1px solid rgba(255,255,255,0.06)
        }
        .hero{
            padding:28px 20px;
            display:flex;
            flex-direction:column;
            justify-content:center;
            gap:16px
        }
        .brand{
            display:flex;
            align-items:center;
            gap:12px
        }
        .logo{
            width:56px;
            height:56px;
            border-radius:12px;
            background:linear-gradient(135deg,#7c3aed,#06b6d4);
            display:flex;
            align-items:center;
            justify-content:center;
            color:#fff;
            font-weight:700;
            font-size:18px;
            box-shadow:0 6px 18px rgba(12,12,60,0.35)
        }
        h1{font-size:28px;color:#fff}
        p.lead{color:rgba(255,255,255,0.85);line-height:1.4}
        form{
            padding:18px;
            background:rgba(255,255,255,0.02);
            border-radius:14px;
            border:1px solid rgba(255,255,255,0.03);
            display:flex;
            flex-direction:column;
            gap:12px
        }
        .field{position:relative}
        label{
            position:absolute;
            left:14px;
            top:12px;
            font-size:13px;
            color:rgba(255,255,255,0.6);
            pointer-events:none;
            transition:all .18s ease
        }
        input[type=text], input[type=email], input[type=password], select{
            width:100%;
            padding:16px 14px;
            border-radius:10px;
            border:1px solid rgba(255,255,255,0.06);
            background:transparent;
            color:#fff;
            font-size:15px
        }
        input:focus, select:focus{
            outline:none;
            border-color:rgba(124,58,237,0.95);
            box-shadow:0 6px 18px rgba(99,102,241,0.12)
        }
        input:focus + label, input:not(:placeholder-shown) + label{
            top:-10px;
            left:12px;
            font-size:12px;
            color:#7c3aed;
            background:transparent;
            padding:0 6px
        }
        .two-col{
            display:grid;
            grid-template-columns:1fr 1fr;
            gap:12px
        }
        .btn-row{
            display:flex;
            gap:10px;
            margin-top:6px
        }
        button.btn, a.btn{
            flex:1;
            padding:12px 16px;
            border-radius:12px;
            border:none;
            cursor:pointer;
            font-weight:600;
            text-align:center;
            text-decoration:none;
            transition:all .25s ease;
        }
        .btn.primary{
            background:linear-gradient(90deg,#7c3aed,#06b6d4);
            color:#fff;
            box-shadow:0 8px 20px rgba(7,9,37,0.45)
        }
        .btn.ghost{
            background:transparent;
            border:1px solid rgba(255,255,255,0.06);
            color:#fff
        }
        .btn.secondary{
            background:rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.1);
            color:#fff
        }
        .btn.secondary:hover{
            background:rgba(255,255,255,0.15);
            transform:translateY(-2px)
        }
        .small{font-size:13px;color:rgba(255,255,255,0.7)}
        .muted{color:rgba(255,255,255,0.5)}
        .pw-meter{
            height:8px;
            border-radius:8px;
            background:rgba(255,255,255,0.06);
            overflow:hidden
        }
        .pw-meter > i{
            display:block;
            height:100%;
            width:0%;
            background:linear-gradient(90deg,#fb7185,#f97316);
            transition:width .25s ease
        }
        @media (max-width:920px){
            .card{grid-template-columns:1fr}
            .logo{width:48px;height:48px}
        }
    </style>
</head>
<body>
    <div class="wrap">
        <div class="card">
            <div class="hero">
                <div class="brand">
                    <div class="logo">KS</div>
                    <div>
                        <div class="small muted">Konrad Sistema</div>
                        <h1>Regístrate</h1>
                    </div>
                </div>
                <p class="lead">Crea tu cuenta en segundos. Sistema simple para administrar usuarios — pensado para prácticas y proyectos. Tus datos estarán seguros.</p>

                <div class="btn-row" style="margin-top:20px;">
                    <a href="listaUsuarios.jsp" class="btn secondary">Ver lista de usuarios</a>
                    <a href="editarUsuario.jsp" class="btn secondary">Editar</a>
                </div>
            </div>

            <form id="form1" name="form1" method="post" action="ControladorUsuario" novalidate>
                <div style="display:flex;gap:10px;align-items:center;margin-bottom:6px">
                    <strong style="color:#fff">Registro rápido</strong>
                    <small class="muted" style="margin-left:auto">Privacidad y seguridad</small>
                </div>

                <div class="two-col">
                    <div class="field">
                        <input type="text" name="cidentificacion" id="cidentificacion" placeholder=" " required>
                        <label for="cidentificacion">Identificación *</label>
                    </div>

                    <div class="field">
                        <select name="cidperfil" id="cidperfil" required>
                            <option value="" disabled selected hidden>Selecciona perfil *</option>
                            <option value="1">Administrador</option>
                            <option value="2">Usuario</option>
                            <option value="3">Invitado</option>
                        </select>
                        <label for="cidperfil">Perfil</label>
                    </div>
                </div>

                <div class="two-col">
                    <div class="field">
                        <input type="text" name="cnombre" id="cnombre" placeholder=" " required>
                        <label for="cnombre">Nombre *</label>
                    </div>
                    <div class="field">
                        <input type="text" name="capellido" id="capellido" placeholder=" " required>
                        <label for="capellido">Apellido *</label>
                    </div>
                </div>

                <div class="field">
                    <input type="text" name="ctelefono" id="ctelefono" placeholder=" " required>
                    <label for="ctelefono">Teléfono *</label>
                </div>

                <div class="field">
                    <input type="email" name="cmail" id="cmail" placeholder=" " required>
                    <label for="cmail">Correo electrónico *</label>
                </div>

                <div class="two-col">
                    <div class="field">
                        <input type="text" name="cusuario" id="cusuario" placeholder=" " required>
                        <label for="cusuario">Usuario *</label>
                    </div>
                    <div class="field">
                        <input type="password" name="cclave" id="cclave" placeholder=" " required minlength="6">
                        <label for="cclave">Contraseña *</label>
                    </div>
                </div>

                <div class="pw-meter" aria-hidden="true"><i id="pwbar"></i></div>
                <div class="small muted" style="margin-top:6px">La contraseña debe tener mínimo 6 caracteres.</div>

                <div class="btn-row">
                    <button type="submit" class="btn primary">Crear cuenta</button>
                    <button type="reset" class="btn ghost" onclick="resetForm()">Limpiar</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        const pw = document.getElementById('cclave');
        const bar = document.getElementById('pwbar');
        pw && pw.addEventListener('input', (e)=>{
            const v = e.target.value;
            let score = 0;
            if(v.length >= 6) score++;
            if(/[A-Z]/.test(v)) score++;
            if(/[0-9]/.test(v)) score++;
            if(/[^A-Za-z0-9]/.test(v)) score++;
            const pct = Math.min(100,(score/4)*100);
            bar.style.width = pct+'%';
            if(pct<34) bar.style.background='linear-gradient(90deg,#fb7185,#f97316)';
            else if(pct<67) bar.style.background='linear-gradient(90deg,#f59e0b,#f97316)';
            else bar.style.background='linear-gradient(90deg,#10b981,#06b6d4)';
        });

        document.getElementById('form1').addEventListener('submit', function(e){
            const required = ['cidentificacion','cnombre','capellido','ctelefono','cmail','cusuario','cclave','cidperfil'];
            let ok = true;
            required.forEach(id=>{
                const el = document.getElementById(id);
                if(!el || !el.value.trim()){
                    ok=false;
                    el.classList.add('error');
                }
            });
            if(!ok){
                e.preventDefault();
                alert('Por favor completa todos los campos obligatorios.');
            }
        });

        function resetForm(){
            document.getElementById('form1').reset();
            document.getElementById('pwbar').style.width='0%';
        }
    </script>
</body>
</html>
