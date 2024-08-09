<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="dao.DAO,entity.Invoice,entity.Account,entity.Product,entity.OrderDetail,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit</title>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<!------ Include the above in your HEAD tag ------>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">


<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
<!-- Material Design Bootstrap -->
<link rel="stylesheet"
	href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
<!-- Material Design Bootstrap Ecommerce -->
<link rel="stylesheet"
	href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
<!-- Your custom styles (optional) -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<!------ Include the above in your HEAD tag ------>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/manager.css" rel="stylesheet" type="text/css" />


<style>
body {
	background-color: #fbfbfb;
}

@media ( min-width : 991.98px) {
	main {
		padding-left: 240px;
	}
}

/* Sidebar */
.sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	padding: 58px 0 0; /* Height of navbar */
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 5%), 0 2px 10px 0 rgb(0 0 0/ 5%);
	width: 240px;
	z-index: 600;
}

@media ( max-width : 991.98px) {
	.sidebar {
		width: 100%;
	}
}

.sidebar .active {
	border-radius: 5px;
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 16%), 0 2px 10px 0 rgb(0 0 0/ 12%);
}

.sidebar-sticky {
	position: relative;
	top: 0;
	height: calc(100vh - 48px);
	padding-top: 0.5rem;
	overflow-x: hidden;
	overflow-y: auto;
	/* Scrollable contents if viewport is shorter than content. */
}
</style>
</head>
<body>

	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Edit <b>Account</b>
						</h2>
					</div>
					<div class="col-sm-6"></div>
				</div>
			</div>
		</div>

		<div id="editEmployeeModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<form id="addEmployeeForm">
						<div class="modal-header">
							<h4 class="modal-title">Edit Account</h4>
							<a href="managerAccount"><button type="button" class="close"
									data-dismiss="modal" aria-hidden="true">&times;</button></a>
						</div>
						<div class="modal-body">
							<div class="form-group">

								<c:if test="${detail.id!=null }">
									<input value="${detail.id}" name="id" id="id" type="hidden"
										class="form-control" readonly required>
								</c:if>
								<%
								if (request.getParameter("id") != null) {
								%>
								<input value="<%=request.getParameter("id")%>" name="id" id="id"
									type="hidden" class="form-control" readonly required>
								<%
								}
								%>
							</div>
							<div class="form-group">
								<div class="alert alert-danger" id="err_user" role="alert"
									style="display: none;"></div>
								<c:if test="${detail.user!=null }">
									<label>Username</label>
									<input value="${detail.user.trim()}" id="user" name="user"
										type="text" class="form-control" required>
								</c:if>
								<%
								if (request.getParameter("user") != null) {
								%>
								<label>Username</label> <input
									value="<%=request.getParameter("user")%>" id="user" name="user"
									type="text" class="form-control" required>
								<%
								}
								%>
							</div>

							<div class="form-group">
								<div class="alert alert-danger" id="err_pass" role="alert"
									style="display: none;"></div>
								<c:if test="${detail.pass!=null }">
									<label>Password</label>
									<input name="pass" id="pass" value="${detail.pass.trim()}"
										type="password" class="form-control" required autofocus>
								</c:if>
								<%
								if (request.getParameter("pass") != null) {
								%>
								<label>Password</label> <input name="pass" id="pass"
									value="<%=request.getParameter("pass")%>" type="password"
									class="form-control" required autofocus>
								<%
								}
								%>
							</div>
							<div class="form-group">
								<div class="alert alert-danger" id="err_check" role="alert"
									style="display: none;"></div>
								<%
								if (request.getParameter("pid") != null) {
									String id = request.getParameter("pid");
									DAO dao = new DAO();
									Account p = dao.getAccountByID(id);
								%>
								<div class="form-group form-check">

									<input name="is" value="isSell" type="radio"
										<%if (p.getIsSell() == 1) {%> checked <%}%>
										class="form-check-input" id="isSell" required> <label
										class="form-check-label" for="isSell">Người bán hàng</label>



								</div>
								<div class="form-group form-check">
									<input name="is" value="isAdmin" type="radio"
										<%if (p.getIsAdmin() == 1) {%> checked <%}%>
										class="form-check-input" id="isAdmin" required> <label
										class="form-check-label" for="isAdmin">Quản trị viên</label>

								</div>
								<div class="form-group form-check">
									<input name="is" value="isCustomer" type="radio"
										<%if (p.getIsCustomer() == 1) {%> checked <%}%>
										class="form-check-input" id="isCustomer" required> <label
										class="form-check-label" for="isCustomer">Khách hàng</label>
								</div>


								<%
								} else {
								%>

								<div class="form-group form-check">
									<input name="is" value="isSell" type="radio"
										<%if (request.getParameter("is").equals("isSell")) {%> checked
										<%}%> class="form-check-input" id="isSell" required> <label
										class="form-check-label" for="isSell">Người bán hàng</label>



								</div>
								<div class="form-group form-check">
									<input name="is" value="isAdmin" type="radio"
										<%if (request.getParameter("is").equals("isAdmin")) {%>
										checked <%}%> class="form-check-input" id="isAdmin" required>
									<label class="form-check-label" for="isAdmin">Quản trị viên</label>

								</div>
								<div class="form-group form-check">
									<input name="is" value="isCustomer" type="radio"
										<%if (request.getParameter("is").equals("isCustomer")) {%>
										checked <%}%> class="form-check-input" id="isCustomer"
										required> <label class="form-check-label"
										for="isCustomer">Khách hàng</label>
								</div>
								<%
								}
								%>
							</div>
							<div class="form-group">
								<div class="alert alert-danger" id="err_email" role="alert"
									style="display: none;"></div>
								<c:if test="${detail.email!=null }">
									<label>Email</label>
									<input name="email" id="email" value="${detail.email.trim()}"
										type="email" class="form-control" required>
								</c:if>
								<%
								if (request.getParameter("pass") != null) {
								%>
								<label>Email</label> <input name="email" id="email"
									value="<%=request.getParameter("email")%>" type="email"
									class="form-control" required>
								<%
								}
								%>
							</div>

							<div class="modal-footer">
								<a href="managerAccount"><input type="button"
									class="btn btn-default" data-dismiss="modal" value="Cancel"></a>
								<input type="button" onclick="Edit()" class="btn btn-success"
									value="Edit">
							</div>
						</div>

					</form>
				</div>
			</div>



		</div>

	</div>


	<script>
		function cancel() {
			window.location.href = "/WebsiteBanGiay/managerAccount";
		}
		function validateEmail() {
			var emailID = document.getElementById("email").value;
			atpos = emailID.indexOf("@");
			dotpos = emailID.lastIndexOf(".");
			
			if (atpos < 1 || (dotpos - atpos < 2)) {

				return false;
			}
			return (true);
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
		function Edit() {
			var count = 0;
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
			if (document.getElementById("isSell").checked == false
					&& document.getElementById("isAdmin").checked == false
					&& document.getElementById("isCustomer").checked == false) {
				document.getElementById("err_check").innerHTML = "Không được để trống";
				document.getElementById("err_check").style.display = "block";
				count++;
			}
			if (document.getElementById("pass").value == "") {
				document.getElementById("err_pass").innerHTML = "Password không được để trống";
				document.getElementById("err_pass").style.display = "block";
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
			if (document.getElementById("isSell").checked == true
					|| document.getElementById("isAdmin").checked == true
					|| document.getElementById("isCustomer").checked == true) {

				document.getElementById("err_check").style.display = "none";

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
			
			if (count == 0) {
				$
						.ajax({
							url : "/WebsiteBanGiay/editAccount",
							type : "get", //send it through get method
							data : $("#addEmployeeForm").serialize(),
							success : function(responseData) {

								if (responseData == "Username và email đã tồn tại") {
									document.getElementById("err_email").innerHTML = "Email đã tồn tại";
									document.getElementById("err_email").style.display = "block";
									document.getElementById("err_user").innerHTML = "Username đã tồn tại";
									document.getElementById("err_user").style.display = "block";
								}
								if (responseData == "Username đã tồn tại") {

									document.getElementById("err_user").innerHTML = responseData;
									document.getElementById("err_user").style.display = "block";
								}
								if (responseData == "Email đã tồn tại") {

									document.getElementById("err_email").innerHTML = responseData;
									document.getElementById("err_email").style.display = "block";
								}
								if (responseData == "Edited!") {
									window.location.href = "/WebsiteBanGiay/managerAccount";
									document.getElementById("sucess").innerHTML = responseData;
									document.getElementById("sucess").style.display = "block";

								}
								if (responseData == "No Edited!") {
									window.location.href = "/WebsiteBanGiay/managerAccount";

								}

							}
						});
			}
		}
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!--Main layout-->
	<!-- SCRIPTS -->
	<!-- JQuery -->

	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
	<!-- MDB core JavaScript -->


	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->

</body>
</html>