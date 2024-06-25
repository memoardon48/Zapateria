<?php
namespace Dao\Cart;

use Dao\Table;

class Carretilla extends Table{
    
    public static function insert(int $usercod, int $talla_zapatocod, int $crrctd, float $crrprc): int
    {
        $date = new \DateTime("now");
        $crrfching = $date->format(\DateTimeInterface::W3C);
        $sqlstr = "INSERT INTO `carretilla`
        (`usercod`,
        `talla_zapatocod`,
        `crrctd`,
        `crrprc`,
        `crrfching`)
        VALUES
        (:usercod,
        :talla_zapatocod,
        :crrctd,
        :crrprc,
        :crrfching);
        ";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array("usercod"=>$usercod, "talla_zapatocod"=>$talla_zapatocod, "crrctd"=>$crrctd, "crrprc"=>$crrprc, "crrfching" => $crrfching)
        );
        return $rowsInserted;
    }    
    
    public static function delete(int $usercod, int $talla_zapatocod){
        $sqlstr = "DELETE from carretilla where usercod =:usercod AND talla_zapatocod = :talla_zapatocod;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "talla_zapatocod" => $talla_zapatocod,
                "usercod" => $usercod
            )
        );
        return $rowsDeleted;
    }

    public static function deleteAllByUser(int $usercod){
        $sqlstr = "DELETE from carretilla where usercod =:usercod;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "usercod" => $usercod
            )
        );
        return $rowsDeleted;
    }

    public static function findAll(){
        $sqlstr = "SELECT usercod, tz.talla_zapatocod, tz.tallacod, crrctd, crrprc, z.imagenzapato, z.color, z.nombrezapato, descripciontalla, (crrctd * crrprc) as  subt from carretilla c INNER JOIN tallas_zapatos tz ON c.talla_zapatocod = tz.talla_zapatocod INNER JOIN zapatos z ON tz.zapatocod = z.zapatocod INNER JOIN tallas t ON t.tallacod = tz.tallacod;";
        return self::obtenerRegistros($sqlstr, array());
    }

    public static function findByUser(string $usercod){
        $sqlstr = "SELECT usercod, tz.talla_zapatocod, tz.tallacod, crrctd, crrprc, z.imagenzapato, z.color, z.nombrezapato, descripciontalla, nombredepartamento, (crrctd * crrprc) as  subt from carretilla c INNER JOIN tallas_zapatos tz ON c.talla_zapatocod = tz.talla_zapatocod INNER JOIN zapatos z ON tz.zapatocod = z.zapatocod INNER JOIN tallas t ON t.tallacod = tz.tallacod INNER JOIN departamentos d ON z.departamentocod = d.departamentocod WHERE usercod = :usercod;";
        $row = self::obtenerRegistros(
            $sqlstr,
            array(
                "usercod" => $usercod
            )
        );
        return $row;
    }
    
    public static function disiminuirStock(int $cantidad, int $talla_zapatocod)
    {
        $sqlstr = "UPDATE tallas_zapatos SET stock = stock - :cantidad WHERE talla_zapatocod = :talla_zapatocod;";
        $row = self::executeNonQuery(
            $sqlstr,
            array(
                "talla_zapatocod"=> $talla_zapatocod,
                "cantidad" => $cantidad
            )
        );
        return $row;
    }

    public static function aumentarStock(int $cantidad, int $talla_zapatocod)
    {
        $sqlstr = "UPDATE tallas_zapatos SET stock = stock + :cantidad WHERE talla_zapatocod = :talla_zapatocod;";
        $row = self::executeNonQuery(
            $sqlstr,
            array(
                "talla_zapatocod"=> $talla_zapatocod,
                "cantidad" => $cantidad
            )
        );
        return $row;
    }
    
    
    public static function comprobarProductoEnCarretilla($usercod, $talla_zapatocod)
    {
        $sqlstr = "SELECT * FROM carretilla WHERE usercod = :usercod AND talla_zapatocod = :talla_zapatocod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "talla_zapatocod"=> $talla_zapatocod,
                "usercod" => $usercod
            )
        );
        return $row;
    }

    public static function sumarCantidadEnCarretilla(int $usercod, int $cantidad, int $talla_zapatocod){
        $sqlstr = "UPDATE carretilla SET crrctd = crrctd + :cantidad WHERE talla_zapatocod = :talla_zapatocod AND usercod = :usercod;";
        $row = self::executeNonQuery(
            $sqlstr,
            array(
                "talla_zapatocod"=> $talla_zapatocod,
                "cantidad" => $cantidad,
                "usercod" => $usercod
            )
        );
        return $row;
    }

    public static function obtenerStockDisponible($talla_zapatocod){
        $sqlstr = "SELECT stock FROM tallas_zapatos WHERE talla_zapatocod = :talla_zapatocod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "talla_zapatocod"=> $talla_zapatocod
            )
        );
        return $row;
    }
    

    public static function obtenerTotalCarretilla($usercod)
    {
        $sqlstr = "select SUM(crrctd * crrprc) as amount FROM carretilla where usercod = :usercod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(                
                "usercod" => $usercod
            )
        );
        return $row;
    }

    public static function obtenerSumaProductosCarretilla($usercod)
    {
        $sqlstr = "SELECT SUM(crrctd) as quantity FROM carretilla where usercod = :usercod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(                
                "usercod" => $usercod
            )
        );
        return $row;
    }

    public static function findAllByDeltaTime($delta){
        $sqlstr = "SELECT * FROM carretilla WHERE TIME_TO_SEC(TIMEDIFF(now(), crrfching)) > :delta;";
        return self::obtenerRegistros($sqlstr, array("delta" => $delta));
    }


}
