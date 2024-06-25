<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOESNW | Inicio</title>
    <link rel="stylesheet" href="../css/inicio.css">
        <link rel="stylesheet" href="../css/backgrounds.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
</head>

<body>
  
    <!--ANUNCIO #1 DE LA PÁGINA-->
    <div class="container-fluid banner">
        <div class="row justify-content-start">
            <a href="index.php?page=clientView_caballeros" class="text-dark m-4 button-index col-2">ZAPATOS CABALLEROS</a>

        </div>
    </div>
    <hr>
    <!--TARJETAS #1 DE PRODUCTO DE LA PÁGINA-->
    <div class="containerImages1">        
            <div class="row">
            {{foreach hombres}}
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <img src="public\imgs\uploads\{{imagenzapato}}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">{{nombrezapato}}</h5>
                        <p class="card-text txt-rojo">$ {{precio}}</p>
                        <a href="index.php?page=clientView_detalle&zapatocod={{zapatocod}}" class="button">VER MÁS</a>
                      </div>
                </div>
            </div>      
            {{endfor hombres}}         
        </div>
        
    </div>
    <hr>


    <!--ANUNCIO #2 DE LA PÁGINA-->
    <div class="container-fluid banner2">
        <div class="row justify-content-start">
            <a href="index.php?page=clientView_damas" class="text-dark m-4 button-index col-2">ZAPATOS DAMAS</a>

        </div>
    </div>
    <hr>
    <!--TARJETAS #2 DE LA PÁGINA-->
    <div class="containerImages2">
        <div class="row">
            {{foreach mujeres}}
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <img src="public\imgs\uploads\{{imagenzapato}}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">{{nombrezapato}}</h5>
                        <p class="card-text txt-rojo">$ {{precio}}</p>
                        <a href="index.php?page=clientView_detalle&zapatocod={{zapatocod}}" class="button">VER MÁS</a>
                      </div>
                </div>
            </div>      
            {{endfor mujeres}}               

            
        </div> 
    </div>
    <hr>

    <!--ANUNCIO #3 DE LA PÁGINA-->
    <div class="container-fluid banner3">
        <div class="row justify-content-start">
            <a href="index.php?page=clientView_ninos" class="text-dark m-4 button-index col-2">ZAPATOS NIÑOS</a>

        </div>
    </div>
    <hr>
    <!--TARJETAS #3 DE LA PÁGINA-->
    <div class="containerImages3">
        <div class="row">
            {{foreach ninos}}
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <img src="public\imgs\uploads\{{imagenzapato}}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">{{nombrezapato}}</h5>
                        <p class="card-text txt-rojo">$ {{precio}}</p>
                        <a href="index.php?page=clientView_detalle&zapatocod={{zapatocod}}" class="button">VER MÁS</a>
                      </div>
                </div>
            </div>      
            {{endfor ninos}}  
 
        </div> 
    </div>
   
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</html>