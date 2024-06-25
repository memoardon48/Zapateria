<div class="my-4 container text-center">
  <h1>{{modedsc}}</h1>
</div>
<section class="container">
  <div class="row justify-content-center">
    <form action="index.php?page=Mnt_Talla_Zapato&mode={{mode}}&talla_zapatocod={{talla_zapatocod}}" method="POST"
      class="col-10 align-self-center bg-gris_claro p-4 rounded">

      <section class="row mb-3 bg-gris_claro2 p-3 rounded">
        <label for="talla_zapatocod" class="col-4 form-label">Código</label>
        <input type="hidden" id="talla_zapatocod" name="Talla zapatocod" value="{{talla_zapatocod}}" />
        <input type="hidden" id="mode" name="mode" value="{{mode}}" />
        <input type="hidden" name="xssToken" value="{{xssToken}}">
        <input type="text" readonly class="form-control" name="talla_zapatocoddummy" value="{{talla_zapatocod}}" />
      </section>

      <section class="row mb-3 bg-gris_claro2 p-3 rounded">
        <label for="tallacod" class="col-4 form-label">Código de talla</label>
        <input type="hidden" id="tallacod" name="tallacod" value="{{tallacod}}" />
        <input type="hidden" id="mode" name="mode" value="{{mode}}" />
        <input type="hidden" name="xssToken" value="{{xssToken}}">
        <input type="text" readonly class="form-control" name="tallacoddummy" value="{{tallacod}}" />
      </section>

      <section class="row mb-3 bg-gris_claro2 p-3 rounded">
        <label for="zapatocod" class="col-4 form-label">Zapato Cod</label>
        <input type="hidden" id="precio" name="zapatocod" value="{{zapatocod}}" />
        <input type="hidden" id="mode" name="mode" value="{{mode}}" />
        <input type="hidden" name="xssToken" value="{{xssToken}}">
        <input type="text" readonly class="form-control" name="zapatocoddummy" value="{{zapatocod}}" />
      </section>

      <section class="row mb-3 bg-gris_claro2 p-3 rounded">
        <label for="stock" class="col-4 form-label">Stock</label>
        <input type="hidden" id="stock" name="stock" value="{{stock}}" />
        <input type="hidden" id="mode" name="mode" value="{{mode}}" />
        <input type="hidden" name="xssToken" value="{{xssToken}}">
        <input type="text" readonly class="form-control" name="stock" value="{{stock}}" />
      </section>

      {{if has_errors}}
      <section>
        <ul>
          {{foreach general_errors}}
          <li>{{this}}</li>
          {{endfor general_errors}}
        </ul>
      </section>
      {{endif has_errors}}
      <section>
        {{if show_action}}
        <button type="submit" name="btnGuardar" class="bg-dark text-white" value="G"><i class="fa-regular fa-floppy-disk" style="color: #ffffff;"></i>&nbsp;&nbsp;Guardar</button>
        &nbsp;&nbsp;&nbsp;
        {{endif show_action}}
        <button type="button" id="btnCancelar" class="bg-dark text-white"><i class="fa-solid fa-xmark"
            style="color: #ffffff;"></i>&nbsp;&nbsp;Cancelar</button>
      </section>
    </form>
  </div>
</section>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("btnCancelar").addEventListener("click", function (e) {
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=Mnt_Zapatos");
    });
  });
</script>