<?php
namespace Dao\Mnt;

use Dao\Table;
/*`usercod` bigint(10) NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
*/
class Usuarios extends Table{
    
    public static function insert(string $useremail, string $username, string $userpswd, string $userpswdest, string $userest, string $usertipo): int
    {
        $date = new \DateTime("now");
        $userfching = $date->format(\DateTimeInterface::W3C);
        $date2 =  date_add($date, date_interval_create_from_date_string("30 days"));
        $userpswdexp = $date2->format(\DateTimeInterface::W3C);
        $sqlstr = "INSERT INTO usuario (useremail, username, userpswd, userfching, userpswdest, userpswdexp, userest, usertipo) values(:useremail, :username, :userpswd, :userfching, :userpswdest, :userpswdexp, :userest, :usertipo);";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array("useremail"=>$useremail, "username"=>$username, "userpswd"=>$userpswd, "userfching" => $userfching, "userpswdest"=>$userpswdest, "userpswdexp" => $userpswdexp, "userest"=>$userest, "usertipo" => $usertipo)
        );
        return $rowsInserted;
    }
    public static function update(int $usercod, string $useremail, string $username, string $userpswd, string $userpswdest, string $userest, string $usertipo){
        $sqlstr = "UPDATE usuario set useremail = :useremail, username = :username, userpswd = :userpswd, userpswdest = :userpswdest, userest = :userest, usertipo = :usertipo where usercod=:usercod;";
        $rowsUpdated = self::executeNonQuery(
            $sqlstr,
            array("usercod" => $usercod,"useremail"=>$useremail, "username"=>$username, "userpswd"=>$userpswd, "userpswdest"=>$userpswdest, "userest"=>$userest, "usertipo" => $usertipo)

        );
        return $rowsUpdated;
    }
    public static function delete(int $usercod){
        $sqlstr = "DELETE from usuario where usercod=:usercod;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "usercod" => $usercod
            )
        );
        return $rowsDeleted;
    }
    public static function findAll(){
        $sqlstr = "SELECT * from usuario;";
        return self::obtenerRegistros($sqlstr, array());
    }
    public static function findByFilter(){

    }

    public static function findLast(){
        $sqlstr = "SELECT usercod FROM shoesnw.usuario  order by usercod desc LIMIT 1 ;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array()
        );
        return $row;
    }

    public static function findById(int $usercod){
        $sqlstr = "SELECT * from usuario where usercod = :usercod;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "usercod"=> $usercod
            )
        );
        return $row;
    }
}