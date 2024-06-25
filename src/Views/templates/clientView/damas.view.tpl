<div class="container-fluid">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb m-4">
      <li class="breadcrumb-item"><a href="index.php?page=index" class="text-dark">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Damas</li>
    </ol>
  </nav>
  <h1 class="m-4">COMPRAR ESTILOS DE DAMAS</h1>


</div>
<hr>
<div class="container-fluid m-4">
  <i class="fa-solid fa-filter fa-2xl" style="color: #000000;"></i>&nbsp;&nbsp;
  
  &nbsp;&nbsp;&nbsp;&nbsp;
  <div class="row">
    <div class="btn-group py-3 col-sm-12 col-md-2">
    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
      MARCA
    </button>
    <ul class="dropdown-menu">
      {{foreach marcas}}
        <li><a class="dropdown-item" href="index.php?page=clientView-damas&marcacod={{marcacod}}">{{nombremarca}}</a></li>
      {{endfor marcas}}
        <li><a class="dropdown-item" href="index.php?page=clientView-damas">Todas</a></li>
    </ul>
  </div>
   <form action="index.php" method="get" class="d-flex col-sm-12 col-md-8">
      <input type="hidden" name="page" value="clientView-damas"/>
        <input class="form-control me-2" type="text" name="nombre" placeholder="Buscar por nombre de zapato" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Buscar</button>
    </form>
  </div>
 
</div>
<hr>

<div class="m-5 h5"><b>{{cantidad}} PRODUCTOS</b></div>
<div class="row m-4">
  <div class="container my-5 text-center">
    <div class="row gx-5">
      {{foreach damas}}
        <a class="col-lg-4" style="text-decoration: none;" href="index.php?page=clientView_detalle&zapatocod={{zapatocod}}">
          <img src="public\imgs\uploads\{{imagenzapato}}" alt="50$" class="img-fluid">
          <p class="text-start text-dark my-4">COLOR {{color}}</p>
          <div class="row">
            <b class="col-10 text-start text-dark p-0">{{nombrezapato}}</b>
            <p class="col-2 txt-rojo"> ${{precio}}</p>
          </div>
        </a>
      {{endfor damas}}

    </div>
  </div>


</div>