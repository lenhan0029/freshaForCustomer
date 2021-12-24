<?php
include '../../connection.php';


class AppointmentModel extends Database {

    public function __construct() {
        parent::connect();
    }

    public function getAll() {
        $conn = parent::connect();
        $sql = "SELECT * FROM appointments";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            $data[]=$row;
        }
        return $data;
    }

    public function getListByCustomerID($cusid){
        $conn = parent::connect();
        $sql = "SELECT * FROM appointments WHERE customer_id='$cusid'";
        $result = mysqli_query($conn,$sql);
        while($row = mysqli_fetch_array($result)){
           $data[] = $row;
        }
        return $data;
    }
    
	public function getUpAppByCusID($cusid){
		$conn = parent::connect();
        $sql = "SELECT * FROM appointments WHERE customer_id='$cusid' AND status IN (1,2)";
        $result = mysqli_query($conn,$sql);
        while($row = mysqli_fetch_array($result)){
           $data[] = $row;
        }
        return $data;
	}
}