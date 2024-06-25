<h1>Gestión de Tallas Zapatos</h1>
<section class="WWFilter">

</section>
<section class="WWList table-responsive">
  <table class="table table-striped table-hover tb-align">
    <thead>
      <tr class="bg-gris_oscuro tb-align text-white p-5">
        <th scope="col">Código</th>
        <th scope="col">Código Talla</th>
        <th scope="col">Codigo Zapato</th>
        <th scope="col">Stock</th>
        
        <th>
          {{if tallas_zapatos_new}}
          <button class="bg-dark rounded" id="btnAdd"><i class="fa-solid fa-plus" style="color: #ffffff;"></i></button>
          {{endif tallas_zapatos_new}}
        </th>
      </tr>
    </thead>

    
    <tbody>
      {{foreach tallas_zapatos}}
      <tr class="bg-white">
         {{if tallas_zapatos_view}}
        <td><a href="index.php?page=mnt_talla_zapato&mode=DSP&talla_zapatocod={{talla_zapatocod}}">{{talla_zapatocod}}</a></td>
         {{endif tallas_zapatos_view}}
        <td><b>{{tallacod}}</b></td>
        <td>{{zapatocod}}</td>
        <td>{{stock}}</td>

        <td>
          {{if ~tallas_zapatos_edit}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_talla_zapato"/>
              <input type="hidden" name="mode" value="UPD" />
              <input type="hidden" name="talla_zapatocod" value={{talla_zapatocod}} />
              <button type="submit" class="bg-primary"><i class="fa-solid fa-pen-to-square fa-lg"></i></button>
          </form>
          {{endif ~tallas_zapatos_edit}} <br>

          {{if ~tallas_zapatos_delete}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_zapato"/>
              <input type="hidden" name="mode" value="DEL" />
              <input type="hidden" name="talla_zapatocod" value={{talla_zapatocod}} />
              <button type="submit" class="bg-danger"><i class="fa-solid fa-trash fa-lg"></i></button>
          </form>
          {{endif ~tallas_zapatos_delete}}
        </td>
      </tr>
      {{endfor tallas_zapatos}}
    </tbody>
  </table>
</section>
<script>
   document.addEventListener("DOMContentLoaded", function () {
      document.getElementById("btnAdd").addEventListener("click", function (e) {
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_talla_zapato&mode=INS&talla_zapatocod=0");
      });
    });
</script>