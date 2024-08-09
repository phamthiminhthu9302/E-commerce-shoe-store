<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page
	import="dao.DAO,entity.*,entity.Supplier,entity.Invoice,entity.Account,entity.Product,entity.OrderDetail,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Statistic</title>
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
<%
Account a = (Account) session.getAttribute("acc");
if (a == null) {
	response.sendRedirect("login");
	return;
}
DAO dao = new DAO();
int checkIsAdmin = dao.checkAccountAdmin(a.getId());
%>
<style>

body {
	margin: 0;
	padding: 0;
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap">

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
<script type="text/javascript">
	function isSell() {
		alert("Bạn không có quyền");

	}
</script>
</head>
<body>

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
								<strong>Quản lý nhà cung cấp</strong>
							</h5>
						</div>

							<%
						if (checkIsAdmin == 1) {
						%>
						<div class="col-sm-9 text-right">
							<a href="#addEmployeeModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i></a>

							<form action="xuatExcelSupplierControl" method="get">
								<button type="submit" class="mb-0 text-center btn btn-primary">Xuất
									file Excel</button>
							</form>
						</div>
					</div>
					<%
					} else {
					%>

					<div class="col-sm-9 text-right">
						<a  href="#" class="btn btn-success" onclick="isSell();"
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
										<th scope="col"class="border-1 bg-light ">ID</th>
										<th scope="col"class="border-1 bg-light ">Tên nhà cung cấp</th>
										<th scope="col"class="border-1 bg-light ">Số điện thoại</th>
										<th scope="col"class="border-1 bg-light ">Email</th>
										<th scope="col"class="border-1 bg-light ">Địa chỉ</th>
										<th scope="col"class="border-1 bg-light ">Phân phối cho</th>
										<th scope="col"class="border-1 bg-light ">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listAllSupplier}" var="o">

										<tr>
											<td>${o.idSupplier}</td>
											<td>${o.nameSupplier}</td>
											<td>${o.phoneSupplier}</td>
											<td>${o.emailSupplier}</td>
											<td>${o.addressSupplier}</td>
											<c:forEach items="${listAllCategory}" var="t">
												<c:if test="${o.cateID==t.cid }">
													<td>${t.cname }</td>
												</c:if>
											</c:forEach>
											<td>
											<%
											if (checkIsAdmin == 1) {
											%> 
											<a href="loadNPP?pid=${o.idSupplier}"><button
													type="button" class="btn btn-warning">
													<i class="material-icons" data-toggle="tooltip"
														title="Edit">&#xE254;</i>
												</button></a>
											<a href="deleteSupplier?id=${o.idSupplier}"><button
														type="button" class="btn btn-danger">
														<i class="material-icons" data-toggle="tooltip"
															title="Delete">&#xE872;</i>
													</button></a> <%
 } else {
 %><a href="#"  onclick="isSell();"><button
													type="button" class="btn btn-warning">
													<i class="material-icons" data-toggle="tooltip"
														title="Edit">&#xE254;</i>
												</button></a>
											<a  onclick="isSell();" href="#"><button 
														type="button" class="btn btn-danger"> 
														<i class="material-icons" data-toggle="tooltip"
															title="Delete">&#xE872;</i>
													</button></a>  <%
 }
 %>
											</td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
			<!--Section: Quan Ly tai Khoan-->
		</div>


	</main>

	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="addSupplier">
					<div class="modal-header">

						<h4 class="modal-title">Thêm nhà cung cấp</h4>
						<button type="button" class="close" data-dismiss="modal"
							onclick="cancel()" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="alert alert-danger" id="err_name" role="alert"
								style="display: none;"></div>
							<label>Tên nhà cung cấp</label> <input name="nameSupplier"
								id="nameSupplier" type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_phone" role="alert"
								style="display: none;"></div>
							<label>Số điện thoại</label> <input name="phoneSupplier"
								id="phoneSupplier" type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_email" role="alert"
								style="display: none;"></div>
							<label>Email</label> <input name="emailSupplier"
								id="emailSupplier" type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_address" role="alert"
								style="display: none;"></div>
							<label>Địa chỉ</label> <input name="addressSupplier"
								id="addressSupplier" type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Cung cấp cho</label> <select name="cateID"
								class="form-select" aria-label="Default select example">
								<c:forEach items="${listAllCategory}" var="t">
									<option value="${t.cid}">${t.cname}</option>
								</c:forEach>
							</select>
						</div>


					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel" onclick="cancel()"> <input type="button"
							class="btn btn-success" onclick="AddAcount()" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="js/manager.js" type="text/javascript"></script>
	<script type="text/javascript">
	function isSell() {
		alert("Bạn không có quyền");

	}
</script>
	<script type="text/javascript">
		function cancel() {
			window.location.href = "managerSupplier";
		}
		function validateEmail() {
			var emailID = document.getElementById("emailSupplier").value;
			atpos = emailID.indexOf("@");
			dotpos = emailID.lastIndexOf(".");

			if (atpos < 1 || (dotpos - atpos < 2)) {

				return false;
			}
			return (true);
		}
		 function Phone(){
        	 var ctrl =  document.getElementById("phoneSupplier").value;
           var regexr =/^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$/;
        	   

        	 return regexr.test(ctrl);
        

        }
		function validate() {
			var regex = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/;
			var ctrl = document.getElementById("nameSupplier").value;
			return regex.test(ctrl);
		}
		function AddAcount() {

			var count = 0;
			if (document.getElementById("nameSupplier").value == "") {
				document.getElementById("err_name").innerHTML = "Tên không được để trống";
				document.getElementById("err_name").style.display = "block";
				count++;
			}
			if (document.getElementById("phoneSupplier").value == "") {
				document.getElementById("err_phone").innerHTML = "Điện thoại không được để trống";
				document.getElementById("err_phone").style.display = "block";
				count++
			}
			if (document.getElementById("emailSupplier").value == "") {
				document.getElementById("err_email").innerHTML = "Email không được để trống";
				document.getElementById("err_email").style.display = "block";
				count++
			}
			if (document.getElementById("addressSupplier").value == "") {
				document.getElementById("err_address").innerHTML = "Địa chỉ không được để trống";
				document.getElementById("err_address").style.display = "block";
				count++
			}
			if (document.getElementById("nameSupplier").value != "") {
				if (validate() == false) {
					document.getElementById("err_name").innerHTML = "Tên không hợp lệ";
					document.getElementById("err_name").style.display = "block";
					count++
				} else {
					document.getElementById("err_name").style.display = "none";

				}
			}

			if(document.getElementById("phoneSupplier").value!=""){
    			if(Phone()==false ||(document.getElementById("phoneSupplier").value.length<10 || document.getElementById("phoneSupplier").value.length>10)) {
        			error2 =  "Số điện thoại không hợp lệ";
        			document.getElementById("err_phone").innerHTML = error2;
        			document.getElementById("err_phone").style.display = "block";
        			count++;
        			
        		}else{
        			document.getElementById("err_phone").style.display = "none";
        		}
    		}
			

			
			if (document.getElementById("emailSupplier").value != "") {
				if (validateEmail() == false) {
					document.getElementById("err_email").innerHTML = "Email không hợp lệ ";
					document.getElementById("err_email").style.display = "block";
					count++;

				} else {
					document.getElementById("err_email").style.display = "none";

				}

			}

			if (document.getElementById("addressSupplier").value != "") {

				document.getElementById("err_address").style.display = "none";

			}
			if (count == 0) {
				$
						.ajax({

							url : "/WebsiteBanGiay/addSupplier",
							type : "get", //send it through get method
							data : $("#addSupplier").serialize(),

							success : function(responseData) {
								if (responseData == "Supplier Added!") {
									window.location.href = "managerSupplier";
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
	<script
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
	<!-- MDB Ecommerce JavaScript -->
	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
	<!-- MDB -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript" src="js/script.js"></script>
	<script
		src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>


	<script type="text/javascript"
		src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
	<!-- MDB -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>