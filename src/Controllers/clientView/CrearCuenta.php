<?php

namespace Controllers\clientView;

use Controllers\PublicController;
use Views\Renderer;


class CrearCuenta extends PublicController {
    public function run() :void
    {
        $viewData = array();        
        Renderer::render('clientView/crearcuenta', $viewData);
    }
}
?>