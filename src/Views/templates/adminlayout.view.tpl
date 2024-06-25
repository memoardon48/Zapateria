<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <title>{{SITE_TITLE}}</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/appstyle.css" />
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/backgrounds.css" />
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/crearCuenta.css" />
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/inicio.css" />
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/login.css" />
  <script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
  {{foreach SiteLinks}}
  <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>

<body>

  <nav class="navbar navbar-expand-lg bg-body-tertiary p-1" data-bs-theme="dark"
    style="background-color: var(--negro)!important;">
    <div class="container-fluid bg-negro">
      <a class="navbar-brand tb-align txt-blanco" href="#">
        <img src="public\imgs\logo.png" alt="Logo" width="70" height="70" class="d-inline-block align-text-middle">
        ShoesNW
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          
          <li class="nav-item menuAdmin">
            <a class="nav-link active" style="color:var(--blanco)" aria-current="page"
              href="index.php?page=admin_admin">Inicio</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Mantenimiento Seguridad
            </a>
            <ul class="dropdown-menu">
              {{foreach NAVIGATION2}}
              <li><a class="dropdown-item text-white menuAdmin2" href="{{nav_url}}">{{nav_label}}</a></li>
              {{endfor NAVIGATION2}}
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Mantenimiento Productos
            </a>
            <ul class="dropdown-menu">
              {{foreach NAVIGATION3}}
              <li><a class="dropdown-item text-white menuAdmin2" href="{{nav_url}}">{{nav_label}}</a></li>
              {{endfor NAVIGATION3}}
            </ul>
          </li>
          {{foreach NAVIGATION}}
          <li class="nav-item menuAdmin">
            <a class="nav-link active" style="color:var(--blanco)" aria-current="page"
              href="{{nav_url}}">{{nav_label}}</a>
          </li>
          {{endfor NAVIGATION}}
          
        </ul>
        <ul class="navbar-nav mx-3">          
          
          <li class="nav-item mx-4 menuAdmin2 p-1">
            <a class="nav-link active" style="color:var(--blanco)" href="index.php?page=sec_logout"><i class="fa-solid fa-right-from-bracket" style="color: #ffffff;"></i></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>


  <main>
    {{{page_content}}}
  </main>
  <footer class="bg-gris_oscuro text-white">
    <div>ShoesNW, Todos los Derechos Reservados 2022 &copy;</div>
  </footer>
  {{foreach EndScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
    crossorigin="anonymous"></script>

</body>

</html>