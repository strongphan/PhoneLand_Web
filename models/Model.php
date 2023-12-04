<?php
include_once("../../config/config.php");
class Model{
    public $conn;
    public function __construct(){
        $db = new db();
        $this->conn = $db->connect();
    }
}