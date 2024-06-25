<?php
namespace Dao\Mnt;
use Dao\Table;

/*
talla_zapatocod bigint AI PK 
tallacod bigint 
zapatocod bigint 
stock */
class Tallas_Zapatos extends Table{

    public static function insert(string $descripciontalla): int
    {
        $sqlstr = "INSERT INTO tallas_zapatos (tallacod,zapatocod,stock) values(:tallacod, :zapatocod, :stock);";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array("tallacod"=>$tallacod, "zapatacod"=>$zapatocod, "stock"=>$stock)
        );
        return $rowsInserted;
    }
    public static function update(
        int $tallacod,
        int $zapatocod,
        int $stock,
        int $talla_zapatocod
    ){
        $sqlstr = "UPDATE tallas_zapatos set tallacod = :tallacod, zapatocod = :zapatocod, stock = stock where talla_zapatocod=:talla_zapatocod;";
        $rowsUpdated = self::executeNonQuery(
            $sqlstr,
            array(
                "tallacod" => $tallacod,
                "zapatocod" => $zapatocod,
                "stock" => $stock
            )
        );
        return $rowsUpdated;
    }
    public static function delete(int $tallacod){
        $sqlstr = "DELETE from tallas_zapato where talla_zapatocod=:talla_zapatocod;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "talla_zapatocod" => $talla_zapatocod
            )
        );
        return $rowsDeleted;
    }
    public static function findAll(){
        $sqlstr = "SELECT * from tallas_zapatos;";
        return self::obtenerRegistros($sqlstr, array());
    }
    public static function findByFilter(){

    }
    public static function findById(int $tallacod){
        $sqlstr = "SELECT * from tallas_zapatos where talla_zapatocod = :talla_zapatocod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "talla_zapatocod"=> $talla_zapatocod
            )
        );
        return $row;
    }
}