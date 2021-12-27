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
	
	public function getAppByID($appid){
        $conn = parent::connect();
        $sql = "SELECT * FROM appointments WHERE id='$appid'";
        $result = mysqli_query($conn,$sql);
        while($row = mysqli_fetch_array($result)){
           $data[] = $row;
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
        $sql = "SELECT * FROM appointments WHERE customer_id='$cusid' AND CURRENT_TIMESTAMP < end_time AND status IN (1,2)";
        $result = mysqli_query($conn,$sql);
		if(mysqli_num_rows($result)==0)
			return 0;
        while($row = mysqli_fetch_array($result)){
           $data[] = $row;
        }
        return $data;
		
	}
	
	public function getPastAppByCusID($cusid){
		$conn = parent::connect();
        $sql = "SELECT * FROM appointments WHERE customer_id='$cusid' AND (CURRENT_TIMESTAMP > end_time OR status IN (0,3))";
        $result = mysqli_query($conn,$sql);
		if(mysqli_num_rows($result)==0)
			return 0;
        while($row = mysqli_fetch_array($result)){
           $data[] = $row;
        }
        return $data;
		
	}
	
	public function getDetailByAppID($id){
        $conn = parent::connect();
        $sql = "select st.name as 'store', se.name as 'service', se.price as 'price', sa.first_name as 'staff',st.address as 'address' from appointments am, appointment_detail ap, staffs sa, services se, stores st WHERE ap.appointment_id='$id' AND ap.service_id = se.id AND st.id = se.store_id AND am.id = ap.appointment_id AND am.staff_id=sa.id";
        $result = mysqli_query($conn,$sql);
        while($row = mysqli_fetch_array($result)){
           $data[] = $row;
        }
        return $data;
    }
}