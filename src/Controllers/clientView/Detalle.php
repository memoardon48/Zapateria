<?php

namespace Controllers\clientView;

use Controllers\PublicController;
use Views\Renderer;
use Exception;


class Detalle extends PublicController
{

    private $redirectTo = "index.php?page=index";
    private $viewData = array(
        "zapatocod" => ""
    );

    private $viewData2 = array(
        "zapatocod" => "",
        "marcacod" => "",
        "departamentocod"=>"",
        "precio" => "",
        "imagenzapato" => "",
        "zapatoest"=>"",
        "color" => "",
        "descripcion" => "",
        "detalles" => "",
        "nombrezapato" => "",
        "related" => array(),
        "tallas" => array(),
        "depart" => "",
        "depart2" => "",
        "hasError" => false,
        "error" => ""

    );

    private $sendValues = array(
        "talla_zapatocod" => "",
        "stockDisp" => array(),
        "crrctd" => 0,
        "crrprc" => 0,
        "userId" => 0
    );

    public function run(): void
    {
        try {            
            $this->page_loaded();     
            \Dao\Cart\Catalogo::quitarDeCarretilla();
            \Dao\Cart\Catalogo::quitarDeCarretillaAnon();    
            $zapato = \Dao\Mnt\Zapatos::findById($this->viewData["zapatocod"]);
            $depart = \Dao\Mnt\Departamentos::findById($zapato["departamentocod"]);
            \Utilities\ArrUtils::mergeFullArrayTo($zapato, $this->viewData2);
            $this->viewData2["related"] = \Dao\Mnt\Zapatos::findByRelated($this->viewData2["marcacod"], $this->viewData2["departamentocod"],$this->viewData2["zapatocod"]);
            $this->viewData2["tallas"] = \Dao\Mnt\Zapatos::findSizes($this->viewData2["zapatocod"]);
            
            if($depart["nombredepartamento"] === "Niños"){
                $this->viewData2["depart"] = "ninos";
                $this->viewData2["depart2"] = "Niños";
            }
            else{
                $this->viewData2["depart"] = $depart["nombredepartamento"];
                $this->viewData2["depart2"] = $depart["nombredepartamento"];
            }

            if($this->isPostBack()){
                $this->ValidatePostData();
            }

            Renderer::render('clientView/detalle', $this->viewData2);
        } catch (Exception $error) {           
            error_log(sprintf("Controller/Mnt/Detalle ERROR: %s", $error->getMessage()));
            \Utilities\Site::redirectToWithMsg(
                $this->redirectTo,
                "Algo Inesperado Sucedió. Intente de Nuevo."
            );
        }

    }

    private function page_loaded()
    {
        if (isset($_GET['zapatocod'])) {
            $this->viewData["zapatocod"] = intval($_GET["zapatocod"]);
        } else {
            throw new Exception("Id not found on Query Params");
        }

    }

    private function ValidatePostData()
    {
        if (isset($_POST['talla_zapatocod'])) {
            $this->sendValues["talla_zapatocod"] = intval($_POST["talla_zapatocod"]);
        } else {
            throw new Exception("talla_zapatocod not present in form");
        }
        if (isset($_POST['cantidad'])) {
            if($_POST['cantidad']< 8){
                $this->sendValues["crrctd"] = intval($_POST["cantidad"]);
            }else{
                throw new Exception("la cantidad debe ser menor a 8 ");
            }            
        } else {
            throw new Exception("cantidad not present in form");
        }
         
        $this->sendValues["stockDisp"] = \Dao\Cart\CarretillaAnon::obtenerStockDisponible($this->sendValues["talla_zapatocod"]);
        $this->sendValues["crrprc"] = $this->viewData2["precio"];

        if(!\Utilities\Security::isLogged())
        {
            $this->addProductCarritoAnonimo();
        }
        else
        {
            $this->sendValues["userId"] = intval(\Utilities\Security::getUserId());
            $this->addProductCarretilla();
        }
    }

    private function addProductCarritoAnonimo()
    {
        $comprobar = \Dao\Cart\CarretillaAnon::comprobarProductoEncarretillaanon(session_id(), $this->sendValues["talla_zapatocod"]);

        if(empty($comprobar))
        {   
            if(!$this->validarCantidadDisponibleProducto())
            {
                $this->ingresarProductoCarritoAnonimo();
            }
        }
        else
        {
            if(!$this->validarCantidadDisponibleProducto())
            {
                $this->ingresarProductoRepetidoCarritoAnonimo();
            }
        }
    }

    private function addProductCarretilla()
    {
        $comprobar = \Dao\Cart\Carretilla::comprobarProductoEnCarretilla($this->sendValues["userId"], $this->sendValues["talla_zapatocod"]);

        if(empty($comprobar))
        {   
            if(!$this->validarCantidadDisponibleProducto())
            {
                $this->ingresarProductoCarretilla();
            }
        }
        else
        {
            if(!$this->validarCantidadDisponibleProducto())
            {
                $this->ingresarProductoRepetidoCarritoAnonimo();
            }
        }
    }
    private function validarCantidadDisponibleProducto()
    {
        $error = false;
        if($this->sendValues["crrctd"] > intval($this->sendValues["stockDisp"]["stock"]))
        {
            $this->viewData2["hasError"] = true;
            $this->viewData2["error"] = "No se cuenta con suficientes unidades.<br> Unidades actuales: ".$this->sendValues["stockDisp"]["stock"];
            $error = true;
        }

        return $error;
    }

    private function ingresarProductoCarritoAnonimo()
    {
        $insert = \Dao\Cart\CarretillaAnon::insert(session_id(), $this->sendValues["talla_zapatocod"], $this->sendValues["crrctd"], $this->sendValues["crrprc"]);
        $update =  \Dao\Cart\CarretillaAnon::disiminuirStock($this->sendValues["crrctd"], $this->sendValues["talla_zapatocod"]);

        if($insert && $update)
        {
            \Utilities\Site::redirectToWithMsg("index.php?page=clientView_detalle&zapatocod=".$this->viewData2["zapatocod"], "Producto Agregado al Carrito con Éxito");
        }
        else{
            \Utilities\Site::redirectToWithMsg("index.php?page=clientView_detalle&zapatocod=".$this->viewData2["zapatocod"], "Producto No se Agregó al Carrito");
        }
    }

    private function ingresarProductoCarretilla()
    {
        $insert = \Dao\Cart\Carretilla::insert($this->sendValues["userId"], $this->sendValues["talla_zapatocod"], $this->sendValues["crrctd"], $this->sendValues["crrprc"]);
        $update =  \Dao\Cart\Carretilla::disiminuirStock($this->sendValues["crrctd"], $this->sendValues["talla_zapatocod"]);

        if($insert && $update)
        {
            \Utilities\Site::redirectToWithMsg("index.php?page=clientView_detalle&zapatocod=".$this->viewData2["zapatocod"], "Producto Agregado al Carrito con Éxito");
        }
        else{
            \Utilities\Site::redirectToWithMsg("index.php?page=clientView_detalle&zapatocod=".$this->viewData2["zapatocod"], "Producto No se Agregó al Carrito");
        }
    }

    private function ingresarProductoRepetidoCarritoAnonimo(){
        $updateCarrito = \Dao\Cart\CarretillaAnon::sumarCantidadEnCarritoAnonimo(session_id(), $this->sendValues["crrctd"] ,$this->sendValues["talla_zapatocod"]);
        $updateStock =  \Dao\Cart\CarretillaAnon::disiminuirStock($this->sendValues["crrctd"], $this->sendValues["talla_zapatocod"]);

        if($updateCarrito && $updateStock)
        {
                \Utilities\Site::redirectToWithMsg("index.php?page=clientView_detalle&zapatocod=".$this->viewData2["zapatocod"], "Producto Agregado al Carrito con Éxito");
                    
        }
        else{
                \Utilities\Site::redirectToWithMsg("index.php?page=clientView_detalle&zapatocod=".$this->viewData2["zapatocod"], "Producto No se Agregó al Carrito");
        }        
    }

    private function ingresarProductoRepetidoCarretilla(){
        $updateCarrito = \Dao\Cart\Carretilla::sumarCantidadEnCarretilla($this->sendValues["userId"], $this->sendValues["crrctd"] ,$this->sendValues["talla_zapatocod"]);
        $updateStock =  \Dao\Cart\Carretilla::disiminuirStock($this->sendValues["crrctd"], $this->sendValues["talla_zapatocod"]);

        if($updateCarrito && $updateStock)
        {
                \Utilities\Site::redirectToWithMsg("index.php?page=clientView_detalle&zapatocod=".$this->viewData2["zapatocod"], "Producto Agregado al Carrito con Éxito");
                    
        }
        else{
                \Utilities\Site::redirectToWithMsg("index.php?page=clientView_detalle&zapatocod=".$this->viewData2["zapatocod"], "Producto No se Agregó al Carrito");
        }        
    }

}
?>