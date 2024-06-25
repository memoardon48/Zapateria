<div class="container-fluid">
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb m-4">
            <li class="breadcrumb-item"><a href="index.php?page=index" class="text-dark">Home</a></li>
            <li class="breadcrumb-item"><a href="index.php?page=clientView-{{depart}}" class="text-dark">{{depart2}}</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">{{nombrezapato}}</li>
        </ol>
    </nav>

</div>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-9 py-3">
            <img src="public\imgs\uploads\{{imagenzapato}}" alt="50$" class="img-fluid">
        </div>
        <div class="col-sm-12 col-md-3 py-5 px-0">
            <div class="txt-negro">{{nombrezapato}}</div>
            <p class="txt-rojo h3 my-5">${{precio}}</p>
            <b class="txt-negro2">Color</b>
            <p>{{color}}</p>
            <div class="p-3 my-5 bg-gris_claro2">
                <b class="txt-negro2">Descripción</b>
                <p>{{descripcion}}</p>
                <b class="txt-negro2 my-4">Detalles</b>
                <p>{{detalles}}</p>
            </div>
            <form action="index.php?page=clientView_detalle&zapatocod={{zapatocod}}" method="POST">
                <div>
                    <label for="zapatotalla">TALLA</label>&nbsp;&nbsp;
                    <select id="zapatotalla" name="talla_zapatocod" style="width: 60px;">
                        {{foreach tallas}}
                        <option value="{{talla_zapatocod}}">{{descripciontalla}}</option>
                        {{endfor tallas}}

                    </select>

                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <div>
                    <label for="cantidad">CANTIDAD</label>&nbsp;&nbsp;
                    <select id="cantidad" name="cantidad" style="width: 60px;">
                        <option value="1"> 1 </option>
                        <option value="2"> 2 </option>
                        <option value="3"> 3 </option>
                        <option value="4"> 4 </option>
                        <option value="5"> 5 </option>
                        <option value="6"> 6 </option>
                        <option value="7"> 7 </option>
                        <option value="8"> 8</option>
                    </select>

                </div> 
                <br>
                <br>
                 <div class="text-danger">
                    {{if hasError}}
                        {{error}}
                    {{endif hasError}} 
                 </div>
                 <br><br>        
                <button class="btn btn-dark col-12 py-4" type="submit" name="btnAgregar" id="btnAgregar">AGREGAR AL
                    CARRITO</button>
            </form>

        </div>
    </div>
</div><br><br>
<div class="container">
    <p class="txt-negro py-5 mx-5 fs-4">PRODUCTOS RELACIONADOS</p>
</div>


<div class="container text-center">
    <div class="row gx-5 gy-4">
        {{foreach related}}
        <a class="col-sm-12 col-md-4" style="text-decoration: none;"
            href="index.php?page=clientView_detalle&zapatocod={{zapatocod}}">
            <img src="public\imgs\uploads\{{imagenzapato}}" alt="50$" class="img-fluid">
            <p class="text-start text-dark my-4">COLOR {{color}}</p>
            <div class="row">
                <b class="col-10 text-start text-dark p-0">{{nombrezapato}}</b>
                <p class="col-2 txt-rojo"> ${{precio}}</p>
            </div>
        </a>
        {{endfor related}}
    </div>
</div>