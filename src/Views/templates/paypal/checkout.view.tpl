<div class="container-fliud p-2">
    <h1>CHECKOUT</h1><br><br>
    <div class="container">
        <div class="progress" role="progressbar" aria-label="Basic example" style="height: 5px" aria-valuenow="50"
            aria-valuemin="0" aria-valuemax="100">
            <div class="progress-bar bg-dark" style="width: 100%"></div>
        </div>
    </div>
</div>
<section class="container-fluid p-0">
    <div class="row">
        <div class="col-lg-6 p-3">
            <div class="bg-gris_claro p-3">
                <b>1. ORDER DETAILS [ {{contador}} ]</b>
            </div>
            <div class="row gy-3 ">

                {{foreach cart}}
                <div class="col-12 p-0">
                    <div class="row border p-3">
                        <div class="col-3">
                            <img src="public\imgs\uploads\{{imagenzapato}}" class="img-fluid">
                        </div>
                        <div class="col-9 p-0">
                            <div class="row">
                                <div class="col-sm-12 col-md-9">
                                    <b>{{nombrezapato}}</b><br>
                                    Color: {{color}}<br>
                                    Size: {{descripciontalla}} <br>
                                    Cantidad: {{crrctd}} <br>
                                    Precio Unitario: $ {{crrprc}}

                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <b class="txt-rojo h3">${{subt}}</b><br>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                {{endfor cart}}


            </div>

            <div class="bg-gris_claro p-3 my-5">
                <b>2. ORDER</b>
            </div>
            <div class="border-top mt-3 border-bottom p-3">
                <div class="row">
                    <div class="col-6">
                        <p><b>SUBTOTAL</b></p>
                        <p><b>ISV</b></p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">${{subtotal}}</p>
                        <p class="text-end">${{isv}}</p>

                    </div>
                </div>

            </div>

            <div class="row p-3">
                <div class="col-6">
                    <p class="h3">TOTAL</p>
                </div>
                <div class="col-6">
                    <p class="text-end h3">${{total}}</p>

                </div>
            </div>
        </div>
        <div class="col-lg-6 p-3">
            <div class="bg-gris_claro p-3">
                <b>3. SHIPPING</b>
            </div>
            <form action="index.php?page=checkout_checkout" method="post">
                <div class="mb-3">
                    <label for="pais" class="form-label">País</label>
                    <input type="text" name="pais" value="{{pais}}" id="pais" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="estado" class="form-label">Estado/Departamento</label>
                    <input type="text" name="estado" value="{{estado}}" id="estado" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="ciudad" class="form-label">Ciudad</label>
                    <input type="text" name="ciudad" value="{{ciudad}}" id="ciudad" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="direccion" class="form-label">Dirección</label>
                    <input type="text" name="direccion" value="{{direccion}}" id="direccion" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="telefono" class="form-label">Teléfono de Contacto</label>
                    <input type="tel" name="telefono" id="telefono" value="{{telefono}}" class="form-control">
                    <div id="telHelp" class="form-text">No incluya guiones.</div>
                </div>

                <br><br>

                <button type="submit" class="btn col-12 bg-cafe p-3"><i class="fa-brands fa-paypal fa-xl text-white"></i>&nbsp;&nbsp;&nbsp;<span class="txt-blanco">CONTINUAR CON PAYPAL</span></button>
                <br><br>                
            </form>
            {{if hasErrors}}
                <div>                   
                    <ul>
                        {{foreach errors}}
                            <li class="text-danger">{{this}}</li>                        
                        {{endfor errors}}
                    </ul>                    
                </div>
            {{endif hasErrors}}
        </div>

    </div>

</section>

<div class="container-fluid bg-gris_claro2 p-2">
    <div class="container px-4 text-center">
        <div class="row gx-3 gy-3">
            <div class="col-lg-4 p-1">
                <div class="p-5 border border-secondary rounded">
                    <i class="fa-solid fa-lock fa-lg" style="color: #000000;"></i><br><br>
                    <b>SEGURIDAD</b><br>
                    En todas sus transacciones
                </div>
            </div>
            <div class="col-lg-4 p-1">
                <div class="p-5 border border-secondary rounded">
                    <i class="fa-solid fa-truck-fast fa-xl" style="color: #000000;"></i><br><br>
                    <b>VELOCIDAD</b><br>
                    Entregas de 1 a 3 días
                </div>
            </div>
            <div class="col-lg-4 p-1">
                <div class="p-5 border border-secondary rounded">
                    <i class="fa-solid fa-message fa-xl" style="color: #000000;"></i><br><br>
                    <b>SOPORTE ACTIVO</b><br>
                    Atención 24/7
                </div>
            </div>
        </div>
    </div>
</div>