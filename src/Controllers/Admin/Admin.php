<?php

/**
 * PHP Version 7.2
 *
 * @category Private
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers\Admin;

/**
 * Página Principal de Administradores
 *
 * @category Public
 * @package  Controllers/Admin
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Admin extends \Controllers\PrivateController
{
    /**
     * Constructor
     */
    public function __construct()
    {
        // $userInRole = \Utilities\Security::isInRol(
        //     \Utilities\Security::getUserId(),
        //     "ADMIN"
        // );
        parent::__construct();
    }
    /** 
     * Ejecuta el controlador
     */
    public function run() :void
    {
        $viewData = array();
        $userID = \Utilities\Security::getUserId();

        $viewData["menu_usuarios"] = \Utilities\Security::isAuthorized($userID, "Menu_MntUsuarios");
        $viewData["menu_roles"] = \Utilities\Security::isAuthorized($userID, "Menu_MntRoles");
        $viewData["menu_funciones"] = \Utilities\Security::isAuthorized($userID, "Menu_MntFunciones");
        $viewData["menu_rolesUsuarios"] = \Utilities\Security::isAuthorized($userID, "Menu_MntRolesUsuarios");
        $viewData["menu_funcionesRoles"] = \Utilities\Security::isAuthorized($userID, "Menu_MntFuncionesRoles");
        $viewData["menu_ventas"] = \Utilities\Security::isAuthorized($userID, "Menu_MntHistorialTransacciones");
        $viewData["menu_pedidos"] = \Utilities\Security::isAuthorized($userID, "Menu_MntPedidos");
        $viewData["menu_zapatos"] = \Utilities\Security::isAuthorized($userID, "Menu_MntZapatos");
        $viewData["menu_marcas"] = \Utilities\Security::isAuthorized($userID, "Menu_MntMarcas");
        $viewData["menu_tallas"] = \Utilities\Security::isAuthorized($userID, "Menu_MntTallas");
        $viewData["menu_depart"] = \Utilities\Security::isAuthorized($userID, "Menu_MntDepartamentos");

       
        \Views\Renderer::render("admin/admin", $viewData);
    }
}
?>
