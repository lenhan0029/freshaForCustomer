<?php
	session_start();
?>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<div style="width:100%; padding:0; margin:0">
	<?php
		include_once("../../class/appointments.php");
		$app = new AppointmentModel();
		$list = $app->getListByCustomerID($_SESSION['customer_id']);
		if(sizeof($list)>0)
			include_once("haveAppoint.php");
		else
			include_once("noAppoint.php");
	?>
</div>



