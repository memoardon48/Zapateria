<?php

namespace Controllers\Checkout;
use Exception;
use Controllers\PublicController;
class Accept extends PublicController{
    public function run():void
    {
        $dataview = array();
        $user = \Utilities\Security::getUserId();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        if ($token !== "" && $token == $session_token) {
            $result = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
            $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
            $grossAmount = $result->result->purchase_units[0]->payments->captures[0]->seller_receivable_breakdown->gross_amount->value;
            $paypal_fee = $result->result->purchase_units[0]->payments->captures[0]->seller_receivable_breakdown->paypal_fee->value;
            $net_amount = $result->result->purchase_units[0]->payments->captures[0]->seller_receivable_breakdown->net_amount->value;
            $amout = $grossAmount/1.15;
            $isv = $amout * 0.15;
            try{                
                \Dao\Mnt\Ventas::insert($user,$isv,$grossAmount,$paypal_fee,$net_amount,$amout);
                $codVenta = \Dao\Mnt\Ventas::findLastSellId($user);
                $venta = \Dao\Mnt\Ventas::findById($codVenta["codigo"]);
                $dataview["amount"] = $venta["amount"];
                $dataview["isv"] = $venta["isv"];
                $dataview["cantidadBruta"] = $venta["cantidadBruta"];
                $carrito = \Dao\Cart\Carretilla::findByUser($user);

                foreach($carrito as $producto){
                    \Dao\Mnt\DetallesVentas::insert($codVenta["codigo"],$producto["talla_zapatocod"],$producto["crrctd"],$producto["crrprc"]);
                }      
                
                $pedido = \Utilities\Security::getAddress();
                \Dao\Mnt\Pedidos::insert($codVenta["codigo"],$pedido["telefonoCont"],$pedido["direccion"],$pedido["ciudad"],$pedido["estado"],$pedido["pais"]);

                $dataview["detalle"] = \Dao\Mnt\DetallesVentas::findByVentaId($codVenta["codigo"]);

                \Utilities\Security::clearAddress();
                \Dao\Cart\Carretilla::deleteAllByUser($user);

            }catch(Exception $er){
                error_log(sprintf("Controller/Checkout/Accept ERROR: %s", $er->getMessage()));
                \Utilities\Site::redirectToWithMsg(
                "index.php?page=checkout_checkout",
                "Algo Inesperado Sucedió. Intente de Nuevo."
            );
            }
        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }
        \Views\Renderer::render("paypal/accept", $dataview);
    }
}

?>
