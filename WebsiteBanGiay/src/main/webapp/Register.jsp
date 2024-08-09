<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link href="css/login.css" rel="stylesheet" type="text/css" />
<title>Login Form</title>
</head>
<body>
	<jsp:include page="Menu.jsp"></jsp:include>
	<div id="logreg-forms">
		<c:if test="${error!=null }">
			<div class="alert alert-danger" role="alert">${error}</div>
		</c:if>

		<c:if test="${mess!=null }">
			<div class="alert alert-success" role="alert">${mess}</div>
		</c:if>
<div class="alert alert-success" role="alert" id="sucess"
					style="display: none;"></div>

		<form id="addEmployeeForm">
			<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">
				Sign up</h1>
			<div class="form-group">
			
				<div class="alert alert-danger" id="err_user" role="alert"
								style="display: none;"></div>
				<label>Username</label> <input name="user" type="text"
					id="user" class="form-control"
					placeholder="User name" required="" autofocus="">

				
			</div>
			<div class="form-group">
			<div class="alert alert-danger" id="err_pass" role="alert" style="display: none;"></div>
				<label>Password</label> <input name="pass" type="password"
					 id="pass" class="form-control"
					placeholder="Password" required autofocus="">
			</div>
			<div class="form-group">
		<div class="alert alert-danger" id="err_repass" role="alert" style="display: none;"></div>
				<label>Re-Password</label> <input name="repass" type="password"
					 id="repass" class="form-control"
					placeholder="Repeat Password" required autofocus="">

				
			</div>
			<div class="form-group">
				<div class="alert alert-danger" id="err_email" role="alert"
								style="display: none;"></div>
				<label>Email</label> <input name="email" type="email"
					 id="email" class="form-control"
					placeholder="Email" required="" autofocus="">

				
			</div>
			<button class="btn btn-primary btn-block" type="button" onclick="AddAcount()">
				<i class="fas fa-user-plus"></i> Sign Up
			</button>
			<a href="Login.jsp" id="cancel_signup"><i
				class="fas fa-angle-left"></i> Back</a>
		</form>
		<br>

	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		
		<script>
		function validateEmail() {
	        var emailID = document.getElementById("email").value;
	        atpos = emailID.indexOf("@");
	        dotpos = emailID.lastIndexOf(".");
	       
	        if (atpos < 1 || ( dotpos - atpos < 2 )) {
	          
	           return false;
	        }
	        return( true );
	        }
		 function validate() {
	         var regex = /^[a-zA-Z0-9_]{3,10}$/;
	         var ctrl =  document.getElementById("user").value;
	         return regex.test(ctrl);
	     }
		 function validate_pass() {
	         var regex = /^[a-zA-Z0-9]{3,6}$/;
	         var ctrl =  document.getElementById("pass").value;
	         return regex.test(ctrl);
	     }
		 function validate_repass() {
	         var regex = /^[a-zA-Z0-9]{3,6}$/;
	         var ctrl =  document.getElementById("repass").value;
	         return regex.test(ctrl);
	     }
			function AddAcount() {
				var count=0;
				if (document.getElementById("user").value == "") {
					document.getElementById("err_user").innerHTML = "Username không được để trống";
					document.getElementById("err_user").style.display = "block";
					count++;
				}
				if (document.getElementById("email").value == "") {
					document.getElementById("err_email").innerHTML = "Email không được để trống";
					document.getElementById("err_email").style.display = "block";
					count++;
				}
				
				if (document.getElementById("pass").value == "") {
					document.getElementById("err_pass").innerHTML = "Password không được để trống";
					document.getElementById("err_pass").style.display = "block";
					count++;
				}
				if (document.getElementById("repass").value == "") {
					document.getElementById("err_repass").innerHTML = "Re_Password không được để trống";
					document.getElementById("err_repass").style.display = "block";
					count++;
				}
				if(document.getElementById("user").value!=""){
					if(validate()==false){
	    				document.getElementById("err_user").innerHTML = "Username không hợp lệ";
	    				document.getElementById("err_user").style.display = "block";
	    				count++;
	    			}else{ 
	    				document.getElementById("err_user").style.display = "none";
	    				
	    			} 
				}
				
				if (document.getElementById("email").value != "") {
					if(validateEmail()==false){
						document.getElementById("err_email").innerHTML = "Email không hợp lệ ";
						document.getElementById("err_email").style.display = "block";
						count++;
					}else{
						document.getElementById("err_email").style.display = "none";
					}
					
					
				}
				
				if (document.getElementById("pass").value != "") {
					if(validate_pass()==false){
						document.getElementById("err_pass").innerHTML = "Password không hợp lệ ";
						document.getElementById("err_pass").style.display = "block";
						count++;
					}else{
						document.getElementById("err_pass").style.display = "none";
					}
					
					
				}
				if (document.getElementById("repass").value != "") {
					if(validate_pass()==false){
						document.getElementById("err_repass").innerHTML = "Re_Password không hợp lệ ";
						document.getElementById("err_repass").style.display = "block";
						count++;
					}else{
						if(document.getElementById("repass").value!=document.getElementById("pass").value){
							document.getElementById("err_repass").innerHTML = "Mật khẩu không trùng nhau ";
							document.getElementById("err_repass").style.display = "block";
							count++;
						}else{
							document.getElementById("err_repass").style.display = "none";
						}
						
						
						
					}
					
					
				}
				
				if(count==0){
				$
						.ajax({

							url : "/WebsiteBanGiay/signup",
							type : "get", //send it through get method
							data : $("#addEmployeeForm").serialize(),

							success : function(responseData) {

								
								if (responseData == "Username và email đã tồn tại") {
									document.getElementById("err_email").innerHTML = responseData;
									document.getElementById("err_email").style.display = "block";
									document.getElementById("err_user").innerHTML = responseData;
									document.getElementById("err_user").style.display = "block";
								}
								if (responseData == "Username đã tồn tại") {
									document.getElementById("err_user").innerHTML = responseData;
									document.getElementById("err_user").style.display = "block";
								}
								if (responseData == "Username đã tồn tại") {
									document.getElementById("err_user").innerHTML = responseData;
									document.getElementById("err_user").style.display = "block";
								}
								if (responseData == "Mật khẩu không trùng nhau") {

									document.getElementById("err_repass").innerHTML = responseData;
									document.getElementById("err_repass").style.display = "block";
								}
								if (responseData == "Sign Up Success") {

									
									document.getElementById("sucess").innerHTML = responseData;
									document.getElementById("sucess").style.display = "block";
									window.location.href = "Login.jsp";

								}

							}
						});
				}
			}
		</script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
		window
				.addEventListener(
						"load",
						function loadAmountCart() {
							$
									.ajax({
										url : "/WebsiteBanGiay/loadAllAmountCart",
										type : "get", //send it through get method
										data : {

										},
										success : function(responseData) {
											document
													.getElementById("amountCart").innerHTML = responseData;
										}
									});
						}, false);
	</script>
</body>
</html>