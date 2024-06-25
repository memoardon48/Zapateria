<?php

namespace Controllers\clientView;

use Controllers\PublicController;
use Views\Renderer;


class Damas extends PublicController {
   
    private $viewData = array();
    public function run() :void
    {
           
        $this->page_loaded();
        \Dao\Cart\Catalogo::quitarDeCarretilla();
        \Dao\Cart\Catalogo::quitarDeCarretillaAnon();  
        $this->viewData["cantidad"] = count($this->viewData["damas"]);
        $this->viewData["marcas"] = \Dao\Mnt\Marcas::findAll();  
        Renderer::render('clientView/damas', $this->viewData);
    }

    private function page_loaded()
    {
        if (isset($_GET['marcacod'])) {
            $this->viewData["damas"] = \Dao\Mnt\Zapatos::findByBrand($_GET['marcacod'],2);
        }else if(isset($_GET['nombre'])){
            $this->viewData["damas"] = \Dao\Mnt\Zapatos::findByName($_GET['nombre'],2);
        }
         else {
            $this->viewData["damas"] = \Dao\Mnt\Zapatos::findByDepartment(2);
        }


    }
}
?>