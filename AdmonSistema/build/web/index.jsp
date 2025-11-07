<%-- 
    Document   : login
    Created on : 6/11/2025, 10:32:31 p. m.
    Author     : Universidad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - Konrad Sistema</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
            max-width:420px;
            background:linear-gradient(180deg,rgba(255,255,255,0.06),rgba(255,255,255,0.03));
            backdrop-filter:blur(8px);
            border-radius:20px;
            padding:32px;
            box-shadow:0 10px 30px rgba(2,6,23,0.6);
            border:1px solid rgba(255,255,255,0.06);
        }

        .brand{
            display:flex;
            align-items:center;
            gap:12px;
            margin-bottom:18px;
        }

        .logo{
            width:56px;height:56px;border-radius:12px;
            background:linear-gradient(135deg,#7c3aed,#06b6d4);
            display:flex;align-items:center;justify-content:center;
            color:#fff;font-weight:700;font-size:18px;
            box-shadow:0 6px 18px rgba(12,12,60,0.35)
        }

        h1{font-size:26px;color:#fff;margin-bottom:6px;}
        p.lead{color:rgba(255,255,255,0.8);font-size:14px;margin-bottom:20px;}

        form{
            display:flex;
            flex-direction:column;
            gap:14px;
        }

        .field{position:relative}

        label{
            position:absolute;left:14px;top:12px;
            font-size:13px;color:rgba(255,255,255,0.6);
            pointer-events:none;transition:all .18s ease
        }

        input[type=text],input[type=password]{
            width:100%;
            padding:16px 14px;
            border-radius:10px;
            border:1px solid rgba(255,255,255,0.06);
            background:transparent;color:#fff;
            font-size:15px;
        }

        input:focus{
            outline:none;border-color:#7c3aed;
            box-shadow:0 6px 18px rgba(124,58,237,0.25)
        }

        input:focus + label,
        input.filled + label{
            top:-10px;left:12px;font-size:12px;
            color:#7c3aed;background:transparent;padding:0 6px;
        }

        .btn{
            padding:12px 16px;
            border-radius:12px;
            border:none;
            cursor:pointer;
            font-weight:600;
            background:linear-gradient(90deg,#7c3aed,#06b6d4);
            color:#fff;
            margin-top:8px;
            box-shadow:0 8px 20px rgba(7,9,37,0.45);
            transition:.2s ease;
        }

        .btn:hover{transform:translateY(-2px);}

        .small{
            margin-top:10px;
            font-size:13px;
            color:rgba(255,255,255,0.55);
            text-align:center;
        }
    </style>
</head>

<body>
    <div class="wrap">
        <div class="card">

            <div class="brand">
                <div class="logo">KS</div>
                <div>
                    <h1>Iniciar Sesión</h1>
                    <p class="lead">Accede a tu panel administrativo</p>
                </div>
            </div>

            <form id="form1" name="form1" method="post" action="controladorValidar">
                
                <div class="field">
                    <input type="text" name="cusuario" id="cusuario" placeholder=" " required>
                    <label for="cusuario">Usuario</label>
                </div>

                <div class="field">
                    <input type="password" name="cclave" id="cclave" placeholder=" " required>
                    <label for="cclave">Contraseña</label>
                </div>

                <button name="accion" value="Ingresar" type="submit" class="btn">
                    Ingresar
                </button>
            </form>

            <div class="small">Konrad Sistema • Proyecto académico</div>
        </div>
    </div>

<script>
document.querySelectorAll('input').forEach(inp=>{
    inp.addEventListener('input',()=>{
        if(inp.value.trim().length > 0){
            inp.classList.add('filled');
        }else{
            inp.classList.remove('filled');
        }
    });
});
</script>

</body>
</html>
