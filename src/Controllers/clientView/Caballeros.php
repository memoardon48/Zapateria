<?php

namespace Controllers\clientView;

use Controllers\PublicController;
use Views\Renderer;


class Caballeros extends PublicController {
   
    private $viewData = array();
    public function run() :void
    {
           
        $this->page_loaded();
        \Dao\Cart\Catalogo::quitarDeCarretilla();
        \Dao\Cart\Catalogo::quitarDeCarretillaAnon();  
        $this->viewData["cantidad"] = count($this->viewData["caballeros"]);
        $this->viewData["marcas"] = \Dao\Mnt\Marcas::findAll();  
        Renderer::render('clientView/caballeros', $this->viewData);
    }

    private function page_loaded()
    {
        if (isset($_GET['marcacod'])) {
            $this->viewData["caballeros"] = \Dao\Mnt\Zapatos::findByBrand($_GET['marcacod'],1);
        }else if(isset($_GET['nombre'])){
            $this->viewData["caballeros"] = \Dao\Mnt\Zapatos::findByName($_GET['nombre'],1);
        }
         else {
            $this->viewData["caballeros"] = \Dao\Mnt\Zapatos::findByDepartment(1);
        }


    }
}
?>