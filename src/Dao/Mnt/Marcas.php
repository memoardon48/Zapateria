<?php
namespace Dao\Mnt;
use Dao\Table;
class Marcas extends Table{

    public static function insert(string $nombremarca): int
    {
        $sqlstr = "INSERT INTO marcas (nombremarca) values(:nombremarca);";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array("nombremarca"=>$nombremarca)
        );
        return $rowsInserted;
    }
    public static function update(
        string $nombremarca,
        int $marcacod
    ){
        $sqlstr = "UPDATE marcas set nombremarca = :nombremarca where marcacod=:marcacod;";
        $rowsUpdated = self::executeNonQuery(
            $sqlstr,
            array(
                "nombremarca" => $nombremarca,
                "marcacod" => $marcacod
            )
        );
        return $rowsUpdated;
    }
    public static function delete(int $marcacod){
        $sqlstr = "DELETE from marcas where marcacod=:marcacod;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "marcacod" => $marcacod
            )
        );
        return $rowsDeleted;
    }
    public static function findAll(){
        $sqlstr = "SELECT * from marcas;";
        return self::obtenerRegistros($sqlstr, array());
    }
    public static function findById(int $marcacod){
        $sqlstr = "SELECT * from marcas where marcacod = :marcacod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "marcacod"=> $marcacod
            )
        );
        return $row;
    }
}
