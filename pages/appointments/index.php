<?php
	session_start();
?>
<div style="width:100%; padding:0; margin:0">
	<?php
		$_SESSION['customer_id']=1;
		include_once("../../class/appointments.php");
		$app = new AppointmentModel();
		$list = $app->getListByCustomerID($_SESSION['customer_id']);
		if(sizeof($list)>0)
			include_once("haveAppoint.php");
		else
			include_once("noAppoint.php");
	?>
</div>



