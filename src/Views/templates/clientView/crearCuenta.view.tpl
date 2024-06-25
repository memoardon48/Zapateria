<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOESNW | Crear Cuenta</title>
    <link rel="stylesheet" href="../css/crearCuenta.css">
    <!--
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" 
        rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" 
        crossorigin="anonymous">
    -->
</head>
<body>

  <form class="formulario" action="/action_page.php">
    <h1>Crear Cuenta</h1>
    <p>Por favor introduzca sus datos para crear una cuenta</p>
    <hr>
  
    <div class="contenedor">

      <label><b>Nombre</b></label>
      <br>
      <input class="nombre" type="text" placeholder="Nombre" name="nombre" required>
      <br>

      <label><b>Apellido</b></label>
      <br>
      <input class="apellido" type="text" placeholder="Apellido" name="apellido" required>
      <br>
      
      <label><b>Correo</b></label>
      <br>
      <input class="correo" type="text" placeholder="Correo" name="email" required>
      <br>
  
      <label><b>Contraseña</b></label>
      <br>
      <input class="contrasena" type="password" placeholder="Contraseña" name="psw" required>
      <br>
      <hr>
      <p>Creado por PowerCods ©.<a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
  
      <div class="botones">
        <button type="submit" class="signupbtn">Crear Cuenta</button>
      </div>
    </div>
  </form>
</body>


<!--
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" 
    crossorigin="anonymous">
</script>
-->


</html>