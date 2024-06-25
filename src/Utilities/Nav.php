<?php

namespace Utilities;

class Nav {

    public static function setNavContext(){
        $tmpNAVIGATION = array();
        $tmpNAVIGATION2 = array();
        $tmpNAVIGATION3 = array();
        $userID = \Utilities\Security::getUserId();
        if (\Utilities\Security::isAuthorized($userID, "Menu_MntUsuarios")) {
            $tmpNAVIGATION2[] = array(
                "nav_url" => "index.php?page=mnt_usuarios",
                "nav_label" => "Usuarios"
            );
        }
        

        if (\Utilities\Security::isAuthorized($userID, "Menu_PaymentCheckout")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=Checkout_Checkout",
                "nav_label" => "Pagar"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntRoles")) {
            $tmpNAVIGATION2[] = array(
                "nav_url" => "index.php?page=mnt_roles",
                "nav_label" => "Roles"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntFunciones")) {
            $tmpNAVIGATION2[] = array(
                "nav_url" => "index.php?page=mnt_funciones",
                "nav_label" => "Funciones"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntRolesUsuarios")) {
            $tmpNAVIGATION2[] = array(
                "nav_url" => "index.php?page=mnt_rolesUsuarios",
                "nav_label" => "Roles para Usuarios"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntFuncionesRoles")) {
            $tmpNAVIGATION2[] = array(
                "nav_url" => "index.php?page=mnt_funcionesroles",
                "nav_label" => "Funciones para roles"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntHistorialTransacciones")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_ventas",
                "nav_label" => "Historial Transacciones"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntPedidos")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_pedidos",
                "nav_label" => "Pedidos"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntZapatos")) {
            $tmpNAVIGATION3[] = array(
                "nav_url" => "index.php?page=mnt_zapatos",
                "nav_label" => "Zapatos"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntMarcas")) {
            $tmpNAVIGATION3[] = array(
                "nav_url" => "index.php?page=mnt_marcas",
                "nav_label" => "Marcas"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntTallas")) {
            $tmpNAVIGATION3[] = array(
                "nav_url" => "index.php?page=mnt_tallas",
                "nav_label" => "Tallas"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_MntDepartamentos")) {
            $tmpNAVIGATION3[] = array(
                "nav_url" => "index.php?page=mnt_departamentos",
                "nav_label" => "Departamentos"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Menu_Perfil")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=Checkout_Checkout",
                "nav_label" => "Pagar"
            );
        }
        \Utilities\Context::setContext("NAVIGATION", $tmpNAVIGATION);
        \Utilities\Context::setContext("NAVIGATION2", $tmpNAVIGATION2);
        \Utilities\Context::setContext("NAVIGATION3", $tmpNAVIGATION3);
    }


    private function __construct()
    {
        
    }
    private function __clone()
    {
        
    }
}
?>
