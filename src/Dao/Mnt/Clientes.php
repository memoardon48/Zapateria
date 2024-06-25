<?php
namespace Dao\Mnt;

use Dao\Table;
/*
clientcod bigint AI PK 
clientname varchar(128) 
clientgender char(3) 
clientphone1 varchar(255) 
clientemail varchar(255) 
clientstatus char(3) 
clientdatecrt datetime 
clientusercreates bigint
 */

class Clientes extends Table{
    
    public static function insert(string $clientname, string $clientgender, string $clientphone1, string $clientemail, string $clientstatus, int $clientusercreates): int
    {
        $date = new \DateTime("now");
        $clientdatecrt = $date->format(\DateTimeInterface::W3C);
        $sqlstr = "INSERT INTO `clientes`
        (
        `clientname`,
        `clientgender`,
        `clientphone1`,
        `clientemail`,
        `clientstatus`,
        `clientdatecrt`,
        `clientusercreates`)
        VALUES
        (
        :clientname ,
        :clientgender ,
        :clientphone1 ,
        :clientemail ,
        :clientstatus ,
        :clientdatecrt ,
        :clientusercreates );
        ";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array("clientname"=>$clientname, "clientgender"=>$clientgender, "clientphone1" => $clientphone1, "clientemail" => $clientemail, "clientstatus" => $clientstatus, "clientdatecrt" => $clientdatecrt, "clientusercreates" => $clientusercreates)
        );
        return $rowsInserted;
    }
    public static function update(
        string $clientname,
        string $clientgender,
        string $clientphone1,
        string $clientemail,
        string $clientstatus,
        int $clientusercreates,
        int $clientcod
    ){
        $sqlstr = "UPDATE `clientes`
        SET
        
        `clientname` = :clientname,
        `clientgender` = :clientgender,
        `clientphone1` = :clientphone1,
        `clientemail` = :clientemail,
        `clientstatus` = :clientstatus,
        `clientusercreates` = :clientusercreates
        WHERE `clientcod` = :clientcod;
        ";
        $rowsUpdated = self::executeNonQuery(
            $sqlstr,
            array(
                "clientcod" => $clientcod,
                "clientusercreates" => $clientusercreates,
                "clientstatus" => $clientstatus,
                "clientemail" => $clientemail,
                "clientphone1" => $clientphone1,
                "clientgender" => $clientgender,
                "clientname" => $clientname
            )
        );
        return $rowsUpdated;
    }
    public static function delete(int $clientcod){
        $sqlstr = "DELETE from clientes where clientcod=:clientcod;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "clientcod" => $clientcod
            )
        );
        return $rowsDeleted;
    }
    public static function findAll(){
        $sqlstr = "SELECT * from clientes;";
        return self::obtenerRegistros($sqlstr, array());
    }
    public static function findByFilter(){

    }
    public static function findById(int $clientcod){
        $sqlstr = "SELECT * from clientes where clientcod = :clientcod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "clientcod"=> $clientcod
            )
        );
        return $row;
    }

    public static function findByUserId(int $clientcod){
        $sqlstr = "SELECT * from clientes where clientusercreates = :clientusercreates;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "clientusercreates"=> $clientcod
            )
        );
        return $row;
    }
}
