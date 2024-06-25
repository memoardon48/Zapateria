<div class="container-fluid">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb m-4">
      <li class="breadcrumb-item"><a href="#" class="text-dark">Admin</a></li>
      <li class="breadcrumb-item active" aria-current="page">Manteninimiento Seguridad</li>
    </ol>
  </nav>

  
  <h1 class="m-4">MANTENIMIENTO SEGURIDAD</h1>
  
  <div class="container-fluid">
    <div class="row gy-4 gx-4">
        {{if ~menu_usuarios}}
        <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
          <i class="fa-regular fa-user fa-2xl" style="color: #000000;"></i> <br><br>
          <a href="index.php?page=mnt_usuarios" class="text-decoration-none text-dark">USUARIOS</a>
        </button>
        {{endif ~menu_usuarios}}

        {{if ~menu_roles}}
        <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
          <i class="fa-solid fa-table-list fa-2xl" style="color: #000000;"></i><br><br>
          <a href="index.php?page=mnt_roles"  class="text-decoration-none text-dark">ROLES</a>
        </button>
        {{endif ~menu_roles}}

        {{if ~menu_funciones}}
        <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
          <i class="fa-solid fa-list-check fa-2xl" style="color: #000000;"></i><br><br>
          <a href="index.php?page=mnt_funciones"  class="text-decoration-none text-dark">FUNCIONES</a>
        </button>
        {{endif ~menu_funciones}}

        {{if ~menu_rolesUsuarios}}
        <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
          <i class="fa-solid fa-users-gear fa-2xl" style="color: #000000;"></i><br><br>
          <a href="index.php?page=mnt_rolesUsuarios"  class="text-decoration-none text-dark">ROLES PARA USUARIOS</a>
        </button>
        {{endif ~menu_rolesUsuarios}}

        {{if ~menu_funcionesRoles}}
        <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
          <i class="fa-solid fa-shield-halved fa-2xl" style="color: #000000;"></i><br><br>
          <a href="index.php?page=mnt_funcionesroles"  class="text-decoration-none text-dark">FUNCIONES PARA ROLES</a>
        </button>
        {{endif ~menu_funcionesRoles}}
    </div>
  </div>

  
  
</div>

<div class="container-fluid">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb m-4">
      <li class="breadcrumb-item"><a href="#" class="text-dark">Admin</a></li>
      <li class="breadcrumb-item active" aria-current="page">Mantenimiento Productos</li>
    </ol>
  </nav>
  <h1 class="m-4">MANTENIMIENTO PRODUCTOS</h1>

  <div class="container-fluid">
    <div class="row gy-4 gx-4">

      {{if ~menu_zapatos}}
      <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
        <i class="fa-solid fa-shoe-prints fa-2xl" style="color: #000000;"></i><br><br>
        <a href="index.php?page=mnt_zapatos" class="text-decoration-none text-dark">ZAPATOS</a>
      </button>
      {{endif ~menu_zapatos}}

      {{if ~menu_marcas}}
      <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
        <i class="fa-solid fa-tag fa-2xl" style="color: #000000;"></i><br><br>
        <a href="index.php?page=mnt_marcas"  class="text-decoration-none text-dark">MARCAS</a>
      </button>
      {{endif ~menu_marcas}}

      {{if ~menu_tallas}}
      <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
        <i class="fa-solid fa-arrow-up-9-1 fa-2xl" style="color: #000000;"></i><br><br>
        <a href="index.php?page=mnt_tallas"  class="text-decoration-none text-dark">TALLAS</a>
      </button>
      {{endif ~menu_tallas}}

      {{if ~menu_depart}}
      <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
        <i class="fa-solid fa-person fa-2xl" style="color: #000000;"></i><br><br>
        <a href="index.php?page=mnt_departamentos"  class="text-decoration-none text-dark">DEPARTAMENTOS</a>
      </button>
      {{endif ~menu_depart}}
    </div>
  </div>
</div>

<div class="container-fluid">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb m-4">
      <li class="breadcrumb-item"><a href="#" class="text-dark">Admin</a></li>
      <li class="breadcrumb-item active" aria-current="page">Historial Transacciones</li>
    </ol>
  </nav>
  <h1 class="m-4">HISTORIAL TRANSACCIONES</h1>
   <div class="container-fluid">
    <div class="row gy-4 gx-4">

      {{if ~menu_ventas}}
      <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
        <i class="fa-solid fa-book fa-2xl" style="color: #000000;"></i><br><br>
        <a href="index.php?page=mnt_ventas" class="text-decoration-none text-dark">HISTORIAL TRANSACCIONES</a>
      </button>
      {{endif ~menu_ventas}}

      {{if ~menu_pedidos}}
      <button type="button" class="btn btn-outline-secondary p-5 col-md-3 offset-sm-1">
        <i class="fa-solid fa-truck fa-2xl" style="color: #000000;"></i><br><br>
        <a href="index.php?page=mnt_pedidos"  class="text-decoration-none text-dark">PEDIDOS</a>
      </button>
      {{endif ~menu_pedidos}}
    </div>
  </div>  
</div>
