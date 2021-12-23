<?php
include '../../connection.php';


class StoreModel extends Database {

    public function __construct() {
        parent::connect();
    }
    
    public function getAll() {
        $conn = parent::connect();
        $sql = "SELECT * FROM services";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            $data[]=$row;
        }
        return $data;
    }

    public function getPage($page, $sl=20) {
        $conn = parent::connect();
        $AllStore = count($this->getAll());
        $totalPage = ceil($AllStore/$sl);
        if ($page > $totalPage) {
            $page = $totalPage;
        }
        else if($page < 1) {
            $page = 1;
        }
        $start = ($page - 1) * $sl;
        $sql = "SELECT * FROM stores LIMIT $start, $sl";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)) {
            $data[] = $row;
        }
        return $data;
    }

    public function getStoreByType($page, $sl=20, $type_id) {
        $conn = parent::connect();
        $AllStore = count($this->getAll());
        $totalPage = ceil($AllStore/$sl);
        if ($page > $totalPage) {
            $page = $totalPage;
        }
        else if($page < 1) {
            $page = 1;
        }
        $start = ($page - 1) * $sl;
        $sql = "SELECT * FROM stores WHERE type_id='$type_id' LIMIT $start, $sl";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)) {
            $data[] = $row;
        }
        return $data;
    }

    public function getStoreByName($name){
        $conn = parent::connect();
        $sql = "SELECT * FROM stores WHERE name='$name'";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            $data[]=$row;
        }
        return $data;
    }
}