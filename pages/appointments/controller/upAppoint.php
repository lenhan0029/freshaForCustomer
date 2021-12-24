<?php
	include_once("../../class/appointments.php");
	$app = new AppointmentModel();
?>
<span id="quantityUpApp" class="badge badge-light" style="float:left; margin-left:10px;">
<?php
	$list = $app->getUpAppByCusID($_SESSION['customer_id']);
	$quantity = sizeof($list);
	echo "$quantity";
?>
</span>  