<?php
namespace Dao\Mnt;
use Dao\Table;
class Ventas extends Table{

    public static function insert(int $usercod, float $isv, float $cantidadBruta, float $comisionPayPal, float $cantidadNeta, float $amount ): int
    {
        $sqlstr = "INSERT INTO `ventas`
        (
        `usercod`,
        `isv`,
        `cantidadBruta`,
        `comisionPayPal`,
        `cantidadNeta`,
        `amount`)
        VALUES
        (
        :usercod,        
        :isv,
        :cantidadBruta,
        :comisionPayPal,
        :cantidadNeta,
        :amount);
        ";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array("usercod"=>$usercod, "isv"=>$isv, "cantidadBruta"=> $cantidadBruta, "comisionPayPal"=>$comisionPayPal, "cantidadNeta"=> $cantidadNeta, "amount"=> $amount)
        );
        return $rowsInserted;
    }
   
    public static function findAll(){
        $sqlstr = "SELECT * from ventas;";
        return self::obtenerRegistros($sqlstr, array());
    }

    public static function findById(int $ventacod){
        $sqlstr = "SELECT * from ventas where ventacod = :ventacod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "ventacod"=> $ventacod
            )
        );
        return $row;
    }

    public static function findByUser(int $usercod){
        $sqlstr = "SELECT * from ventas where usercod = :usercod;";
        $row = self::obtenerRegistros(
            $sqlstr,
            array(
                "usercod"=> $usercod
            )
        );
        return $row;
    }

    public static function findLastSellId(int $usercod){
        $sqlstr = "SELECT MAX(ventacod) as codigo  from ventas where usercod = :usercod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "usercod"=> $usercod
            )
        );
        return $row;
    }

    public static function findEarnings(){
        $sqlstr = "SELECT round(SUM(cantidadNeta),2) ganancias FROM ventas;;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array()
        );
        return $row;
    }

    public static function findNumVentas(){
        $sqlstr = "SELECT COUNT(ventacod) numVentas FROM ventas;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array()
        );
        return $row;
    }
}
