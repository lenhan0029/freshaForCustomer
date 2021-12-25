<?php
	include_once("../../class/appointments.php");
	$app = new AppointmentModel();
	$id = $_SESSION['customer_id'];
?>
<div>
	<h4 style="float:left"><b>Past appointments</b></h4>
    <span id="quantityUpApp" class="badge badge-light" style="margin-left:10px; border-radius:20px; font-size:16px">
		<?php
            $list = $app->getPastAppByCusID($id);
            $quantity = 0;
            if($list!=0)
                $quantity = sizeof($list);
            echo "$quantity";
        ?>
    </span>
</div>
<div id="pastAppContainer" class="appContainer">
	<?php
		if($list!=0){
			for($i=0;$i<sizeof($list);$i++){
				$detail = $app->getDetailByAppID($list[$i]['id']);
	?>
                <div id="<?php echo "upApp-$i"; ?>" class="appointment" onclick="highLight(this);">
                	<div>
                    	<div style="font-size:12px; float:left"><?php echo $list[$i]['start_time']; ?></div>
                        <div style="float:left; margin-left:10px">
                        	<?php
								switch($list[$i]['status']){
									case 0:
										echo '<span class="badge badge-danger">Cancelled</span>';
										break;
									case 1:
										echo '<span class="badge badge-primary">Confirmed</span>';
										break;
									case 2:
										echo '<span class="badge badge-warning">Inprogress</span>';
										break;
									case 3:
										echo '<span class="badge badge-success">Completed</span>';
										break;
								}
							?>
                        </div>
                    </div>
                    <div style="font-size:14px; clear:both"><b><?php echo $detail[0]['store'] ?></b></div>
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
<script>
	function highLight(app){
		var id=app.id.split('-');
		id=id[1];
		var list = document.getElementById("pastAppContainer").getElementsByClassName("appointment");
		var length = list.length;
		var i;
		for(i=0;i<length;i++){
			if(i==id){
				list.item(id).style.backgroundColor="white";
				list.item(id).style.boxShadow="5px 10px 10px #E1E1E1";
				continue;
			}
			list.item(i).style.backgroundColor="";
			list.item(i).style.boxShadow="";
		}
	}
</script>


