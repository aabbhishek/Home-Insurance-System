<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>
	<link href="css/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body style="overflow: hidden;" onload="chekDataOnLoad();">
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#26004c!important;">
  			 <a class="navbar-brand" href="#" style="color:#fff;">Home Insurance</a> 
	</nav>
	<section>
		<div class="side-info" style="width: 20%;height: 700px; background-color: #d8b2ff;box-shadow: 1px 2px 10px 1px #38343c;">
		<br>
		<center><p style="font-size:20px;"><b>Personal Information</b></p></center>
		<hr>
		
		<div style="padding-left:10px;">
		<p><b>Name :</b> <span ><%= session.getAttribute("fname") +" " +  session.getAttribute("lname")%></span></p>	
		<p><b>DOB :</b> <span ><%= session.getAttribute("dob") %></span></p>
		<p><b>Email id :</b> <span ><%= session.getAttribute("email") %></span></p>
		</div>
		
		<hr>		
		<center><p style="font-size:20px;"><b>Homeowner Details</b></p></center>
		<hr>
		
		<div style="padding-left:10px;" id="howner-details">
			<p><b>Name :</b> <span id="get-name" ></span></p>	
			<p><b>DOB :</b> <span id="get-dob" ></span></p>
			<p><b>Contact Number :</b> <span id="get-cont" ></span></p>
			<p><b>Location :</b> <span id="get-loca" ></span></p>
			<p><b>House Cost :</b>&nbsp;&nbsp;<input type="text" id="hcost" placeholder="In RS" style="background: transparent;border:none;border-bottom: 2px solid black;padding-left:10px;padding-right:10px;width:80px;"/>
			<p><b>BuilUP AREA :</b>&nbsp;&nbsp;<input type="text" id="b_Area" placeholder="In Sq Ft" style="background: transparent;border:none;border-bottom: 2px solid black;padding-left:10px;padding-right:10px;width:80px;"/>
			<br>
			<center><button type="submit" class="btn btn-primary" id="find_quotes">Find Quotes</button>	</center>
			
		</div>
		<button type="button" id="add_ho_details" class="btn btn-lg " style="background-color: #3c1466;color:#fff;margin-left:5px;" >
		ADD Home Owner Details</button>
		</div>
		
		<div id="data-info" class="show-result col-md-12" style="position:absolute;left:300px;top:100px;">
			<div class="row">
				<div class="col-md-2">
					<div class="card">
					  <div class="card-header">
					    For 1 year
					  </div>
					  <div class="card-body">
					    <blockquote class="blockquote mb-0">
					      <span id="for-one"></span>
					      <br>
					      <center> <button id="btn_one" class="btn btn-success" >Buy</button></center>
					     
					    </blockquote>
					  </div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="card">
					  <div class="card-header">
					    For 2 year
					  </div>
					  <div class="card-body">
					    <blockquote class="blockquote mb-0">
					      <span id="for-two"></span>
					       <br>
					      <center> <button id="btn_two" class="btn btn-success">Buy</button></center>
					    </blockquote>
					  </div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="card">
					  <div class="card-header">
					    For 3 year
					  </div>
					  <div class="card-body">
					    <blockquote class="blockquote mb-0">
					      <span id="for-three"></span>
					       <br>
					      <center> <button id="btn_three" class="btn btn-success">Buy</button></center>
					    </blockquote>
					  </div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="card">
					  <div class="card-header">
					    For 6 year
					  </div>
					  <div class="card-body">
					    <blockquote class="blockquote mb-0">
					      <span id="for-six"></span>
					       <br>
					      <center> <button id="btn_four" class="btn btn-success">Buy</button></center>
					    </blockquote>
					  </div>
					</div>
				</div>
			</div>	
		</div>
	</section>
	
	<div class="modal fade" id="hOwDetails" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="color:#fff;">
	      <div class="modal-header" style="background-color: #4c197f;color:#fff;">
	        <h5 class="modal-title" id="exampleModalLabel">ADD Home Owner Details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form style="position:relative;padding:0px 40px 40px 40px;top:-10px;">
			 			
			 		  <div class="form-group">
			 		  	<div class="form-row">
			 		  		<div class="col">
			 		  		  <label for="email">First Name</label>
					  		  <input type="text" class="form-control" id="ho-fname" aria-describedby="emailHelp" placeholder="Enter First Name" required>
			 		  		</div>
			 		  		<div class="col">
			 		  		  <label for="email">Last Name</label>
					  		  <input type="text" class="form-control" id="ho-lname" aria-describedby="emailHelp" placeholder="Enter Last Name" required>
			 		  		</div>
			 		  	</div>
					  
					    
					  </div>
					  
					  <div class="form-group">
					    <label for="email">Date of Birth</label>
					    <input type="date" class="form-control" id="ho-dob" aria-describedby="emailHelp"  required>
					    
					  </div>	
			
					   <div class="form-group">
					    <label for="Contact">Contact Number</label>
					    <input type="text" class="form-control" id="ho-contact" placeholder="Contact Number" maxlength="10">
					  </div>
					  <div class="form-group">
					   <label for="Loc">Location</label>
    				   <textarea class="form-control " id="ho-location" placeholder="Enter Home Owner Location" ></textarea>
					  </div>
					 
					  <button type="submit" class="btn btn-primary" onclick="setData();">Submit Details</button>
					</form>
	      </div>
	    </div>
	  </div>
	</div>

</body>
	<script>
		function chekDataOnLoad(){
			var email ="<%= session.getAttribute("email") %>";
			$.ajax({
				data:"email="+email,
				type:"post",
				url:"OnLoadCheker",
				success:function(data){
					if(data=="false"){
						document.getElementById('add_ho_details').style.display="block";
						document.getElementById('howner-details').style.display="none";
					}
					else{
						document.getElementById('add_ho_details').style.display="none";
						document.getElementById('howner-details').style.display="block";
						var info=data.split(",");
						document.getElementById('get-name').innerHTML=info[1];
						document.getElementById('get-dob').innerHTML=info[2];
						document.getElementById('get-cont').innerHTML=info[3];
						document.getElementById('get-loca').innerHTML=info[4];
						
					}
				}
				
			});
		}
		
		function setData(){
			event.preventDefault();
			var email="<%= session.getAttribute("email") %>";
			var name=document.getElementById("ho-fname").value +" "+document.getElementById("ho-lname").value;
			var dob=document.getElementById("ho-dob").value;
			var con_num=document.getElementById("ho-contact").value;
			var location=document.getElementById("ho-location").value;
			
			
			
			
			$.ajax({
				data:"email="+email+"&name="+name+"&dob="+dob+"&contact="+con_num+"&location="+location,
				type:"post",
				url:"homeOwnerReigster",
				success:function(data){
					if(data=="true"){
						 Swal.fire(
								  'You are Details !',
								  'Are Rgistred!',
								  'success'
								)
								
					setTimeout(function(){ window.location.reload(true); }, 3000);			
								
					
					}else{
						console.log(data);
						 Swal.fire(
								  'Details were not saved ',
								  'Some Error',
								  'error'
								)
					}
					
				}
			});
		}
	</script>
	

	
	<script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/popover.js"></script>
	<script type="text/javascript" src="js/sweetalert2.min.js"></script>
	<script>
	$(document).ready(function(){
		$("#add_ho_details").click(function(){
			$("#hOwDetails").modal();
		});
		
		$("#find_quotes").click(function(){
			
			
			
			var home_cost=$('#hcost').val();
			var total_area=$('#b_Area').val();
			
			var total=parseInt(home_cost)*parseInt(total_area);
			
			$("#for-one").text("Total Cost  Rs "+total);
			$("#for-two").text("Total Cost  Rs "+total*2);
			$("#for-three").text("Total Cost  Rs "+total*3);
			$("#for-six").text("Total Cost Rs "+total*5);
			
			
		});
		
		
		$("#btn_one").click(function(){
			 Swal.fire(
					  'You have Buyed Home Insurance for 1 Year',
					  'Thank You',
					  'success'
					)
		});
		$("#btn_two").click(function(){
			Swal.fire(
					  'You have Buyed Home Insurance for 2 Year',
					  'Thank You',
					  'success'
					)
		});
		$("#btn_three").click(function(){
			Swal.fire(
					  'You have Buyed Home Insurance for 3 Year',
					  '3yr',
					  'success'
					)
		});
		$("#btn_four").click(function(){
			Swal.fire(
					  'You have Buyed Home Insurance for 6 Year',
					  'Thank You',
					  'success'
					)
		});
		
	});
	</script>
</html>