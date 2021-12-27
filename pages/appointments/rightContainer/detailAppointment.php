<?php
	include_once('../../class/appointments.php');
	$app = new AppointmentModel();
	$appid = $_POST['id'];
	$infor = $app->getAppByID($appid);
	$detail = $app->getDetailByAppID($appid);
?>
<div id="detailAppWrapper">
	<div id="detailAppContainer">
    	<?php
			for($i=0;$i<sizeof($detail);$i++){
		?>
    	<div style="height:50px; margin-bottom:10px">
        	<div style="float:left">
            	<?php echo $detail[$i]['service']; ?> <br />
                With <?php echo $detail[$i]['staff']; ?>
            </div>
            <div style="float:right; line-height:50px"><?php echo $detail[$i]['price']; ?>$</div>
        </div>
        <?php
			}
		?>
        <hr />
        <div style="height:50px">
        	<div style="float:left">Total</div>
            <div style="float:right"><?php echo $infor[0]['total_price']; ?>$</div>
        </div>
    </div>
</div>