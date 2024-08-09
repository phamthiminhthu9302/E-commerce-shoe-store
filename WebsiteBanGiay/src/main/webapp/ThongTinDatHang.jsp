
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page
	import="dao.DAO,entity.Invoice,entity.Account,entity.Product,entity.OrderDetail,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
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

h3.p-2.px-3 {
	margin-left: 480px;
}
</style>
</head>
<% 
Account a = (Account) session.getAttribute("acc");
if(a == null) {
	response.sendRedirect("login");
	return;
}
int accountID = a.getId();
DAO dao = new DAO();
List<Product> ListProduct= dao.getAllProduct();
List<Invoice> ListInvoice = new ArrayList<>();
List<OrderDetail>ListOrder_=dao.FindOrderByIDAccount(accountID);
Invoice temp= new Invoice();
for(OrderDetail o: ListOrder_){
	if(ListInvoice==null){
		ListInvoice.add(dao.getInvoice(String.valueOf(o.getOrderID())));
		temp.setmaHD(o.getOrderID());
	}else{
		if(temp.getmaHD()!=o.getOrderID()){
			ListInvoice.add(dao.getInvoice(String.valueOf(o.getOrderID())));
			temp.setmaHD(o.getOrderID());
		}
	}
	
}

%>

<body onload="loadTotalMoney()">
	<jsp:include page="Menu.jsp"></jsp:include>
	<div class="shopping-cart">
		<div class="px-4 px-lg-0">
			<div class="pb-5">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

							<!-- Shopping cart table -->
							<div class="table-responsive" style="padding-top: 30px;">
							
								<table class="table">
									<thead>

										<tr>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">Mã đơn hàng</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">Sản phẩm</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">Giá</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">Màu sắc</div>
											</th>
											
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">Kích thước</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">Số lượng</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">Trạng thái</div>
											</th>
											
										</tr>
									</thead>

									<% 
									
									
									
									int count=0;
									
								for (Invoice i : ListInvoice) {
									count++;
                     			for(OrderDetail o: ListOrder_){
									for(Product p: ListProduct){ 
						
							if (o.getProductID() == p.getId() && i.getmaHD()==o.getOrderID() ) {
							
							
							%>

									<tbody>
										<tr>
											<td class="align-middle"><strong><%=o.getOrderID()%></strong></td>
											<th scope="row">
												<div class="p-2">
													<div class="ml-2 align-middle">
														<img src="${pageContext.request.contextPath }/images/<%=p.getImage()%>" alt="Card image cap"> <br>
														<h7 class="mb-0"><%=p.getName()%></h7>

													</div>
											</th>
											<td class="align-middle"><strong><%=p.getPrice()%>$</strong></td>
											<td class="align-middle"><strong><%=p.getColor()%></strong></td>
											
											<td class="align-middle"><strong><%=o.getSize()%></strong></td>
											<td class="align-middle"><strong><%=o.getAmount()%></strong></td>
											<%if(o.getStatus()==0){%>
											<td class="align-middle"><strong>Đã đặt hàng</strong></td>
											<%}else{ %>
											<td class="align-middle"><strong>Đang vận
													chuyển</strong></td>
											<% }}}}%>
										</tr>
											<tr>
											<td class="align-middle"><strong></strong></td>
											<td class="align-middle"><strong></strong></td>
											<td class="align-middle"><strong></strong></td>
											<td class="align-middle"><strong></strong></td>
											<td class="align-middle"><strong></strong></td>
											<td class="align-middle"><strong></strong></td>
											<td class="align-middle"><strong>Tổng: <%=i.getTongGia()%>$</strong></td>
										</tr>
										<% }%>
										
									</tbody>
								
									
								</table>
								<div>  <% if(count==0){ %>
                                           
                                               <h3 style="padding-left:450px;">Chưa có đơn hàng</h3>
                                                
                                            <%}%></div>
                                </div>
							</div>
							
							<!-- End -->
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <script>
		function loadTotalMoney() {
			$
					.ajax({
						url : "/WebsiteBanGiay/totalMoneyCart",
						type : "get", //send it through get method
						data : {

						},
						success : function(responseData) {
							document.getElementById("contentTotalMoney").innerHTML = responseData;
						}
					});
		}

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
</html>
