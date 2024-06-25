<?php

namespace Controllers\clientView;

use Controllers\PublicController;
use Views\Renderer;
use Exception;


class Carrito extends PublicController {
    private $viewData = array(
        "cart" => array(),
        "contador" => 0,
        "subtotal" => 0,
        "total" => 0,
        "isv" => 0,
        "hasItems" => false
    );

    private $delData = array(
        "talla_zapatocod" => 0,
        "crrctd" => 0
    );
    public function run() :void
    {      
        \Dao\Cart\Catalogo::quitarDeCarretilla();
        \Dao\Cart\Catalogo::quitarDeCarretillaAnon();  
        $user = intval(\Utilities\Security::getUserId());   
        
        if(!\Utilities\Security::isLogged()){
            $this->viewData["cart"] = \Dao\Cart\CarretillaAnon::findByUser(session_id());
            $amount= \Dao\Cart\CarretillaAnon::obtenerTotalcarretillaanon(session_id());
            $quant = \Dao\Cart\CarretillaAnon::obtenerSumaProductosCarretilla(session_id());
        }else{
            $this->viewData["cart"] = \Dao\Cart\Carretilla::findByUser($user);
            $amount= \Dao\Cart\Carretilla::obtenerTotalCarretilla($user);
            $quant = \Dao\Cart\Carretilla::obtenerSumaProductosCarretilla($user);
        }

        $this->viewData["subtotal"] = floatval($amount["amount"]);       
        $this->viewData["isv"] = $this->viewData["subtotal"] * 0.15;
        $this->viewData["total"] = $this->viewData["subtotal"] + $this->viewData["isv"];
        
        if(!empty($quant["quantity"])){
            $this->viewData["contador"] = $quant["quantity"];
            $this->viewData["hasItems"] = true;
        }else{
            $this->viewData["contador"] = 0;
        }


        if($this->isPostBack()){
            $this->ValidatePostData();
        }
                
        Renderer::render('clientView/carrito', $this->viewData);
    }

    private function ValidatePostData()
    {
        if (isset($_POST['talla_zapatocod'])) {
            $this->delData["talla_zapatocod"] = intval($_POST["talla_zapatocod"]);
        } else {
            throw new Exception("talla_zapatocod not present in form");
        }    
        if (isset($_POST['crrctd'])) {
            $this->delData["crrctd"] = intval($_POST["crrctd"]);
        } else {
            throw new Exception("crrctd not present in form");
        }              

        if(!\Utilities\Security::isLogged())
        {
            $this->deleteProductCarritoAnonimo();
        }
        else
        {                 
            $this->deleteProductCarretilla();
        }
        
    }

    private function deleteProductCarritoAnonimo()
    {
        $delete = \Dao\Cart\CarretillaAnon::delete(session_id(), $this->delData["talla_zapatocod"]);
        $update =  \Dao\Cart\CarretillaAnon::aumentarStock($this->delData["crrctd"], $this->delData["talla_zapatocod"]);

        if($delete && $update)
        {
            \Utilities\Site::redirectToWithMsg("index.php?page=clientView_carrito", "Producto Eliminado del Carrito con Éxito");
        }
        else{
            \Utilities\Site::redirectToWithMsg("index.php?page=clientView_carrito", "Producto No se Elimino del Carrito");
        }
    }

    private function deleteProductCarretilla()
    {
        $userId = intval(\Utilities\Security::getUserId());
        $delete = \Dao\Cart\Carretilla::delete($userId, $this->delData["talla_zapatocod"]);
        $update =  \Dao\Cart\Carretilla::aumentarStock($this->delData["crrctd"], $this->delData["talla_zapatocod"]);

        if($delete && $update)
        {
            \Utilities\Site::redirectToWithMsg("index.php?page=clientView_carrito", "Producto Eliminado del Carrito con Éxito");
        }
        else{
            \Utilities\Site::redirectToWithMsg("index.php?page=clientView_carrito", "Producto No se Elimino del Carrito");
        }
    }
}
?>
