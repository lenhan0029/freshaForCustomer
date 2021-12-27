// JavaScript Document
function highLight(app){
	var id=app.id.split('-');
	if(id[0]=='pastApp'){
		var listUp = document.getElementById("upAppContainer").getElementsByClassName("appointment");
		var lengthUp = listUp.length;
		var i;
		for(i=0;i<lengthUp;i++){
			listUp.item(i).style.backgroundColor="";
			listUp.item(i).style.boxShadow="";
		}
		var listPast = document.getElementById("pastAppContainer").getElementsByClassName("appointment");
		var lengthPast = listPast.length;
		id=id[1];
		for(i=0;i<lengthPast;i++){
			var idItem = listPast.item(i).id;
			idItem=idItem.split('-');
			idItem=idItem[1];
			if(idItem==id){
				listPast.item(i).style.backgroundColor="white";
				listPast.item(i).style.boxShadow="5px 10px 10px #E1E1E1";
				continue;
			}
			listPast.item(i).style.backgroundColor="";
			listPast.item(i).style.boxShadow="";
		}
	}
	else{
		var listPast = document.getElementById("pastAppContainer").getElementsByClassName("appointment");
		var lengthPast = listPast.length;
		var i;
		for(i=0;i<lengthPast;i++){
			listPast.item(i).style.backgroundColor="";
			listPast.item(i).style.boxShadow="";
		}
		var listUp = document.getElementById("upAppContainer").getElementsByClassName("appointment");
		var lengthUp = listUp.length;
		id=id[1];
		for(i=0;i<lengthUp;i++){
			var idItem = listUp.item(i).id;
			idItem=idItem.split('-');
			idItem=idItem[1];
			if(idItem==id){
				listUp.item(i).style.backgroundColor="white";
				listUp.item(i).style.boxShadow="5px 10px 10px #E1E1E1";
				continue;
			}
			listUp.item(i).style.backgroundColor="";
			listUp.item(i).style.boxShadow="";
		}
	}
}

function appointment_data(app){
	var id = app.id;
	id = id.split('-');
	id = id[1];
	var action = 'contentWrapper.php';
	$.ajax({
		url:"contentWrapper.php",
		method:"POST",
		data:{action:action, id:id},
		success:function(data){
			$('#contentWrapper').html(data);
		}
	});
}

var listUpApp = document.getElementById("upAppContainer").getElementsByClassName("appointment");
var firstApp = listUpApp.item(0);
if(firstApp!=null)
	firstApp.onclick();
else{
	var listPastApp = document.getElementById("pastAppContainer").getElementsByClassName("appointment");
	firstApp = listPastApp.item(0).onclick();
}