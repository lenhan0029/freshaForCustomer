<?php
	include_once('../../class/appointments.php');
	$app = new AppointmentModel();
	$appid = $_POST['id'];
	$infor = $app->getAppByID($appid);
	$detail = $app->getDetailByAppID($appid);
?>
<div id="inforStoreWrapper">	
    <div><h3><b>
		<?php 
			$date = $infor[0]['start_time'];
			$weekday =  date('l', strtotime($date));
			$day = date('d', strtotime($date));
			$month = date('F', strtotime($date));
			$year = date('Y', strtotime($date));
			$time = date('H:i', strtotime($date));
			echo "$weekday, $day $month $year at $time";
        ?>
    </b></h3></div>
    <div>
    	<?php
			switch($infor[0]['status']){
				case 0:
					echo '<span class="badge badge-danger" style="padding:7px 15px 7px 15px; border-radius:30px"><i class="fas fa-ban"></i> Cancelled</span>';
					break;
    			case 1:
					echo '<span class="badge badge-primary" style="padding:7px 15px 7px 15px; border-radius:30px"><i class="far fa-check-circle"></i> Confirmed</span>';
					break;
				case 2:
					echo '<span class="badge badge-warning" style="padding:7px 15px 7px 15px; border-radius:30px"><i class="far fa-clock"></i> Inprogress</span>';
					break;
				case 3:
					echo '<span class="badge badge-success" style="padding:7px 15px 7px 15px; border-radius:30px"><i class="far fa-check-circle"></i> Completed</span>';
					break;
			}
		?>
	</div>
    <div style="margin-top:20px">
        <div><b><?php echo $detail[0]['store'];?></b></div>
        <div><i class="fas fa-map-marker-alt"></i> <u><?php echo $detail[0]['address']; ?></u></div>
        <div style="font-size:14px; color:#CCC">Booking ref: <?php if(isset($_POST['id'])) echo $_POST['id']; ?></div>
    </div>
</div>