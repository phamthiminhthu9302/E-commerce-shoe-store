<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page
	import="dao.DAO,entity.Invoice,entity.Account,entity.Product,entity.OrderDetail,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
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







<!-- Font Awesome -->

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
<!-- Material Design Bootstrap -->
<link rel="stylesheet"
	href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
<!-- Material Design Bootstrap Ecommerce -->

<!-- Your custom styles (optional) -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<!------ Include the above in your HEAD tag ------>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/manager.css" rel="stylesheet" type="text/css" />

<style>
body {
	margin: 0;
	padding: 0;
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">


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

td, th {
	text-align: center;
}

p {
	font-size: 12px;
}

img {
	width: 150px;
	height: 120px;
}
</style>
<%
DAO dao = new DAO();
List<Product> ListProduct = dao.getAllProduct();
List<OrderDetail> ListOrder = dao.getListOrder();
List<Invoice> ListInvoice = dao.getListInvoice();
%>
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
								<strong>Chi tiết đơn hàng</strong>
							</h5>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover text-nowrap">
								<thead>
								<h5 >Thông tin khách hàng</h5>
									<tr>
										<th scope="col" class="border-1 bg-light ">Tên khách hàng</th>
										
										<th scope="col" class="border-1 bg-light">Địa chỉ</th>
										<th scope="col" class="border-1 bg-light">Số điện thoại</th>
										<th scope="col" class="border-1 bg-light">Email</th>
										
										
									</tr>
								</thead>
								
								<tbody id="content">
								
									<tr>
										
										<td>${detail.name}</td>
										
										<td>${detail.address}</td>
										<td>${detail.phone}</td>	
										<td>${detail.email}</td>
										
									</tr>
								</tbody>
							</table>
							<table class="table table-hover text-nowrap">
								<thead>
								<h5>Thông tin sản phẩm</h5>
									<tr>
										<th scope="col" class="border-1 bg-light ">Sản phẩm</th>
										<th scope="col" class="border-1 bg-light ">Số lượng</th>
										<th scope="col" class="border-1 bg-light ">Kích thước</th>
										<th scope="col" class="border-1 bg-light ">Màu sắc</th>
										<th scope="col" class="border-1 bg-light ">Giá</th>
									</tr>
								</thead>
								
								<tbody id="content">
									<%
									
									OrderDetail m= (OrderDetail)request.getAttribute("detail");
									Invoice i=dao.getInvoice(String.valueOf(m.getOrderID()));
									int s=0;
									for (Product p : ListProduct) {
								for (OrderDetail o : ListOrder) {
									
									if (o.getProductID() == p.getId() && i.getmaHD() == o.getOrderID()) {
										s=o.getStatus();
								%>
									<tr>
										
										<td><img src="${pageContext.request.contextPath }/images/<%=p.getImage()%>">
										<p><%=p.getName()%></p></td>
										<td><%=o.getAmount()%></td>
										<td><%=o.getSize()%></td>
										<td><%=p.getColor()%></td>
										<td><%=p.getPrice()%>$</td>
										
									</tr>
									<%}}} %>
									<tr><td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>Tổng: <%=i.getTongGia() %>$</td></tr>
								</tbody>
							</table>
							
							<div class="form-group">
							<label>Trạng thái</label> <select name="status"  class="form-select" id="status"
								aria-label="Default select example">
								<%  if(request.getAttribute("status")==null){%>
								<option  value="0" <%if(s==0){%>SELECTED<%} %>>Chưa vận chuyển</option>
								<option value="1" <%if(s==1){%>SELECTED<%} %>>Đã vận chuyển</option>
							<%}else{%>
								
								<option  value="0" <% if(request.getAttribute("status").equals("0")){%>SELECTED <%} %>>Chưa vận chuyển</option>
								<option value="1" <% if(request.getAttribute("status").equals("1")){%>SELECTED <%} %>>Đã vận chuyển</option>
						<%}%>
							</select>
						</div>
						<div class="modal-footer">
						<a id="statusLink" onclick="updateStatusValue()" href="#"><button
						 class="btn btn-success">Submit</button></a>
			
					<a href="DonHang.jsp"><input type="button"
									class="btn btn-default" data-dismiss="modal" value="Cancel"></a>
						
						</div>
					</div>
				</div>
		</div>
		</section>
		<!--Section: Sales Performance KPIs-->



		</div>
	</main>
	</body>
 <script>
        // Hàm được gọi khi giá trị của thẻ select thay đổi
        function updateStatusValue() {
            // Lấy giá trị mới từ thẻ select
            var statusValue = document.getElementById("status").value;

            // Cập nhật giá trị của thẻ a
            var link = document.getElementById("statusLink");
            link.href = "hoaDon?id=${detail.orderID}&status=" + statusValue;
        }
    </script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
	</script>

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
	<script>
		function searchByDate(param) {
			var txtSearchDate = param.value;
			$
					.ajax({
						url : "/WebsiteBanGiay/searchAjaxHoaDon",
						type : "get", //send it through get method
						data : {
							ngayXuat : txtSearchDate
						},
						success : function(responseData) {
							document.getElementById("content").innerHTML = responseData;
						}

					});
		}
	</script>

</html>