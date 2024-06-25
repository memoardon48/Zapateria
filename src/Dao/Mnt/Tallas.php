<?php
namespace Dao\Mnt;
use Dao\Table;
class Tallas extends Table{

    public static function insert(string $descripciontalla): int
    {
        $sqlstr = "INSERT INTO tallas (descripciontalla) values(:descripciontalla);";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array("descripciontalla"=>$descripciontalla)
        );
        return $rowsInserted;
    }
    public static function update(
        string $descripciontalla,
        int $tallacod
    ){
        $sqlstr = "UPDATE tallas set descripciontalla = :descripciontalla where tallacod=:tallacod;";
        $rowsUpdated = self::executeNonQuery(
            $sqlstr,
            array(
                "descripciontalla" => $descripciontalla,
                "tallacod" => $tallacod
            )
        );
        return $rowsUpdated;
    }
    public static function delete(int $tallacod){
        $sqlstr = "DELETE from tallas where tallacod=:tallacod;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "tallacod" => $tallacod
            )
        );
        return $rowsDeleted;
    }
    public static function findAll(){
        $sqlstr = "SELECT * from tallas;";
        return self::obtenerRegistros($sqlstr, array());
    }
    public static function findByFilter(){

    }
    public static function findById(int $tallacod){
        $sqlstr = "SELECT * from tallas where tallacod = :tallacod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "tallacod"=> $tallacod
            )
        );
        return $row;
    }
}
