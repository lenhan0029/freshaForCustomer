<?php
	include_once("../../class/appointments.php");
	$app = new AppointmentModel();
	$id = $_SESSION['customer_id'];
?>
<div>
	<h4 style="float:left"><b>Upcoming appointments</b></h4>
    <span id="quantityUpApp" class="badge badge-light" style="margin-left:10px; border-radius:20px; font-size:16px">
		<?php
            $list = $app->getUpAppByCusID($id);
            $quantity = 0;
            if($list!=0)
                $quantity = sizeof($list);
            echo "$quantity";
        ?>
    </span>
</div>
<div class="upAppContainer">
	<?php
		if($list!=0){
			for($i=0;$i<sizeof($list);$i++){
				$detail = $app->getDetailByAppID($list[$i]['id']);
	?>
                <div class="upAppoint">
                    <div style="font-size:12px"><?php echo $list[$i]['start_time']; ?></div>
                    <div style="font-size:14px"><b><?php echo $detail[0]['store'] ?></b></div>
                    <div style="font-size:14px">
                    	<?php
							$service='';
							for($j=0;$j<sizeof($detail);$j++){
								$service.=$detail[$j]['service'];
								if($j+1<sizeof($detail))
									$service.=', ';
							}
							echo $service;
						?>
                    </div>
                </div>
    <?php
			}
		}
	?>
</div> 


