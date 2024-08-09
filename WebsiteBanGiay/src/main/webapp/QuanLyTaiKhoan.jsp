<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page
	import="dao.DAO,entity.Invoice,entity.Account,entity.Product,entity.OrderDetail,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<%
Account a = (Account) session.getAttribute("acc");
if (a == null) {
	response.sendRedirect("login");
	return;
}
DAO dao = new DAO();
List<Account> list=dao.getAllAccount();
int checkIsAdmin = dao.checkAccountAdmin(a.getId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản Lý Tài Khoản</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	margin: 0;
	padding: 0;
}

body {
	background-color: #fbfbfb;
}

@media ( min-width : 991.98px) {
	main {
		padding-left: 240px;
	}
}

td, th {
	text-align: center;
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
<script type="text/javascript">
	function isSell() {
		alert("Bạn không có quyền");

	}
</script>
<script type="text/javascript">
	function isAdmin() {
		alert("Bạn không thể xóa quản trị viên");

	}
</script>
</head>
<body class="modal-open">

	<!--Main Navigation-->
	<header>
		<jsp:include page="LeftAdmin.jsp"></jsp:include>


	</header>
	<!--Main Navigation-->

	<!--Main layout-->
	<main>
		<div class="container pt-4">




			<!--Section: Quan Ly tai Khoan-->
			<section class="mb-4">
				<div class="card">
					<div class="card-header py-3 row">
						<div class="col-sm-3">
							<h5 class="mb-0 text-left" id="">
								<strong>Quản lý tài khoản</strong>
							</h5>
						</div>

						<%
						if (checkIsAdmin == 1) {
						%>
						<div class="col-sm-9 text-right">
							<a href="#addEmployeeModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i></a>

							<form action="xuatExcelAccountControl" method="get">
								<button type="submit" class="mb-0 text-center btn btn-primary">Xuất
									file Excel</button>
							</form>
						</div>
					</div>
					<%
					} else {
					%>

					<div class="col-sm-9 text-right">
						<a href="#" class="btn btn-success" onclick="isSell();"
							data-toggle="modal"><i class="material-icons">&#xE147;</i></a>
						<form action="#" method="get">
							<button type="submit" onclick="isSell();"
								class="mb-0 text-center btn btn-primary">Xuất file
								Excel</button>
						</form>
					</div>
				</div>
				<%
				}
				%>

				<c:if test="${error!=null }">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>
				<c:if test="${mess!=null }">
					<div class="alert alert-success" role="alert">${mess}</div>
				</c:if>
				<div class="alert alert-success" role="alert" id="sucess"
					style="display: none;"></div>

				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th scope="col" class="border-1 bg-light ">ID</th>
									<th scope="col" class="border-1 bg-light ">Username</th>
									<th scope="col" class="border-1 bg-light ">Loại tài khoản</th>
									<th scope="col"class="border-1 bg-light ">Email</th>
									<th scope="col"class="border-1 bg-light ">Actions</th>
								</tr>
							</thead>
							<tbody>
									<%for(Account t: list){%>
									<tr>

										<td><%=t.getId() %></td>
										<td><%=t.getUser() %></td>
										<% if(t.getIsSell()==1){ %>
										
											<td>Người bán hàng</td>
									
										<% }%>
									<% if(t.getIsAdmin()==1){ %>
											<td>Quản trị viên</td>
									<% }%>
										<% if(t.getIsCustomer()==1){ %>
											<td>Khách hàng</td>
											<% }%>
										<td><%=t.getEmail() %></td>
										<td>
											<% int idDelete=0;
											if (checkIsAdmin == 1) {
											%> <a href="loadAccount?pid=<%=t.getId() %>"><button
													type="button" class="btn btn-warning">
													<i class="material-icons" data-toggle="tooltip"
														title="Edit">&#xE254;</i>
												</button></a>
												
													<% if(t.getIsAdmin()==1){	%>
														<a href="#" onclick="isAdmin()"><button
													type="button" class="btn btn-danger">
													<i class="material-icons" data-toggle="tooltip"
														title="Delete">&#xE872;</i>
												</button></a>
											
												<% 
													
													}else{%>
															<a href="deleteAccount?id=<%=t.getId() %>"><button
													type="button" class="btn btn-danger">
													<i class="material-icons" data-toggle="tooltip"
														title="Delete">&#xE872;</i>
												</button></a>
														
													<% }%>
												
 <% } else {
 %><a href="#"><button type="button" onclick="isSell();"
													class="btn btn-warning">
													<i class="material-icons" data-toggle="tooltip"
														title="Edit">&#xE254;</i>
												</button></a> <a href="#"><button type="button" onclick="isSell();"
													class="btn btn-danger">
													<i class="material-icons" data-toggle="tooltip"
														title="Delete">&#xE872;</i>
												</button></a> <%
 }}
 %>
										</td>
									</tr>
								
							</tbody>
						</table>

					<%-- 	<div class="clearfix">
							<ul class="pagination">
								<c:if test="${tag != 1}">
									<li class="page-item"><a
										href="managerAccount?index=${tag-1 }">Previous</a></li>
								</c:if>
								<c:forEach begin="1" end="${endPage }" var="i">
									<li class="${tag==i?'page-itemactive':'' }"><a
										href="managerAccount?index=${i }" class="page-link">${i }</a></li>
								</c:forEach>
								<c:if test="${tag != endPage}">
									<li class="page-item"><a
										href="managerAccount?index=${tag+1 }" class="page-link">Next</a></li>
								</c:if>
							</ul>
						</div> --%>
					</div>
				</div>
			</section>
		</div>

		<!--Section: Quan Ly tai Khoan-->


	</main>

	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="addEmployeeForm">
					<div class="modal-header">
						<h4 class="modal-title">Thêm tài khoản</h4>
						<button type="button" class="close"  data-dismiss="modal" onclick="cancel()"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<div class="alert alert-danger" id="err_user" role="alert"
								style="display: none;"></div>
							<label>Username</label> <input name="user" type="text" id="user"
								class="form-control" required>
						</div>



						<div class="form-group">
							<div class="alert alert-danger" id="err_pass" role="alert"
								style="display: none;"></div>
							<label>Password</label> <input name="pass" type="password"
								id="pass" class="form-control" required autofocus>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_check" role="alert"
								style="display: none;"></div>
							<div class="form-group form-check">
								<input name="is" value="isSell" type="radio"
									class="form-check-input" id="isSell" required> <label
									class="form-check-label" for="isSell">Người bán hàng</label>
							</div>

							<div class="form-group form-check">
								<input name="is" value="isAdmin" type="radio"
									class="form-check-input" id="isAdmin" required> <label
									class="form-check-label" for="isAdmin">Quản trị viên</label>
							</div>
							<div class="form-group form-check">
								<input name="is" value="isCustomer" type="radio"
									class="form-check-input" id="isCustomer" required> <label
									class="form-check-label" for="isCustomer">Khách hàng</label>
							</div>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_email" role="alert"
								style="display: none;"></div>
							<label>Email</label> <input name="email" type="email" id="email"
								id="email" class="form-control" required>
						</div>

					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel" onclick="cancel()"><input type="button"
							onclick="AddAcount()" class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="js/manager.js" type="text/javascript"></script>
	<script>
	function cancel(){
		window.location.href = "/WebsiteBanGiay/managerAccount";
	}
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
			if (document.getElementById("isSell").checked == false &&
					document.getElementById("isAdmin").checked == false &&
					document.getElementById("isCustomer").checked == false ) {
				document.getElementById("err_check").innerHTML = "Loại tài khoản không được để trống";
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
			if (document.getElementById("isSell").checked == true ||
					document.getElementById("isAdmin").checked == true ||
					document.getElementById("isCustomer").checked == true ) {
				
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
			if(count==0){
			$
					.ajax({

						url : "/WebsiteBanGiay/addAccount",
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
							if (responseData == "Mật khẩu không đúng") {
								document.getElementById("err_repass").innerHTML = responseData;
								document.getElementById("err_repass").style.display = "block";
							}
							if (responseData == "Email đã tồn tại") {

								document.getElementById("err_email").innerHTML = responseData;
								document.getElementById("err_email").style.display = "block";
							}
							if (responseData == "Account Added!") {

								window.location.href = "/WebsiteBanGiay/managerAccount";
								document.getElementById("sucess").innerHTML = responseData;
								document.getElementById("sucess").style.display = "block";

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