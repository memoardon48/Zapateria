<?php
/**
 * Archivo Controlador de Marcas el Listado
 */
namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

/**
 * Marcas
 */
class Tallas extends PrivateController {
    public function run() :void
    {
        $viewData = array(
            "tallas_view"=>$this->isFeatureAutorized('mnt_tallas_view'),
            "tallas_edit"=>$this->isFeatureAutorized('mnt_tallas_edit'),
            "tallas_delete"=>$this->isFeatureAutorized('mnt_tallas_delete'),
            "tallas_new"=>$this->isFeatureAutorized('mnt_tallas_new')

        );
        $viewData["tallas"] = \Dao\Mnt\Tallas::findAll();
        Renderer::render('mnt/tallas', $viewData);
    }
}
?>