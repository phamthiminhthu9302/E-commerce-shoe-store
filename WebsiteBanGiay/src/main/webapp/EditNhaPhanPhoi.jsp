<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="dao.DAO,entity.*,entity.Supplier,entity.Invoice,entity.Account,entity.Product,entity.OrderDetail,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
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
<%
Account a = (Account) session.getAttribute("acc");
if (a == null) {
	response.sendRedirect("login");
	return;
}
DAO dao = new DAO();
%>

</head>
<body>


	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Edit <b>Product</b>
						</h2>
					</div>

				</div>
			</div>
		</div>
		<div id="editEmployeeModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<form id="addEmployeeForm">
						<div class="modal-header">
							<h4 class="modal-title">Edit Supplier</h4>
							<a href="managerSupplier"><button type="button" class="close"
									data-dismiss="modal" aria-hidden="true">&times;</button></a>
						</div>
						<div class="form-group">

							<c:if test="${detail.idSupplier!=null }">
								<input value="${detail.idSupplier}" name="id" id="id"
									type="hidden" class="form-control" readonly required>
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
							<div class="alert alert-danger" id="err_name" role="alert"
								style="display: none;"></div>
							<c:if test="${detail.nameSupplier!=null }">
								<label>Tên nhà cung cấp</label>
								<input name="nameSupplier" id="nameSupplier"
									value="${detail.nameSupplier}" type="text" class="form-control"
									required>
							</c:if>
							<%
							if (request.getParameter("nameSupplier") != null) {
							%>
							<label>Tên nhà cung cấp</label> <input name="nameSupplier"
								id="nameSupplier"
								value="<%=request.getParameter("nameSupplier")%>" type="text"
								class="form-control" required>

							<%
							}
							%>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_phone" role="alert"
								style="display: none;"></div>
							<c:if test="${detail.phoneSupplier!=null }">
								<label>Số điện thoại</label>
								<input name="phoneSupplier" id="phoneSupplier"
									value="${detail.phoneSupplier}" type="text"
									class="form-control" required>
							</c:if>
							<%
							if (request.getParameter("phoneSupplier") != null) {
							%>
							<label>Số điện thoại</label> <input name="phoneSupplier"
								id="phoneSupplier"
								value="<%=request.getParameter("phoneSupplier")%>" type="text"
								class="form-control" required>
							<%
							}
							%>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_email" role="alert"
								style="display: none;"></div>
							<c:if test="${detail.emailSupplier!=null }">
								<label>Email</label>
								<input name="emailSupplier" id="emailSupplier"
									value="${detail.emailSupplier}" type="text"
									class="form-control" required>
							</c:if>
							<%
							if (request.getParameter("emailSupplier") != null) {
							%>
							<label>Email</label> <input name="emailSupplier"
								id="emailSupplier"
								value="<%=request.getParameter("emailSupplier")%>" type="text"
								class="form-control" required>
							<%
							}
							%>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_address" role="alert"
								style="display: none;"></div>
							<c:if test="${detail.addressSupplier!=null }">
								<label>Địa chỉ</label>
								<input name="addressSupplier" id="addressSupplier"
									value="${detail.addressSupplier}" type="text"
									class="form-control" required>
							</c:if>
							<%
							if (request.getParameter("addressSupplier") != null) {
							%>
							<label>Địa chỉ</label> <input name="addressSupplier"
								id="addressSupplier"
								value="<%=request.getParameter("addressSupplier")%>" type="text"
								class="form-control" required>
							<%
							}
							%>
						</div>
						<div class="form-group">
							<%
							if (request.getParameter("pid") != null) {
								String id = request.getParameter("pid");
								Supplier x = dao.getSupplierByID(id);

								List<Category> list1 = dao.getAllCategory();
							%>
							<label>Cung cấp cho</label> <select name="cateID"
								class="form-select" aria-label="Default select example">
								<%
								for (Category d : list1) {
								%>

								<option value="<%=d.getCid()%>"
									<%if (x.getCateID() == d.getCid()) {%> SELECTED <%}%>>
									<%=d.getCname()%></option>


								<%
								}
								}
								List<Category> list1 = dao.getAllCategory();
								int temp = 0;
								if (request.getParameter("cateID") != null) {
								temp = Integer.parseInt(request.getParameter("cateID"));
								%>
								<label>Cung cấp cho</label>
								<select name="cateID" class="form-select"
								aria-label="Default select example">
									<%
									for (Category d : list1) {
									%>
									<option value="<%=d.getCid()%>" <%if (temp == d.getCid()) {%>
										SELECTED <%}%>>
										<%=d.getCname()%></option>
									<%
									}
									}
									%>

							</select>
						</div>
						<div class="modal-footer">
							<a href="managerSupplier"><input type="button"
								class="btn btn-default" data-dismiss="modal" value="Cancel"></a>
							<input type="button" onclick="Edit()" class="btn btn-success"
								value="Edit">


						</div>


					</form>
				</div>
			</div>



		</div>

	</div>

</body>
<script src="js/manager.js" type="text/javascript"></script>
<script type="text/javascript">
	function validateEmail() {
		var emailID = document.getElementById("emailSupplier").value;
		atpos = emailID.indexOf("@");
		dotpos = emailID.lastIndexOf(".");

		if (atpos < 1 || (dotpos - atpos < 2)) {

			return false;
		}
		return (true);
	}
	function Phone() {
		var ctrl = document.getElementById("phoneSupplier").value;
		var regexr = /^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$/;

		return regexr.test(ctrl);

	}
	function validate() {
		var regex = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/;
		var ctrl = document.getElementById("nameSupplier").value;
		return regex.test(ctrl);
	}
	function Edit() {

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

		if (document.getElementById("phoneSupplier").value != "") {
			if (Phone() == false
					|| (document.getElementById("phoneSupplier").value.length < 10 || document
							.getElementById("phoneSupplier").value.length > 10)) {
				error2 = "Số điện thoại không hợp lệ";
				document.getElementById("err_phone").innerHTML = error2;
				document.getElementById("err_phone").style.display = "block";
				count++;

			} else {
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
			
					$.ajax({

						url : "/WebsiteBanGiay/editSupplier",
						type : "get", //send it through get method
						data : $("#addEmployeeForm").serialize(),
						success : function(responseData) {
							if (responseData == "Edited!") {
								window.location.href = "managerSupplier";
								document.getElementById("sucess").innerHTML = responseData;
								document.getElementById("sucess").style.display = "block";

							}
							if (responseData == "No Edited!") {
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

	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
	<!-- MDB core JavaScript -->


	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->


</body>
</html>