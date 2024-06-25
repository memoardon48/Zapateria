<?php
namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class Tallas_Zapatos extends PrivateController {
    public function run() :void
    {
        $viewData = array(
            "tallas_zapatos_view"=>$this->isFeatureAutorized('mnt_tallas_zapatos_view'),
            "tallas_zaptos_edit"=>$this->isFeatureAutorized('mnt_tallas_zapatos_edit'),
            "tallas_zapatos_delete"=>$this->isFeatureAutorized('mnt_tallas_zapatos_delete'),
            "tallas_zaptos_new"=>$this->isFeatureAutorized('mnt_tallas_zapatos_new')

        );
        $viewData["tallas_zapatos"] = \Dao\Mnt\Tallas::findAll();
        Renderer::render('mnt/tallas_zapatos', $viewData);
    }
}
?>