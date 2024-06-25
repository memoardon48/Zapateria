<?php
namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;
Use Exception;

class Pedidos extends PrivateController {
    public function run() :void
    {
        
        
        try{
            
            if($this->isPostBack()){
                
                $this->validateData();
            }

        }catch (Exception $error) {           
            error_log(sprintf("Controller/Mnt/Pedido ERROR: %s", $error->getMessage()));
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-pedidos",
                "Algo Inesperado Sucedió. Intente de Nuevo."
            );
        }
        $viewData = array();
        $viewData["pedido_change"] = $this->isFeatureAutorized('mnt_pedido_change');
        $numTotal = \Dao\Mnt\Pedidos::findNumPedidos();
        $numPend = \Dao\Mnt\Pedidos::findNumPendientes();
        $numEntregados = \Dao\Mnt\Pedidos::findNumEntregados();

        $viewData["numTotal"] = $numTotal["numPedidos"];
        $viewData["numPend"] = $numPend["numPend"];
        $viewData["numEntregados"] = $numEntregados["numEntre"];
        $viewData["pedidos"] = \Dao\Mnt\Pedidos::findAll();

        

        Renderer::render('mnt/pedidos', $viewData);

    }

    private function validateData(){
        if(isset($_POST["pedidocod"])){
            $codigo = intval($_POST["pedidocod"]);
            $pedido = \Dao\Mnt\Pedidos::findById($codigo);
            error_log("si llega aqui---------------------------");
            if($pedido["pedidoest"] == "PEND"){
                \Dao\Mnt\Pedidos::cambiarEstadoDone($codigo);
            } else{
                \Dao\Mnt\Pedidos::cambiarEstadoPend($codigo);
            }
            
        }else{
            throw new Exception("pedidocod not present!");
        }
        
        
    }
}
?>