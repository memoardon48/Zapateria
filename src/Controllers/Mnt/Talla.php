<?php
namespace Controllers\Mnt;
use Controllers\PrivateController;
use Exception;
use Views\Renderer;

class Talla extends PrivateController{
    private $redirectTo = "index.php?page=Mnt-Tallas";
    private $viewData = array(
        "mode" => "DSP",
        "modedsc" => "",
        "tallacod" => 0,
        "descripciontalla" => "",
        "descripciontalla_error"=> "",
        "general_errors"=> array(),
        "has_errors" =>false,
        "show_action" => true,
        "readonly" => false,
        "xssToken" =>""
    );
    private $modes = array(
        "DSP" => "Detalle de %s (%s)",
        "INS" => "Nueva Talla",
        "UPD" => "Editar %s (%s)",
        "DEL" => "Borrar %s (%s)"
    );

    private $modesAuth = array(
        "DSP" => "mnt_tallas_view",
        "INS" => "mnt_tallas_new",
        "UPD" => "mnt_tallas_edit",
        "DEL" => "mnt_tallas_delete"
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
            unset($_SESSION["xssToken_Mnt_Talla"]);
            error_log(sprintf("Controller/Mnt/Talla ERROR: %s", $error->getMessage()));
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
            if(isset($_GET['tallacod'])){
                $this->viewData["tallacod"] = intval($_GET["tallacod"]);
            } else {
                throw new Exception("Id not found on Query Params");
            }
        }
    }


    private function validatePostData(){
        if(isset($_POST["xssToken"])){
            if(isset($_SESSION["xssToken_Mnt_Talla"])){
                if($_POST["xssToken"] !== $_SESSION["xssToken_Mnt_Talla"]){
                    throw new Exception("Invalid Xss Token no match");
                }
            } else {
                throw new Exception("Invalid Xss Token on Session");
            }
        } else {
            throw new Exception("Invalid Xss Token");
        }
        if(isset($_POST["descripciontalla"])){
            if(\Utilities\Validators::IsEmpty($_POST["descripciontalla"])){
                $this->viewData["has_errors"] = true;
                $this->viewData["descripciontalla_error"] = "El nombre no puede ir vacío!";
            }
        } else {
            throw new Exception("descripciontalla not present in form");
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
        if(isset($_POST["tallacod"])){
            if(($this->viewData["mode"] !== "INS" && intval($_POST["tallacod"])<=0)){
                throw new Exception("tallacod is not Valid");
            }
            if($this->viewData["tallacod"]!== intval($_POST["tallacod"])){
                throw new Exception("tallacod value is different from query");
            }
        }else {
            throw new Exception("tallacod not present in form");
        }
        $this->viewData["descripciontalla"] = $_POST["descripciontalla"];
        if($this->viewData["mode"]!=="DEL"){
            $this->viewData["descripciontalla"] = $_POST["descripciontalla"];
        }
    }
    private function executeAction(){
        switch($this->viewData["mode"]){
            case "INS":
                $inserted = \Dao\Mnt\Tallas::insert(
                    $this->viewData["descripciontalla"]
                );
                if($inserted > 0){
                    \Utilities\Site::redirectToWithMsg(
                        $this->redirectTo,
                        "Talla Creada Exitosamente"
                    );
                }
                break;
            case "UPD":
                $updated = \Dao\Mnt\Tallas::update(
                    $this->viewData["descripciontalla"],
                    $this->viewData["tallacod"]
                );
                if($updated > 0){
                    \Utilities\Site::redirectToWithMsg(
                        $this->redirectTo,
                        "Talla Actualizada Exitosamente"
                    );
                }
                break;
            case "DEL":
                $deleted = \Dao\Mnt\Tallas::delete(
                    $this->viewData["tallacod"]
                );
                if($deleted > 0){
                    \Utilities\Site::redirectToWithMsg(
                        $this->redirectTo,
                        "Talla Eliminada Exitosamente"
                    );
                }
                break;
        }
    }
    private function render(){
        $xssToken = md5("TALLA" . rand(0,4000) * rand(5000, 9999));
        $this->viewData["xssToken"] = $xssToken;
        $_SESSION["xssToken_Mnt_Talla"] = $xssToken;

        if($this->viewData["mode"] === "INS") {
            $this->viewData["modedsc"] = $this->modes["INS"];
        } else {
            $tmpTallas = \Dao\Mnt\Tallas::findById($this->viewData["tallacod"]);
            if(!$tmpTallas){
                throw new Exception("Talla no existe en DB");
            }
            
            \Utilities\ArrUtils::mergeFullArrayTo($tmpTallas, $this->viewData);
            
            $this->viewData["modedsc"] = sprintf(
                $this->modes[$this->viewData["mode"]],
                $this->viewData["descripciontalla"],
                $this->viewData["tallacod"]
            );
            
            if(in_array($this->viewData["mode"], array("DSP","DEL"))){
                $this->viewData["readonly"] = "readonly";
            }
            if($this->viewData["mode"] === "DSP") {
                $this->viewData["show_action"] = false;
            }
        }
        Renderer::render("mnt/talla", $this->viewData);
    }
}

?>