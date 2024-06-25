<?php
namespace Dao\Mnt;
use Dao\Table;
class DetallesVentas extends Table{

    public static function insert(int $ventacod, int $talla_zapatocod, int $cantidad, float $precioUnit ): int
    {
        $sqlstr = "INSERT INTO `detalleventa`
        (
        `ventacod`,
        `talla_zapatocod`,
        `cantidad`,
        `precioUnit`)
        VALUES
        (
        :ventacod,
        :talla_zapatocod,
        :cantidad,
        :precioUnit);        
        ";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array("ventacod"=>$ventacod, "cantidad"=>$cantidad, "talla_zapatocod"=> $talla_zapatocod, "precioUnit"=>$precioUnit)
        );
        return $rowsInserted;
    }
   
    public static function findAll(){
        $sqlstr = "SELECT * from detalleventa;";
        return self::obtenerRegistros($sqlstr, array());
    }

    public static function findByVentaId(int $ventacod){
        $sqlstr = "SELECT tz.talla_zapatocod, cantidad, precioUnit, imagenzapato, color, descripciontalla, nombrezapato, (precioUnit * cantidad) as importe FROM detallEventa dv INNER JOIN tallas_zapatos tz ON dv.talla_zapatocod = tz.talla_zapatocod INNER JOIN zapatos z ON z.zapatocod = tz.zapatocod INNER JOIN tallas t ON t.tallacod = tz.tallacod WHERE ventacod = :ventacod;";
        $row = self::obtenerRegistros(
            $sqlstr,
            array(
                "ventacod"=> $ventacod
            )
        );
        return $row;
    }

    
}
