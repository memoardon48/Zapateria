<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Exception;

class Checkout extends PublicController{    
    private $viewData = array(
        "cart" => array(),
        "contador" => 0,
        "subtotal" => 0,
        "total" => 0,
        "isv" => 0,
        "hasErrors"=> false,
        "errors" => array(),
        "pais" => "",
        "estado" => "",
        "ciudad" => "",
        "direccion" => "",
        "telefono" => ""

    );

  

    public function run():void
    {
 
        if(!\Utilities\Security::isLogged())
        {
            \Utilities\Site::redirectToWithMsg("index.php?page=sec_login", "Debe iniciar sesión para poder comprar");
        }
        else{
            $user = intval(\Utilities\Security::getUserId());
            $this->viewData["cart"] = \Dao\Cart\Carretilla::findByUser($user);
            $amount= \Dao\Cart\Carretilla::obtenerTotalCarretilla($user);
            $quant = \Dao\Cart\Carretilla::obtenerSumaProductosCarretilla($user);
            $this->viewData["subtotal"] = floatval($amount["amount"]);       
            $this->viewData["isv"] = $this->viewData["subtotal"] * 0.15;
            $this->viewData["total"] = $this->viewData["subtotal"] + $this->viewData["isv"];

            if(!empty($quant["quantity"])){
                $this->viewData["contador"] = $quant["quantity"];
                $this->viewData["hasItems"] = true;
            }else{
                $this->viewData["contador"] = 0;
            }
    
            if ($this->isPostBack()) {
                $this->validateData();
                if(!$this->viewData["hasErrors"]){
                    $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                        "test".(time() - 10000000),
                        "http://localhost/NegociosWebPro/index.php?page=checkout_error",
                        "http://localhost/NegociosWebPro/index.php?page=checkout_accept"
                    );
                    $carrito = \Dao\Cart\Carretilla::findByUser($user);
    
                    foreach($carrito as $producto){
                        $tax = floatval($producto["crrprc"])*0.15;
                       
                        $PayPalOrder->addItem($producto["nombrezapato"], "Color: ".$producto["color"].". Talla: ".$producto["descripciontalla"], $producto["talla_zapatocod"], $producto["crrprc"], $tax, $producto["crrctd"], "PHYSICAL_GOODS");
                    }
                    
                    $response = $PayPalOrder->createOrder();
                    $_SESSION["orderid"] = $response[1]->result->id;
                    \Utilities\Site::redirectTo($response[0]->href);
                    die();

                }
            }
        }

        \Views\Renderer::render("paypal/checkout", $this->viewData);
    }

    private function validateData(){
        if(isset($_POST["pais"])){
            error_log($_POST["pais"]);            
            if(\Utilities\Validators::IsEmpty($_POST["pais"])){
                $this->viewData["hasErrors"] = true;
                $this->viewData["errors"][] = "El campo de país no puede ir vacío";
                
            }            
        }else{
            throw new Exception("pais not present in form");
        }
        
        if(isset($_POST["estado"])){
            if(\Utilities\Validators::IsEmpty($_POST["estado"])){
                $this->viewData["hasErrors"] = true;
                $this->viewData["errors"][] = "El campo de estado no puede ir vacío";
                
            }
            
        }else{
            throw new Exception("estado not present in form");
        }

        if(isset($_POST["ciudad"])){
            if(\Utilities\Validators::IsEmpty($_POST["ciudad"])){
                $this->viewData["hasErrors"] = true;
                $this->viewData["errors"][] = "El campo de ciudad no puede ir vacío";
                
            }
            
        }else{
            throw new Exception("ciudad not present in form");
        }

        if(isset($_POST["direccion"])){
            if(\Utilities\Validators::IsEmpty($_POST["direccion"])){
                $this->viewData["hasErrors"] = true;
                $this->viewData["errors"][] = "El campo de direccion no puede ir vacío";
                
            }
            
        }else{
            throw new Exception("direccion not present in form");
        }

        if(isset($_POST["telefono"])){
            if(\Utilities\Validators::IsEmpty($_POST["telefono"])){
                $this->viewData["hasErrors"] = true;
                $this->viewData["errors"][] = "El campo de telefono no puede ir vacío";
                
            }
            
        }else{
            throw new Exception("telefono not present in form");
        }

        $this->viewData["pais"] = $_POST["pais"];
        $this->viewData["estado"] = $_POST["estado"];
        $this->viewData["ciudad"] = $_POST["ciudad"];
        $this->viewData["direccion"] = $_POST["pais"];
        $this->viewData["telefono"] = $_POST["telefono"];
        
        \Utilities\Security::address($this->viewData["direccion"],$this->viewData["ciudad"],$this->viewData["estado"],$this->viewData["pais"],$this->viewData["telefono"]);
    }
}
?>
