<h1>Detalles De La Transacción</h1>
<section class="WWFilter">

</section>
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
      {{foreach detalles}}
        <tr class="bg-white">

          <td>{{nombrezapato}}</td>
          <td>{{descripciontalla}}</td>
          <td>{{color}}</td>
          <td>
            <img src="public\imgs\uploads\{{imagenzapato}}" height="200" width="200" alt="">
          </td>
          <td> {{cantidad}}</td>
          <td>$ {{precioUnit}}</td>
          <td>$ {{importe}}</td>
      </tr>
      {{endfor detalles}}
    </tbody>
  </table>
</section>


