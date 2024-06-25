<h1 class="bg-gris_oscuro tb-align text-white p-2 col-5">¡SU COMPRA FUE EXITOSA! <i class="fa-solid fa-circle-check"
    style="color: #ffffff;"></i></h1>
<br>
<div class="container">
  <section class="WWList table-responsive">
    <table class="table table-striped table-hover tb-align">
      <thead>
        <tr class="bg-gris_oscuro tb-align text-white p-5">
          <th scope="col">Producto</th>
          <th scope="col">Talla</th>
          <th scope="col">Color</th>
          <th scope="col">Imagen</th>
          <th scope="col">Cantidad</th>
          <th scope="col">Precio Unitario</th>
          <th scope="col">Importe</th>
        </tr>
      </thead>
      <tbody>
        {{foreach detalle}}
        <tr class="bg-white">
          <td>{{nombrezapato}}</td>
          <td>{{descripciontalla}}</td>
          <td>{{color}}</td>
          <td>
            <img src="public\imgs\uploads\{{imagenzapato}}" height="200" width="200" alt="">
          </td>
          <td>$ {{cantidad}}</td>
          <td>$ {{precioUnit}}</td>
          <td>$ {{importe}}</td>
        </tr>
        {{endfor detalle}}
      </tbody>
    </table>
  </section>
</div>

<br><br><br><br>

<div class="row mb-2">
  <div class="col-md-8">
    <table class="table table-sm table-white">
      <thead>
        <tr>
        </tr>
      </thead>
    </table>

  </div>
  <div class="col-md-3">
    <table class="table table-dark">
      <thead>
        <tr class="bg-gris_oscuro text-white p-5">
          <th scope="col">Subtotal:</th>
          <th scope="col">$ {{amount}}</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">ISV:</th>
          <th scope="col">$ {{isv}}</th>
        </tr>
        <tr>
          <th scope="row">Total:</th>
          <th scope="col">$ {{cantidadBruta}}</th>
        </tr>
      </tbody>

    </table>
    <h5 class="bg-gris_oscuro tb-align text-white p-1 col-12">Su pedido llegara en 2-3 días hábiles.</h5>
  </div>
</div>