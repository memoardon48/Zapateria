<?php
namespace Controllers\Mnt;
use Controllers\PrivateController;
use Exception;
use Views\Renderer;

class Talla_Zapatos extends PrivateController{
    private $redirectTo = "index.php?page=Mnt-Tallas_Zapatos";
    private $viewData = array(
        "mode" => "DSP",
        "modedsc" => "",
        "talla_zapatocod" => 0,
        "tallacod" => "",
        "zapatocod" => "",
        "stock" => "",
        "descripciontalla_error"=> "",
        "general_errors"=> array(),
        "has_errors" =>false,
        "show_action" => true,
        "readonly" => false,
        "xssToken" =>""
    );
    private $modes = array(
        "DSP" => "Detalle de %s (%s)",
        "INS" => "Nueva Talla Zapato",
        "UPD" => "Editar %s (%s)",
        "DEL" => "Borrar %s (%s)"
    );

    private $modesAuth = array(
        "DSP" => "mnt_tallas_zapatos_view",
        "INS" => "mnt_tallas_zapatos_new",
        "UPD" => "mnt_tallas_zapatos_edit",
        "DEL" => "mnt_tallas_zapatos_delete"
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
            unset($_SESSION["xssToken_Mnt_Talla_Zapato"]);
            error_log(sprintf("Controller/Mnt/Talla_Zapato ERROR: %s", $error->getMessage()));
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
                if (!$this->isFeatureAutorized($this->modesAuth[$_GET['mode']])) {
                    throw new Exception("Mode is not Authorized!");
                }
                $this->viewData["mode"] = $_GET['mode'];
            } else {
                throw new Exception("Mode Not available");
            }
        } else {
            throw new Exception("Mode not defined on Query Params");
        }
        if($this->viewData["mode"] !== "INS") {
            if(isset($_GET['talla_zapatocod'])){
                $this->viewData["talla_zapatocod"] = intval($_GET["talla_zapatocod"]);
            } else {
                throw new Exception("Id not found on Query Params");
            }
        }
    }


    private function validatePostData(){
        if(isset($_POST["xssToken"])){
            if(isset($_SESSION["xssToken_Mnt_Talla_Zapato"])){
                if($_POST["xssToken"] !== $_SESSION["xssToken_Mnt_Talla"]){
                    throw new Exception("Invalid Xss Token no match");
                }
            } else {
                throw new Exception("Invalid Xss Token on Session");
            }
        } else {
            throw new Exception("Invalid Xss Token");
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
        if(isset($_POST["talla_zapatocod"])){
            if(($this->viewData["mode"] !== "INS" && intval($_POST["talla_zapatocod"])<=0)){
                throw new Exception("talla_zapatocod is not Valid");
            }
            if($this->viewData["talla_zapatocod"]!== intval($_POST["talla_zapatocod"])){
                throw new Exception("talla_zapatocod value is different from query");
            }
        }else {
            throw new Exception("talla_zapatocod not present in form");
        }
        if($this->viewData["mode"]!=="DEL"){
            $this->viewData["zapatocod"] = $_POST["zapatocod"];
            $this->viewData["stock"] = $_POST["stock"];
            $this->viewData["tallacod"] = $_POST["tallacod"];
        }
    }
    private function executeAction(){
        switch($this->viewData["mode"]){
            case "INS":
                $inserted = \Dao\Mnt\Tallas_Zapatos::insert(
                $this->viewData["tallacod"] = $_POST["tallacod"],
                $this->viewData["zapatocod"] = $_POST["zapatocod"],
                $this->viewData["stock"] = $_POST["stock"]
                );
                if($inserted > 0){
                    \Utilities\Site::redirectToWithMsg(
                        $this->redirectTo,
                        "Talla de zapato Creada Exitosamente"
                    );
                }
                break;
            case "UPD":
                $updated = \Dao\Mnt\Tallas_Zapatos::update(
                $this->viewData["tallacod"] = $_POST["tallacod"],
                $this->viewData["zapatocod"] = $_POST["zapatocod"],
                $this->viewData["stock"] = $_POST["stock"],
                $this->viewData["talla_zapatocod"] = $_POST["talla_zapatocod"]
                );
                if($updated > 0){
                    \Utilities\Site::redirectToWithMsg(
                        $this->redirectTo,
                        "Talla de Zapato Actualizada Exitosamente"
                    );
                }
                break;
            case "DEL":
                $deleted = \Dao\Mnt\Tallas_Zapatos::delete(
                    $this->viewData["talla_zapatocod"]
                );
                if($deleted > 0){
                    \Utilities\Site::redirectToWithMsg(
                        $this->redirectTo,
                        "Talla de Zapato Eliminada Exitosamente"
                    );
                }
                break;
        }
    }
    private function render(){
        $xssToken = md5("TALLA_ZAPATO" . rand(0,4000) * rand(5000, 9999));
        $this->viewData["xssToken"] = $xssToken;
        $_SESSION["xssToken_Mnt_Talla_Zapato"] = $xssToken;

        if($this->viewData["mode"] === "INS") {
            $this->viewData["modedsc"] = $this->modes["INS"];
        } else {
            $tmpTallas_Zapatos = \Dao\Mnt\Tallas_Zapatos::findById($this->viewData["talla_zapatocod"]);
            if(!$tmpTallas_Zapatos){
                throw new Exception("Talla de zapato no existe en DB");
            }
            
            \Utilities\ArrUtils::mergeFullArrayTo($tmpTallas_Zapatos, $this->viewData);
            
            $this->viewData["modedsc"] = sprintf(
                $this->modes[$this->viewData["mode"]],
                $this->viewData["tallacod"],
                $this->viewData["zapatocod"],
                $this->viewData["stock"],
                $this->viewData["talla_zapatocod"]
            );
            
            if(in_array($this->viewData["mode"], array("DSP","DEL"))){
                $this->viewData["readonly"] = "readonly";
            }
            if($this->viewData["mode"] === "DSP") {
                $this->viewData["show_action"] = false;
            }
        }
        Renderer::render("mnt/talla_zapatos", $this->viewData);
    }
}

?>