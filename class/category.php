<?php
include '../../connection.php';


class TypeModel extends Database {

    public function __construct() {
        parent::connect();
    }
    
    public function getAll() {
        $conn = parent::connect();
        $sql = "SELECT * FROM types";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            $data[]=$row;
        }
        return $data;
    }
}