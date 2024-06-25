<?php
namespace Controllers\Sec;
use Exception;
class Login extends \Controllers\PublicController
{
    private $txtEmail = "";
    private $txtPswd = "";
    private $errorEmail = "";
    private $errorPswd = "";
    private $generalError = "";
    private $hasError = false;

    public function run() :void
    {
        if ($this->isPostBack()) {
            $this->txtEmail = $_POST["txtEmail"];
            $this->txtPswd = $_POST["txtPswd"];

            if (!\Utilities\Validators::IsValidEmail($this->txtEmail)) {
                $this->errorEmail = "¡Correo no tiene el formato adecuado!";
                $this->hasError = true;
            }
            if (\Utilities\Validators::IsEmpty($this->txtPswd)) {
                $this->errorPswd = "¡Debe ingresar una contraseña!";
                $this->hasError = true;
            }
            if (! $this->hasError) {
                if ($dbUser = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail)) {
                    if ($dbUser["userest"] != \Dao\Security\Estados::ACTIVO) {
                        $this->generalError = "¡Credenciales son incorrectas!";
                        $this->hasError = true;
                        error_log(
                            sprintf(
                                "ERROR: %d %s tiene cuenta con estado %s",
                                $dbUser["usercod"],
                                $dbUser["useremail"],
                                $dbUser["userest"]
                            )
                        );
                    }
                    if (!\Dao\Security\Security::verifyPassword($this->txtPswd, $dbUser["userpswd"])) {
                        $this->generalError = "¡Credenciales son incorrectas!";
                        $this->hasError = true;
                        error_log(
                            sprintf(
                                "ERROR: %d %s contraseña incorrecta",
                                $dbUser["usercod"],
                                $dbUser["useremail"]
                            )
                        );
                        // Aqui se debe establecer acciones segun la politica de la institucion.
                    }
                    if (! $this->hasError) {
                        \Utilities\Security::login(
                            $dbUser["usercod"],
                            $dbUser["username"],
                            $dbUser["useremail"],
                            $dbUser["usertipo"]
                        );
                        if (\Utilities\Context::getContextByKey("redirto") !== "") {
                            \Utilities\Site::redirectTo(
                                \Utilities\Context::getContextByKey("redirto")
                            );
                        } else {
                            try{
                                $this->pasarCarretillaAnonACarretilla();
                                \Utilities\Site::redirectTo("index.php");
                            }
                            catch (Exception $error){
                                \Utilities\Site::redirectToWithMsg("index.php", "Problemas con el carrito");

                            }
                            
                        }
                    }
                } else {
                    error_log(
                        sprintf(
                            "ERROR: %s trato de ingresar",
                            $this->txtEmail
                        )
                    );
                    $this->generalError = "¡Credenciales son incorrectas!";
                }
            }
        }
        $dataView = get_object_vars($this);
        \Views\Renderer::render("security/login", $dataView);
    }

    private function pasarCarretillaAnonACarretilla(){

        $userId = \Utilities\Security::getUserId();

        $productosCarroAnonimo = \Dao\Cart\CarretillaAnon::findByUser(session_id());

        if(!empty($productosCarroAnonimo)){
            error_log("mesnajeeeeeeeeeeee");
            foreach($productosCarroAnonimo as $producto){
                $verSiExiste = \Dao\Cart\Carretilla::comprobarProductoEnCarretilla($userId,$producto["talla_zapatocod"]);
                error_log($producto[$userId]);
                if(empty($verSiExiste)){                    
                    \Dao\Cart\Carretilla::insert($userId,$producto["talla_zapatocod"],$producto["crrctd"], $producto["crrprc"] );
                } else {
                    \Dao\Cart\Carretilla::sumarCantidadEnCarretilla($userId, $producto["crrctd"] ,$producto["talla_zapatocod"]);
                }
                
            }

            \Dao\Cart\CarretillaAnon::deleteAllByUser(session_id());
        }
    }

}
?>
