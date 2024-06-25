<h1>Gestión de Pedidos</h1>
<section class="WWFilter">
  <br><br>
  <section class="container">
    <div class="row">
      <div class="col-sm-12 col-md-4 p-4 bg-dark text-white">
        PEDIDOS TOTALES
      </div>
      <div class="col-sm-12 col-md-4 p-4 bg-gris_claro2 text-dark">
        <b>{{numTotal}}</b>
      </div>
    </div>
  </section>
  <br>
  <section class="container">
    <div class="row">
      <div class="col-sm-12 col-md-4 p-4 bg-dark text-white">
        PEDIDOS ENTREGADOS
      </div>
      <div class="col-sm-12 col-md-4 p-4 bg-gris_claro2 text-dark ">
        <b>{{numEntregados}}</b>
      </div>
    </div>
  </section>
  <section class="container">
    <div class="row">
      <div class="col-sm-12 col-md-4 p-4 bg-dark text-white">
        PEDIDOS PENDIENTES
      </div>
      <div class="col-sm-12 col-md-4 p-4 bg-gris_claro2 text-dark ">
        <b>{{numPend}}</b>
      </div>
    </div>
  </section>
  <br><br>
</section>
<section class="WWList table-responsive">
  <table class="table table-striped table-hover tb-align">
    <thead>
      <tr class="bg-gris_oscuro tb-align text-white p-5">
        <th scope="col">Código Pedido</th>
        <th scope="col">Código venta</th>
        <th scope="col">Dirección</th>
        <th scope="col">Ciudad</th>
        <th scope="col">Estado</th>
        <th scope="col">País</th>
        <th scope="col">Teléfono Contacto</th>
        <th scope="col">Estado</th>
        <th></th>
      </tr>
    </thead>


    <tbody>
      {{foreach pedidos}}
      <tr class="bg-white">
        <td>
          {{pedidocod}}
        </td>
        <td>
          {{ventacod}}
        </td>
        <td>{{direccion}}</td>

        <td>{{ciudad}}</td>

        <td>{{estado}}</td>

        <td>{{pais}}</td>

        <td>{{telefonoCont}}</td>
        <td>{{pedidoest}}</td>
        {{if ~pedido_change}}
        <td>
          <form action="index.php?page=mnt_pedidos" method="post">

            <input type="hidden" name="pedidocod" value={{pedidocod}} />
            <button type="submit" class="bg-cafe text-white">Cambiar Estado</button>
          </form>
        </td>
        {{endif ~pedido_change}}

      </tr>
      {{endfor pedidos}}
    </tbody>
  </table>
</section>
<br><br><br><br><br><br>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("btnAdd").addEventListener("click", function (e) {
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=mnt_pedido&mode=INS&pedidocod=0");
    });
  });
</script>