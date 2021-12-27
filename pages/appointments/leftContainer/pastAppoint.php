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
                <a class="test" href="#" style="color:black; text-decoration:none">
                    <div id="<?php echo "pastApp-" . $list[$i]['id']; ?>" class="appointment" onclick="appointment_data(this); highLight(this);">
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
                </a>
    <?php
			}
		}
	?>
</div>
<script src="./scripts.js"></script>


