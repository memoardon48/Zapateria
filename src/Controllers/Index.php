<?php
/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Index extends PublicController
{
    /**
     * Index run method
     *
     * @return void
     */
    public function run() :void
    {
        $viewData = array();
        $viewData["hombres"] = \Dao\Mnt\Zapatos::findTopByDepartment(1);
        $viewData["mujeres"] = \Dao\Mnt\Zapatos::findTopByDepartment(2);
        $viewData["ninos"] = \Dao\Mnt\Zapatos::findTopByDepartment(3);
        \Views\Renderer::render("index", $viewData);

    }
}
?>
