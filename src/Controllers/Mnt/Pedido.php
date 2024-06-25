<?php
namespace Controllers\Mnt;
use Controllers\PrivateController;
use Exception;
use Views\Renderer;


class Pedido extends PrivateController{
    private $redirectTo = "index.php?page=Mnt-Pedidos";
    private $viewData = array(
        "mode" => "",
        "modedsc" => "",
        "pedidocod" => 0,
        "ventacod" =>"",
        "direccion" =>"",
        "ciudad" => "",
        "estado" => "",
        "pais" => "",
        "telefonoCont" => "",
        "pedidoest" => "PEND",
        "pedidoest_PEND" => "selected",
        "pedidoest_DONE" => "",
        "general_errors"=> array(),
        "has_errors" =>false,
        "show_action" => true,
        "readonly" => false,
        "xssToken" =>""
    );
    private $modes = array(
        "DSP" => "Detalle de %s (%s)",
        
    );
    private $modesAuth = array(
        "DSP" => "mnt_pedidos_view",
        
    );
    public function run() :void
    {
        try {
            $this->page_loaded();
            if($this->isPostBack()){
                $this->validatePostData();
                if(!$this->viewData["has_errors"]){
                    $this->executeAction();
                }
            }
            $this->render();
        } catch (Exception $error) {
            unset($_SESSION["xssToken_Mnt_Pedido"]);
            error_log(sprintf("Controller/Mnt/Pedido ERROR: %s", $error->getMessage()));
            \Utilities\Site::redirectToWithMsg(
                $this->redirectTo,
                "Algo Inesperado Sucedió. Intente de Nuevo."
            );
        }
    }


    private function page_loaded()
    {
        if(isset($_GET['mode'])){
            if(isset($this->modes[$_GET['mode']])){
                $this->viewData["mode"] = $_GET['mode'];
            } else {
                throw new Exception("Mode Not available");
            }
        } else {
            throw new Exception("Mode not defined on Query Params");
        }
        
    }

    private function validatePostData(){
        if(isset($_POST["xssToken"])){
            if(isset($_SESSION["xssToken_Mnt_Pedido"])){
                if($_POST["xssToken"] !== $_SESSION["xssToken_Mnt_Pedido"]){
                    throw new Exception("Invalid Xss Token no match");
                }
            } else {
                throw new Exception("Invalid Xss Token on Session");
            }
        } else {
            throw new Exception("Invalid Xss Token");
        }
        if(isset($_POST["pedidoest"])){
            if (!in_array( $_POST["pedidoest"], array("PEND","DONE"))){
                throw new Exception("pedidoest incorrect value");
            }
        }
        
        if(isset($_POST["mode"])){
            if(!key_exists($_POST["mode"], $this->modes)){
                throw new Exception("mode has a bad value");
            }
            if($this->viewData["mode"]!== $_POST["mode"]){
                throw new Exception("mode value is different from query");
            }
        }else {
            throw new Exception("mode not present in form");
        }
    }
    private function render(){
        $xssToken = md5("PEDIDO" . rand(0,4000) * rand(5000, 9999));
        $this->viewData["xssToken"] = $xssToken;
        $_SESSION["xssToken_Mnt_Pedido"] = $xssToken;

        if($this->viewData["mode"] === "INS") {
            $this->viewData["modedsc"] = $this->modes["INS"];
        } else {
            $tmpPedidos = \Dao\Mnt\Pedidos::findById($this->viewData["pedidocod"]);
            if(!$tmpPedidos){
                throw new Exception("Pedido no existe en DB");
            }
            \Utilities\ArrUtils::mergeFullArrayTo($tmpPedidos, $this->viewData);
            $this->viewData["modedsc"] = sprintf(
                $this->modes[$this->viewData["mode"]],
                $this->viewData["pedidocod"],
                $this->viewData["ventacod"],
                $this->viewData["direccion"],
                $this->viewData["ciudad"],
                $this->viewData["estado"],
                $this->viewData["pais"],
                $this->viewData["telefonoCont"],
                $this->viewData["pedidosest"]
            );
            $this->viewData["pedidoest_PEND"] = $this->viewData["pedidoest"] === "PEND" ? "selected": "";
            $this->viewData["pedidoest_DONE"] = $this->viewData["pedidoest"] === "DONE" ? "selected": "";
            if(in_array($this->viewData["mode"], array("DSP","DEL"))){  
                $this->viewData["readonly"] = "readonly";
            }
            if($this->viewData["mode"] === "DSP") {
                $this->viewData["show_action"] = false;
            }
        }
        Renderer::render("mnt/pedido", $this->viewData);
    }
}

?>