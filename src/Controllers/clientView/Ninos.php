<?php

namespace Controllers\clientView;

use Controllers\PublicController;
use Views\Renderer;


class Ninos extends PublicController {
   
    private $viewData = array();  
    public function run() :void
    {
        $this->page_loaded();
        \Dao\Cart\Catalogo::quitarDeCarretilla();
        \Dao\Cart\Catalogo::quitarDeCarretillaAnon();  
        $this->viewData["cantidad"] = count($this->viewData["ninos"]);
        $this->viewData["marcas"] = \Dao\Mnt\Marcas::findAll();      
        Renderer::render('clientView/ninos',  $this->viewData);
    }

     private function page_loaded()
    {
        if (isset($_GET['marcacod'])) {
            $this->viewData["ninos"] = \Dao\Mnt\Zapatos::findByBrand($_GET['marcacod'],3);
        }else if(isset($_GET['nombre'])){
            $this->viewData["ninos"] = \Dao\Mnt\Zapatos::findByName($_GET['nombre'],3);
        }
         else {
            $this->viewData["ninos"] = \Dao\Mnt\Zapatos::findByDepartment(3);
        }


    }


}
?>