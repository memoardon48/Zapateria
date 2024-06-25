{{ifnot hasItems}}
    <div class="alert alert-success" role="alert">
        ¿Aún no has agregado productos? ¡Aprovecha a comprar! &nbsp;&nbsp;<i class="fa-solid fa-face-grin-tongue-wink fa-lg" style="color: #03720c;"></i>
    </div>
{{endifnot hasItems}}
<div class="container-fliud p-2">
    <h1>Mi Carrito <span class="badge bg-gris_oscuro">[ {{contador}} ]</span></h1><br><br>
    <div class="container">
        <div class="progress" role="progressbar" aria-label="Basic example" style="height: 5px" aria-valuenow="50"
            aria-valuemin="0" aria-valuemax="100">
            <div class="progress-bar bg-dark" style="width: 50%"></div>
        </div>
    </div>
</div>
<section class="container-fluid p-0">
    <div class="row">
        <div class="col-lg-6 p-3">
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
                                    <form action="index.php?page=clientView_carrito" method="POST">
                                        <input type="hidden" name="talla_zapatocod" value={{talla_zapatocod}}>
                                        <input type="hidden" name="crrctd" value={{crrctd}}>
                                        <button type="submit" class="btn bg-dark m-2 p-2"><i class="fa-sharp fa-solid fa-trash"
                                            style="color: #ffffff; font-size:20px;"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                {{endfor cart}}
                                
            </div>
        </div>
        <div class="col-lg-6 p-3">
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

            {{if hasItems}}
                <a href="index.php?page=checkout_checkout"><button class="btn col-12 bg-cafe txt-blanco p-3">CONTINUAR PEDIDO</button></a>
            {{endif hasItems}}
        </div>

    </div>

</section>

</div>

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