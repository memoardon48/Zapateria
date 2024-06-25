<h1>{{modedsc}}</h1>
<section class="row">
  <form action="index.php?page=Mnt_Venta&mode={{mode}}&ventacod={{ventacod}}"
    method="POST"
    class="col-6 col-3-offset"
  >
    <section class="row">
        <label for="ventacod" class="col-4">Código Venta</label>
        <input type="hidden" id="ventacod" name="ventacod" value="{{ventacod}}"/>
        <input type="hidden" id="mode" name="mode" value="{{mode}}"/>
        <input type="hidden"  name="xssToken" value="{{xssToken}}"/>
        <input type="text" readonly name="ventacoddummy" value="{{ventacod}}"/>
    </section>

    <section class="row">
        <label for="usercod" class="col-4">Código Usuario</label>
        <input type="hidden" id="usercod" name="usercod" value="{{usercod}}"/>
        <input type="hidden" id="mode" name="mode" value="{{mode}}"/>
        <input type="hidden"  name="xssToken" value="{{xssToken}}"/>
        <input type="text" readonly name="usercoddummy" value="{{usercod}}"/>
    </section>

    <section class="row">
      <label for="fechaventa" class="col-4">Fecha</label>
      <input type="date" {{readonly}} name="fechaventa" value="{{fechaventa}}" />
    </section>



    <section class="row">
      <label for="isv" class="col-4">ISV</label>
      <input type="text" {{readonly}} name="isv" value="{{isv}}" maxlength="45" placeholder="ISV"/>
      {{if isv_errors}}
        <span class="error col-12">{{isv_errors}}</span>
      {{endif isv_errors}}
    </section>

    <section class="row">
      <label for="cantidadBruta" class="col-4">Cantidad Bruta</label>
      <input type="text" {{readonly}} name="cantidadBruta" value="{{cantidadBruta}}" maxlength="45" placeholder="Cantidad Bruta"/>
      {{if cantidadBruta_errors}}
        <span class="error col-12">{{cantidadBruta_errors}}</span>
      {{endif cantidadBruta_errors}}
    </section>

    <section class="row">
      <label for="comisionPayPal" class="col-4">Comisión PayPal</label>
      <input type="text" {{readonly}} name="comisionPayPal" value="{{comisionPayPal}}" maxlength="45" placeholder="Comisión PayPal"/>
      {{if comisionPayPal_errors}}
        <span class="error col-12">{{comisionPayPal_errors}}</span>
      {{endif comisionPayPal_errors}}
    </section>


     <section class="row">
      <label for="cantidadNeta" class="col-4">Cantidad Neta</label>
      <input type="text" {{readonly}} name="cantidadNeta" value="{{cantidadNeta}}" maxlength="45" placeholder="Cantidad Neta"/>
      {{if cantidadNeta_errors}}
        <span class="error col-12">{{cantidadNeta_errors}}</span>
      {{endifcantidadNeta_errors}}
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

  </form>
</section>


<script>
  document.addEventListener("DOMContentLoaded", function(){
      document.getElementById("btnCancelar").addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=Mnt_Ventas");
      });
  });
</script>