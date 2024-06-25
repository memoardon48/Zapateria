<?php

namespace Controllers\clientView;

use Controllers\PublicController;
use Views\Renderer;


class DetalleOrden extends PublicController {
   
    public function run() :void
    {
        $viewData = array();        
        Renderer::render('clientView/detalleorden', $viewData);
    }
}
?>