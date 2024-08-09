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
int checkIsAdmin = dao.checkAccountAdmin(a.getId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý sản phẩm</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">


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

<!-- Material Design Bootstrap Ecommerce -->
<!-- <link rel="stylesheet"
	href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css"> -->
<!-- Your custom styles (optional) -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">


<!------ Include the above in your HEAD tag ------>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/manager.css" rel="stylesheet" type="text/css" />

<style>
img {
	width: 180px;
	height: 120px;
}

td, th {
	text-align: center;
}
</style>




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

.temp {
	display: inline-block;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	user-select: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	"
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
								<strong>Quản lý sản phẩm</strong>
							</h5>
						</div>
						<div class="col-sm-9 text-right">
							<a href="#addEmployeeModal" class="btn-success temp"
								data-toggle="modal"><i class="material-icons">&#xE147;</i></a>

							<form action="xuatExcelProductControl" method="get">
								<button type="submit" class="mb-0 text-center btn-primary temp" style="margin-top:10px;">Xuất
									file Excel</button>
							</form>
						</div>
					</div>
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
										<th scope="col" class="border-1 bg-light ">Tên sản phẩm</th>
										<th scope="col" class="border-1 bg-light ">Ảnh sản phẩm</th>
										<th scope="col" class="border-1 bg-light ">Giá</th>
										<th scope="col"class="border-1 bg-light ">Màu sắc</th>
										<th scope="col"class="border-1 bg-light ">Số lượng</th>
										<th scope="col" class="border-1 bg-light ">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listP}" var="o">
										<tr>
											<td >${o.id}</td>
											<td>${o.name}</td>
											 <td><img  src="${pageContext.request.contextPath }/images/${o.image}"></td> 
											 
											<td>${o.price}$</td>
											<td>${o.color}</td>
											<td>${o.count}<td>
											
										
												<%
												if (checkIsAdmin == 1) {
												%> <a href="loadProduct?pid=${o.id}"><button
														type="button" class="btn btn-warning">
														<i class="material-icons" data-toggle="tooltip"
															title="Edit">&#xE254;</i>
													</button></a> <a href="delete?pid=${o.id}"><button type="button"
														class="btn btn-danger">
														<i class="material-icons" data-toggle="tooltip"
															title="Delete">&#xE872;</i>
													</button></a> <%
 } else {
 %><a href="#"><button type="button" onclick="isSell();"
														class="btn btn-warning">
														<i class="material-icons" data-toggle="tooltip"
															title="Edit">&#xE254;</i>
													</button></a> <a href="#"><button type="button" onclick="isSell();"
														class="btn btn-danger">
														<i class="material-icons" data-toggle="tooltip"
															title="Delete">&#xE872;</i>
													</button></a> <%
 }
 %>
										
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="clearfix">
								<ul class="pagination">
									<c:if test="${tag != 1}">
										<li class="page-item"><a href="manager?index=${tag-1 }">Previous</a></li>
									</c:if>
									<c:forEach begin="1" end="${endPage }" var="i">
										<li class="${tag==i?'page-itemactive':'' }"><a
											href="manager?index=${i }" class="page-link">${i }</a></li>
									</c:forEach>
									<c:if test="${tag != endPage}">
										<li class="page-item"><a href="manager?index=${tag+1 }"
											class="page-link">Next</a></li>
									</c:if>
								</ul>
							</div>

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
				<form id="addForm" action="/WebsiteBanGiay/addP" method="post" enctype="multipart/form-data" >
					<div class="modal-header">
						<h4 class="modal-title">Add Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="alert alert-danger" id="err_name" role="alert"
								style="display: none;"></div>
							<label>Name</label> <input name="name" id="name" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_img" role="alert"
								style="display: none;"></div>
							<label>Image </label> <br>
						<img  id="imageP" style="display: none;">
							<input type="file" id="image" name="image" 
								accept="image/*" required onchange="PreviewImage();">
								
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_price" role="alert"
								style="display: none;"></div>
							<label>Price</label> <input name="price" min="1" id="price"
								type="number" class="form-control">
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_count" role="alert"
								style="display: none;"></div>
							<label>Amount</label> <input name="count" min="1" id="count"
								type="number" class="form-control">
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_title" role="alert"
								style="display: none;"></div>
							<label>Title</label>
							<textarea name="title" id="title" class="form-control" required></textarea>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_size" role="alert"
								style="display: none;"></div>
							<label>Size</label> <input type="checkbox" name="size"
								value="Small" id="small">Small <input
								type="checkbox" name="size" value="Medium" id="medium">Medium
							<input type="checkbox" name="size" value="Large"
								id="large">Large
						</div>

						<div class="form-group">
							<label>Color</label> <select name="color" class="form-select"
								aria-label="Default select example">

								<option value="White">White</option>
								<option value="Gray">Gray</option>
								<option value="Black">Black</option>
								<option value="Green">Green</option>
								<option value="Blue">Blue</option>
								<option value="Purple">Purple</option>
								<option value="Yellow">Yellow</option>
								<option value="Indigo">Indigo</option>
								<option value="Red">Red</option>
								<option value="Orange">Orange</option>

							</select>
						</div>

						<div class="form-group">
							<div class="alert alert-danger" id="err_des" role="alert"
								style="display: none;"></div>
							<label>Description</label>
							<textarea name="description" id="description"
								class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label>Category</label> <select name="category"
								class="form-select" aria-label="Default select example">
								<c:forEach items="${listCC}" var="o">
									<option value="${o.cid}">${o.cname}</option>
								</c:forEach>
							</select>
						</div>

					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"><input type="button"
							class="btn btn-success" onclick="AddProduct()" value="Add">
					</div>
				</form>
			</div>
		</div>

		
		 <script>
		 function PreviewImage() {
		        var oFReader = new FileReader();
		        oFReader.readAsDataURL(document.getElementById("image").files[0]);

		        oFReader.onload = function (oFREvent) {
		        	document.getElementById("imageP").style.display = "block";
		            document.getElementById("imageP").src = oFREvent.target.result;
		        };
		    };


			
			function AddProduct() {
				var count = 0;
				if (document.getElementById("name").value == "") {
					document.getElementById("err_name").innerHTML = "Tên không được để trống";
					document.getElementById("err_name").style.display = "block";
					count++;
				}
				if (document.getElementById("count").value == "") {
					document.getElementById("err_count").innerHTML = "Số lượng không được để trống";
					document.getElementById("err_count").style.display = "block";
					count++;
				}
				if (document.getElementById("title").value == "") {
					document.getElementById("err_title").innerHTML = "Tiêu đề không được để trống";
					document.getElementById("err_title").style.display = "block";
					count++;
				}
				if (document.getElementById("small").checked == false&&
						document.getElementById("medium").checked == false&&
						document.getElementById("large").checked == false) {
					document.getElementById("err_size").innerHTML = "Kích thước không được để trống";
					document.getElementById("err_size").style.display = "block";
					count++;
				}
				if (document.getElementById("price").value == "") {
					document.getElementById("err_price").innerHTML = "Giá không được để trống";
					document.getElementById("err_price").style.display = "block";
					count++;
				}
				if (document.getElementById("image").value == "") {
					document.getElementById("err_img").innerHTML = "Ảnh không được để trống";
					document.getElementById("err_img").style.display = "block";
					count++;
				}
				if (document.getElementById("description").value == "") {
					document.getElementById("err_des").innerHTML = "Miêu tả không được để trống";
					document.getElementById("err_des").style.display = "block";
					count++;
				}
				if (document.getElementById("name").value != "") {

					document.getElementById("err_name").style.display = "none";

				}
				if (document.getElementById("count").value != "") {

					document.getElementById("err_count").style.display = "none";

				}
				if (document.getElementById("title").value != "") {

					document.getElementById("err_title").style.display = "none";

				}
				if (document.getElementById("price").value != "") {

					document.getElementById("err_price").style.display = "none";

				}
				if (document.getElementById("description").value != "") {

					document.getElementById("err_des").style.display = "none";

				}
				if (document.getElementById("image").value != "") {

					document.getElementById("err_img").style.display = "none";

				}
				
				if (document.getElementById("small").checked == true||
						document.getElementById("medium").checked == true||
						document.getElementById("large").checked == true) {
					
					document.getElementById("err_size").style.display = "none";
					
				}
				if (count == 0) {
					var formData = new FormData(document.getElementById('addForm'));
					$.ajax({
					    url: "/WebsiteBanGiay/addP",
					    type: "post", // send it through get method
					    data: formData,
				        contentType: false,
				        processData: false,
					   /*  data: $("#addForm").serialize(), */
					   
					    success: function(responseData) {
					        if (responseData == "Product Added!") {
					           
					            document.getElementById("sucess").innerHTML="Product Added!"
					            	document.getElementById("sucess").style.display = "block";
					            window.location.href = "/WebsiteBanGiay/manager";
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

		<script
			src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>


		<script type="text/javascript"
			src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
		<!-- MDB -->
		<script type="text/javascript" src="js/mdb.min.js"></script>
		<!-- Custom scripts -->
	
</body>
</html>