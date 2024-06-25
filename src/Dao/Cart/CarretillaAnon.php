<?php
namespace Dao\Cart;

use Dao\Table;

class CarretillaAnon extends Table{
    
    public static function insert(string $anoncod, int $talla_zapatocod, int $crrctd, float $crrprc): int
    {
        $date = new \DateTime("now");
        $crrfching = $date->format(\DateTimeInterface::W3C);
        $sqlstr = "INSERT INTO `carretillaanon`
        (`anoncod`,
        `talla_zapatocod`,
        `crrctd`,
        `crrprc`,
        `crrfching`)
        VALUES
        (:anoncod,
        :talla_zapatocod,
        :crrctd,
        :crrprc,
        :crrfching);
        ";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array("anoncod"=>$anoncod, "talla_zapatocod"=>$talla_zapatocod, "crrctd"=>$crrctd, "crrprc"=>$crrprc, "crrfching" => $crrfching)
        );
        return $rowsInserted;
    }    
    
    public static function delete(string $anoncod, int $talla_zapatocod){
        $sqlstr = "DELETE from carretillaanon where anoncod =:anoncod AND talla_zapatocod = :talla_zapatocod;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "talla_zapatocod" => $talla_zapatocod,
                "anoncod" => $anoncod
            )
        );
        return $rowsDeleted;
    }

    public static function deleteAllByUser(string $anoncod){
        $sqlstr = "DELETE from carretillaanon where anoncod =:anoncod;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "anoncod" => $anoncod
            )
        );
        return $rowsDeleted;
    }
    public static function findAll(){
        $sqlstr = "SELECT anoncod, tz.talla_zapatocod, tz.tallacod, crrctd, crrprc, z.imagenzapato, z.color, z.nombrezapato, descripciontalla, (crrctd * crrprc) as  subt from carretillaanon c INNER JOIN tallas_zapatos tz ON c.talla_zapatocod = tz.talla_zapatocod INNER JOIN zapatos z ON tz.zapatocod = z.zapatocod INNER JOIN tallas t ON t.tallacod = tz.tallacod;";
        return self::obtenerRegistros($sqlstr, array());
    }
    
    public static function findByUser(string $anoncod){
        $sqlstr = "SELECT anoncod, tz.talla_zapatocod, tz.tallacod, crrctd, crrprc, z.imagenzapato, z.color, z.nombrezapato, descripciontalla, (crrctd * crrprc) as  subt from carretillaanon c INNER JOIN tallas_zapatos tz ON c.talla_zapatocod = tz.talla_zapatocod INNER JOIN zapatos z ON tz.zapatocod = z.zapatocod INNER JOIN tallas t ON t.tallacod = tz.tallacod WHERE anoncod = :anoncod;";
        $row = self::obtenerRegistros(
            $sqlstr,
            array(
                "anoncod" => $anoncod
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
    
    public static function comprobarProductoEncarretillaanon(string $anoncod, int $talla_zapatocod)
    {
        $sqlstr = "SELECT * FROM carretillaanon WHERE anoncod = :anoncod AND talla_zapatocod = :talla_zapatocod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "talla_zapatocod"=> $talla_zapatocod,
                "anoncod" => $anoncod
            )
        );
        return $row;
    }

    public static function sumarCantidadEnCarritoAnonimo(string $anoncod, int $cantidad, int $talla_zapatocod){
        $sqlstr = "UPDATE carretillaanon SET crrctd = crrctd + :cantidad WHERE talla_zapatocod = :talla_zapatocod AND anoncod = :anoncod;";
        $row = self::executeNonQuery(
            $sqlstr,
            array(
                "talla_zapatocod"=> $talla_zapatocod,
                "cantidad" => $cantidad,
                "anoncod" => $anoncod
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

    public static function obtenerTotalcarretillaanon(string $anoncod)
    {
        $sqlstr = "select SUM(crrctd * crrprc) as amount FROM carretillaanon where anoncod = :anoncod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(                
                "anoncod" => $anoncod
            )
        );
        return $row;
    }

    public static function obtenerSumaProductosCarretilla(string $anoncod)
    {
        $sqlstr = "SELECT SUM(crrctd) as quantity FROM carretillaanon where anoncod = :anoncod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(                
                "anoncod" => $anoncod
            )
        );
        return $row;
    }

    public static function findAllByDeltaTime($delta){
        $sqlstr = "SELECT * FROM carretillaanon WHERE TIME_TO_SEC(TIMEDIFF(now(), crrfching)) > :delta;";
        return self::obtenerRegistros($sqlstr, array("delta" => $delta));
    }
}
