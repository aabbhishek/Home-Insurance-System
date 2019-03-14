<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home Insurance System</title>
		<link href="css/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		
		<style>
		.login {transition:1s;}.regis{transition:1s;}
		.login:hover{
		filter:brightness(1.4);
		}
		.regis:hover{
		filter:brightness(1.2);
		}
		</style>
	</head>
	<body style="overflow:hidden;">
		<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#26004c!important;">
  			 <a class="navbar-brand" href="#" style="color:#fff;">Home Insurance</a> 
		</nav>
		<section class="main">
			 	<div class="login" style="width: 50%;height: 700px;background-color: #9832ff;">
			 		
			 		<form style="position:relative;padding:40px 40px 40px 40px;top:150px;">
			 			<center><h2 style="color:#fff;">Login</h2></center>
					  <div class="form-group">
					    <label for="email">Email address</label>
					    <input type="email" class="form-control" id="log-email" aria-describedby="emailHelp" placeholder="Enter email">
					    
					  </div>
					  <div class="form-group">
					    <label for="password">Password</label>
					    <input type="password" class="form-control" id="log-password" placeholder="Password">
					  </div>
					 
					  <button type="submit" class="btn btn-primary" onclick="login();">Submit</button>
					</form>
			 		
			 	</div>
			 	<div class="regis"  style="position:relative;width: 50%;height: 700px;;background-color:#d8b2ff;top:-700px;left:50%;">
			 			
			 			<form style="position:relative;padding:40px 40px 40px 40px;top:10px;">
			 			<center><h2 style="color:#fff;">Rigster</h2></center>
			 			<br>
			 		  <div class="form-group">
			 		  	<div class="form-row">
			 		  		<div class="col">
			 		  		  <label for="email">First Name</label>
					  		  <input type="text" class="form-control" id="fname" aria-describedby="emailHelp" placeholder="Enter First Name" required>
			 		  		</div>
			 		  		<div class="col">
			 		  		  <label for="email">Last Name</label>
					  		  <input type="text" class="form-control" id="lname" aria-describedby="emailHelp" placeholder="Enter Last Name" required>
			 		  		</div>
			 		  	</div>
					  
					    
					  </div>
					  
					  <div class="form-group">
					    <label for="email">Date of Birth</label>
					    <input type="date" class="form-control" id="dob" aria-describedby="emailHelp"  required>
					    
					  </div>	
					  <div class="form-group">
					    <label for="email">Email address</label>
					    <input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" required>
					    
					  </div>
					   <div class="form-group">
					    <label for="cpassword">Password</label>
					    <input type="password" id="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
					  </div>
					  <div class="form-group">
					    <label for="password">Confirm password</label>
					    <input type="password" id="cpassword" class="form-control" id="exampleInputPassword1" placeholder="Password">
					  </div>
					 
					  <button type="submit" class="btn btn-primary" onclick=" register(); ">Submit</button>
					</form>
					
			 	</div>
		</section>
		
	</body>
	<script>
		function register(){
			
			event.preventDefault();
			var fname=document.getElementById('fname').value;
			var lname=document.getElementById('lname').value;
			var dob=document.getElementById('dob').value;
			var email=document.getElementById('email').value;
			var pass=document.getElementById('password').value;
			var cpass=document.getElementById('cpassword').value;
			 console.log(email);
			if(pass==cpass){
				$.ajax({
					data:"fname="+fname+"&lname="+lname+"&dob="+dob+"&email="+email+"&password="+pass,
					type:"post",
					url:"RigsUser",
					 success:function(data){
						 if(data=="true"){
							 Swal.fire(
									  'You are registered !',
									  'Login Now!',
									  'success'
									)
						 }
						 else{
							 console.log(data);
							 Swal.fire(
									  'You were not able to register ',
									  'Some Error',
									  'error'
									)
						 }
						 
					 }
				});
			}
			else{
				
				
				 Swal.fire(
						  'PASSWORD DOES NOT MATCH ',
						  '',
						  'error'
						)
			}
		}
		
		
		function login(){
			event.preventDefault();
			var email=document.getElementById('log-email').value;
			var pass=document.getElementById('log-password').value;
			
			$.ajax({
				data:"email="+email+"&password="+pass,
				type:"post",
				url:"login",
				success:function(data){
				if(data=="true"){
					console.log("LogedIN");
					window.location.href = "home.jsp";

				}
				else{
					Swal.fire(
							  'Login Failed ',
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
</html>