<?php
namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class Journals extends PrivateController {
    public function run() :void
    {
        $viewData = array(
            "journals_view"=>$this->isFeatureAutorized('mnt_journals_view'),
            "journals_edit"=>$this->isFeatureAutorized('mnt_journals_edit'),
            "journals_delete"=>$this->isFeatureAutorized('mnt_journals_delete'),
            "journals_new"=>$this->isFeatureAutorized('mnt_journals_new')

        );
        $viewData["journals"] = \Dao\Mnt\Journals::findAll();
        Renderer::render('mnt/journals', $viewData);
    }
}
?>