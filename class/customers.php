<?php
include '../../connection.php';


class ServiceModel extends Database {

    public function __construct() {
        parent::connect();
    }
    
    public function getAll() {
        $conn = parent::connect();
        $sql = "SELECT * FROM customer";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            $data[]=$row;
        }
        return $data;
    }
    public function getInfoByID($cusid) {
        $conn = parent::connect();
        $sql = "SELECT * FROM customer WHERE customer_id='$cusid'";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            $data[]=$row;
        }
        return $data;
    }
}