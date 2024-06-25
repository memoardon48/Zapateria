<h1>{{modedsc}}</h1>
<section class="row">
  <form action="index.php?page=Mnt_Talla&mode={{mode}}&tallacod={{tallacod}}"
    method="POST"
    class="col-6 col-3-offset"
  >
    <section class="row">
        <label for="tallacod" class="col-4">Código</label>
        <input type="hidden" id="tallacod" name="tallacod" value="{{tallacod}}"/>
        <input type="hidden" id="mode" name="mode" value="{{mode}}"/>
        <input type="hidden"  name="xssToken" value="{{xssToken}}"/>
        <input type="text" readonly name="tallacoddummy" value="{{tallacod}}"/>
    </section>


    <section class="row">
      <label for="descripciontalla" class="col-4">Talla</label>
      <input type="text" {{readonly}} name="descripciontalla" value="{{descripciontalla}}" maxlength="45" placeholder="Talla"/>
      {{if descripciontalla_error}}
        <span class="error col-12">{{descripciontalla_error}}</span>
      {{endif descripciontalla_error}}
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
      <button type="submit" name="btnGuardar" value="G">Guardar</button>
      {{endif show_action}}
      <button type="button" id="btnCancelar">Cancelar</button>
    </section>
  </form>
</section>


<script>
  document.addEventListener("DOMContentLoaded", function(){
      document.getElementById("btnCancelar").addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=Mnt_Tallas");
      });
  });
</script>