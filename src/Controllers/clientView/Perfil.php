<?php

namespace Controllers\clientView;

use Controllers\PublicController;
use Views\Renderer;


class Perfil extends PublicController {
   
    public function run() :void
    {
        if(!\Utilities\Security::isLogged())
        {
            \Utilities\Site::redirectToWithMsg("index.php?page=sec_login", "Debe iniciar sesión para poder acceder a esta página");
        } else {
            $viewData = array(
                "clientname" => "",
                "clientgender" => "",
                "clientphone1" => "",
                "clientemail" => "",
                "ventas" => array()
    
    
            ); 
            $cod = \Utilities\Security::getUserId();
            $cliente = \Dao\Mnt\Clientes::findByUserId($cod);
            $viewData["ventas"] = \Dao\Mnt\Ventas::findByUser($cod);
            \Utilities\ArrUtils::mergeFullArrayTo($cliente, $viewData);
            
            Renderer::render('clientView/perfil', $viewData);
        }
        
    }
}
?>