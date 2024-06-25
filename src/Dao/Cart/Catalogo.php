<?php

namespace Dao\Cart;

class Catalogo extends \Dao\Table {
    public static function getProductosDisponibles(){
        $sqlAllProductosActivos = "SELECT * from productos where estprd in ('ACT','DSC');";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array());

        //Sacar el stock de productos con carretilla autorizada
        $deltaAutorizada = \Utilities\Cart\CartFns::getAuthTimeDelta();
        $sqlCarretillaAutorizada = "select codprd, sum(crrctd) as reserved
            from carretilla where TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by codprd;";
        $prodsCarretillaAutorizada = self::obtenerRegistros(
            $sqlCarretillaAutorizada,
            array("delta"=>$deltaAutorizada)
        );
        //Sacar el stock de productos con carretilla no autorizada
        $deltaNAutorizada = \Utilities\Cart\CartFns::getUnAuthTimeDelta();
        $sqlCarretillaNAutorizada = "select codprd, sum(crrctd) as reserved
            from carretillaanom where TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by codprd;";
        $prodsCarretillaNAutorizada = self::obtenerRegistros(
            $sqlCarretillaNAutorizada,
            array("delta"=>$deltaNAutorizada)
        );
        $productosCurados = array();
        foreach ($productosDisponibles as $producto) {
            if(!isset($productosCurados[$producto["codprd"]])) {
                $productosCurados[$producto["codprd"]] = $producto;
            }
        }
        foreach($prodsCarretillaAutorizada as $producto){
            if(isset($productosCurados[$producto["codprd"]])){
                $productosCurados[$producto["codprd"]]["stkprd"] -= $producto["reserved"];
            }
        }
        foreach($prodsCarretillaNAutorizada as $producto){
            if(isset($productosCurados[$producto["codprd"]])){
                $productosCurados[$producto["codprd"]]["stkprd"] -= $producto["reserved"];
            }
        }
        $productosDisponibles = null;
        $prodsCarretillaAutorizada = null;
        $prodsCarretillaNAutorizada = null;
        return $productosCurados;

    }

    public static function getProductoDisponible($codprd){
        $sqlAllProductosActivos = "SELECT * from productos where estprd in ('ACT','DSC') and codprd=:codprd;";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array("codprd"=>$codprd));

        //Sacar el stock de productos con carretilla autorizada
        $deltaAutorizada = \Utilities\Cart\CartFns::getAuthTimeDelta();
        $sqlCarretillaAutorizada = "select codprd, sum(crrctd) as reserved
            from carretilla where codprd=:codprd and TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by codprd;";
        $prodsCarretillaAutorizada = self::obtenerRegistros(
            $sqlCarretillaAutorizada,
            array("codprd"=>$codprd, "delta"=>$deltaAutorizada)
        );
        //Sacar el stock de productos con carretilla no autorizada
        $deltaNAutorizada = \Utilities\Cart\CartFns::getUnAuthTimeDelta();
        $sqlCarretillaNAutorizada = "select codprd, sum(crrctd) as reserved
            from carretillaanom where codprd = :codprd and TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by codprd;";
        $prodsCarretillaNAutorizada = self::obtenerRegistros(
            $sqlCarretillaNAutorizada,
            array("codprd"=>$codprd, "delta"=>$deltaNAutorizada)
        );
        $productosCurados = array();
        foreach ($productosDisponibles as $producto) {
            if(!isset($productosCurados[$producto["codprd"]])) {
                $productosCurados[$producto["codprd"]] = $producto;
            }
        }
        foreach($prodsCarretillaAutorizada as $producto){
            if(isset($productosCurados[$producto["codprd"]])){
                $productosCurados[$producto["codprd"]]["stkprd"] -= $producto["reserved"];
            }
        }
        foreach($prodsCarretillaNAutorizada as $producto){
            if(isset($productosCurados[$producto["codprd"]])){
                $productosCurados[$producto["codprd"]]["stkprd"] -= $producto["reserved"];
            }
        }
        $productosDisponibles = null;
        $prodsCarretillaAutorizada = null;
        $prodsCarretillaNAutorizada = null;
        return $productosCurados;
    }

    public static function getProducto($codprd){
        $sqlAllProductosActivos = "SELECT * from productos where codprd=:codprd;";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array("codprd"=>$codprd));
        return $productosDisponibles;
    }

    public static function quitarDeCarretilla(){
        $deltaAutorizada = \Utilities\Cart\CartFns::getAuthTimeDelta();
        $productos = \Dao\Cart\Carretilla::findAllByDeltaTime($deltaAutorizada);

        foreach($productos as $item){
            \Dao\Cart\Carretilla::aumentarStock($item["crrctd"],$item["talla_zapatocod"]);
            \Dao\Cart\Carretilla::delete($item["usercod"], $item["talla_zapatocod"]);            
        }

    }

    public static function quitarDeCarretillaAnon(){
        $deltaAutorizada = \Utilities\Cart\CartFns::getUnAuthTimeDelta();
        $productos = \Dao\Cart\CarretillaAnon::findAllByDeltaTime($deltaAutorizada);

        foreach($productos as $item){
            \Dao\Cart\CarretillaAnon::aumentarStock($item["crrctd"],$item["talla_zapatocod"]);
            \Dao\Cart\CarretillaAnon::delete($item["anoncod"], $item["talla_zapatocod"]);
            
        }


    }

    
}
