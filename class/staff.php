<?php
include '../../connection.php';


class StaffModel extends Database {

    public function __construct() {
        parent::connect();
    }

    public function getAll() {
        $conn = parent::connect();
        $sql = "SELECT * FROM staffs";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            $data[]=$row;
        }
        return $data;
    }

    public function getStaffByStoreID($storeid){
        $conn = parent::connect();
        $sql = "SELECT * FROM staffs WHERE store_id='$storeid'";
        $result = mysqli_query($conn,$sql);
        while($row = mysqli_fetch_array($result)){
           $data[] = $row;
        }
        return $data;
    }
  
}