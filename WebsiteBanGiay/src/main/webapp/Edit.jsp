<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page
	import="dao.DAO,entity.Category,entity.Invoice,entity.Account,entity.Product,entity.OrderDetail,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/manager.css" rel="stylesheet" type="text/css" />
<% 
Account a = (Account) session.getAttribute("acc");
if (a == null) {
	response.sendRedirect("login");
	return;
}
DAO dao = new DAO();
int checkIsAdmin = dao.checkAccountAdmin(a.getId());
Product p= (Product)request.getAttribute("detail");
%>
<style>
img {
	width: 200px;
	height: 120px;
}
input[type="file"]{
color:transparent;

}
</style>
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
					<form id="addEmployeeForm" method="post" action="edit"enctype="multipart/form-data">
						<div class="modal-header">
							<h4 class="modal-title">Edit Product</h4>
							<a href="manager"><button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button></a>
						</div>
						<div class="modal-body">
						<div class="form-group">

								<% if(p.getId()!=0){%>
									<input value="<%=p.getId()%>" name="id" id="id" type="hidden"
										class="form-control" readonly required>
							
								<%}
								if (request.getParameter("id") != null) {%>
								<input value="<%=request.getParameter("id")%>" name="id" id="id"
									type="hidden" class="form-control" readonly required>
								<%
								}
								%>
							</div>
					<div class="form-group">
							<div class="alert alert-danger" id="err_name" role="alert"
								style="display: none;"></div>
								<%if(p.getName()!=null){  %>
							<label>Name</label> <input name="name" id="name" type="text" value="<%=p.getName() %>"
								class="form-control" required>
								<%}
								if (request.getParameter("name") != null) {%>
									<label>Name</label>  
									<input name="name" id="name" type="text" value="<%=request.getParameter("name") %>"
								class="form-control" required>
								<%
								}
								%>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_img" role="alert"
								style="display: none;"></div>
								<%if(p.getImage()!=null){  %>
							<label>Image </label>  <br>
							<img src="${pageContext.request.contextPath }/images/<%=p.getImage() %>" id="imageP">
							<input type="file" id="image" name="image"
								accept="image/*" required onchange="PreviewImage();">
								<%}
								if (request.getParameter("image") != null) {%>
								<label>Image </label> <br>
								<img src="${pageContext.request.contextPath }/images/<%=request.getParameter("image") %>" id="imageP">
								<input type="file" id="image"
								accept="image/*" required onchange="PreviewImage();">
								<%
								}
								%>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_price" role="alert"
								style="display: none;"></div>
								<%if(p.getPrice()!=0){  %>
							<label>Price</label> <input name="price" min="1" id="price" value="<%=p.getPrice() %>"
								type="number" class="form-control">
									<%}
								if (request.getParameter("price") != null) {%>
									<label>Price</label> <input name="price" min="1" id="price" value="<%=request.getParameter("price") %>"
								type="number" class="form-control">
								<%
								}
								%>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_count" role="alert"
								style="display: none;"></div>
									<%if(p.getCount()!=-1){  %>
							<label>Amount</label> <input name="count" min="0" id="count" value="<%=p.getCount() %>"
								type="number" class="form-control">
									<%}
								if (request.getParameter("count") != null) {%>
								<label>Amount</label> <input name="count" min="0" id="count" value="<%=request.getParameter("count") %>"
								type="number" class="form-control">
									<%
								} 
								%>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_title" role="alert"
								style="display: none;"></div>
								<%if(p.getTitle()!=null){  %>
							<label>Title</label>
							<textarea name="title" id="title" class="form-control" required><%=p.getTitle() %></textarea>
								<%}
								if (request.getParameter("title") != null) {%>
								<label>Title</label>
									<textarea name="title" id="title" class="form-control"required><%=request.getParameter("title")%></textarea>
								<%
								}
								%>
						</div>
						<div class="form-group">
							<div class="alert alert-danger" id="err_size" role="alert"
								style="display: none;"></div>
								
							<label>Size</label> 
							<% if(p.getSize()!=null){
							String[] size=p.getSize().split(" "); 
							%>
							<input type="checkbox" name="size"
								value="Small" id="small" <% for(String i : size){ if(i.equals("Small")){%>
									 checked
							<% 	}}%>>Small 
							<input type="checkbox" name="size" value="Medium" id="medium" <% for(String i : size){ if(i.equals("Medium")){%>
									 checked
							<% 	}}%>>Medium
							<input type="checkbox" name="size" value="Large" <% for(String i : size){ if(i.equals("Large")){%>
									 checked
							<% 	}}%>
								id="large">Large
								<%}
								if (request.getParameterValues("size") != null) {
									String[] size=request.getParameterValues("size"); 
								%>
								
								<input type="checkbox" name="size"
								value="Small" id="small" <% for(String i : size){ if(i.equals("Small")){%>
									 checked
							<% 	}}%>>Small 
							<input type="checkbox" name="size" value="Medium" id="medium" <% for(String i : size){ if(i.equals("Medium")){%>
									 checked
							<% 	}}%>>Medium
							<input type="checkbox" name="size" value="Large" <% for(String i : size){ if(i.equals("Large")){%>
									 checked
							<% 	}}%>
								id="large">Large
								<%
								}
								%>
						</div>

						<div class="form-group">
						<%if(p.getColor()!=null){  %>
							<label>Color</label> <select name="color" class="form-select"
								aria-label="Default select example">

								<option value="White"<% if(p.getColor().equals("White")){%>SELECTED <%} %>>White</option>
								<option value="Gray"<% if(p.getColor().equals("Gray")){%>SELECTED <%} %>>Gray</option>
								<option value="Black" <% if(p.getColor().equals("Black")){%>SELECTED <%} %>>Black</option>
								<option value="Green" <% if(p.getColor().equals("Green")){%>SELECTED <%} %>>Green</option>
								<option value="Blue" <% if(p.getColor().equals("Blue")){%>SELECTED <%} %>>Blue</option>
								<option value="Purple" <% if(p.getColor().equals("Purple")){%>SELECTED <%} %>>Purple</option>
								<option value="Yellow" <% if(p.getColor().equals("Yellow")){%>SELECTED <%} %>>Yellow</option>
								<option value="Indigo" <% if(p.getColor().equals("Indigo")){%>SELECTED <%} %>>Indigo</option>
								<option value="Red" <% if(p.getColor().equals("Red")){%>SELECTED <%} %>>Red</option>
								<option value="Orange" <% if(p.getColor().equals("Orange")){%>SELECTED <%} %>>Orange</option>

							</select>
							<%}
								if (request.getParameter("color") != null) {%>
								<label>Color</label> <select name="color" class="form-select"
								aria-label="Default select example">

								<option value="White"<% if(request.getParameter("color").equals("White")){%>SELECTED <%} %>>White</option>
								<option value="Gray"<% if(request.getParameter("color").equals("Gray")){%>SELECTED <%} %>>Gray</option>
								<option value="Black" <% if(request.getParameter("color").equals("Black")){%>SELECTED <%} %>>Black</option>
								<option value="Green" <% if(request.getParameter("color").equals("Green")){%>SELECTED <%} %>>Green</option>
								<option value="Blue" <% if(request.getParameter("color").equals("Blue")){%>SELECTED <%} %>>Blue</option>
								<option value="Purple" <% if(request.getParameter("color").equals("Purple")){%>SELECTED <%} %>>Purple</option>
								<option value="Yellow" <% if(request.getParameter("color").equals("Yellow")){%>SELECTED <%} %>>Yellow</option>
								<option value="Indigo" <% if(request.getParameter("color").equals("Indigo")){%>SELECTED <%} %>>Indigo</option>
								<option value="Red" <% if(request.getParameter("color").equals("Red")){%>SELECTED <%} %>>Red</option>
								<option value="Orange" <% if(request.getParameter("color").equals("Orange")){%>SELECTED <%} %>>Orange</option>

							</select>
								<%
								}
								%>
						</div>

						<div class="form-group">
						<div class="alert alert-danger" id="err_des" role="alert"
								style="display: none;"></div>
						<%if(p.getDescription()!=null){  %>
							<label>Description</label>
							<textarea name="description" id="description" 
								class="form-control"><%=p.getDescription() %></textarea>
								<%}
								if (request.getParameter("description") != null) {%>
								
							<label>Description</label>
							<textarea name="description" id="description" 
								class="form-control"><%=request.getParameter("description") %></textarea>
								<%
								}
								%>
						</div>
						<div class="form-group">
							<%
							if(request.getParameter("pid")!=null){  
							String id = request.getParameter("pid");
							Product x = dao.getProductByID(id);
							List<Category> list = dao.getAllCategory();
							%>
							
								<label>Category</label> 
								<select name="category"
									class="form-select" aria-label="Default select example">

									<%
									for (Category c : list) {
									%>

									<option value="<%=c.getCid()%>" <% if(x.getCateID()==c.getCid()){%>
										SELECTED <%}%>>
										<%=c.getCname()%></option>


									<%
									}}List<Category> list = dao.getAllCategory();
									int temp=0;
									if (request.getParameter("category") != null) {
										temp=Integer.parseInt(request.getParameter("category"));
									 %>
									
									<label>Category</label> 
								<select name="category"
									class="form-select" aria-label="Default select example">
									<%
									for (Category c : list) {
									%>
									<option value="<%=c.getCid()%>" <% if(temp==c.getCid()){%>
										SELECTED <%}%>>
										<%=c.getCname()%></option>
									<%
								}}
								%>


								</select>
							</div>

						</div>
							<div class="modal-footer">
								<a href="manager"><input type="button"
									class="btn btn-default" data-dismiss="modal" value="Cancel"></a>
								<input type="button" onclick="Edit()" class="btn btn-success"
									value="Edit">
									
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>


	<script src="js/manager.js" type="text/javascript"></script>
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
	
	<script>
	
	   function PreviewImage() {
		   
	        var oFReader = new FileReader();
	        oFReader.readAsDataURL(document.getElementById("image").files[0]);

	        oFReader.onload = function (oFREvent) {
	            document.getElementById("imageP").src = oFREvent.target.result;
	          
	        };
	    };

	
			function Edit() {
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
					var formData = new FormData(document.getElementById('addEmployeeForm'));
					$
							.ajax({

								url : "/WebsiteBanGiay/edit",
								 type: "post", // send it through get method
								    data: formData,
							        contentType: false,
							        processData: false,

								success : function(responseData) {

									if (responseData == "Edited!") {
										window.location.href = "/WebsiteBanGiay/manager";
										document.getElementById("sucess").innerHTML = responseData;
										document.getElementById("sucess").style.display = "block";
	

									}
									if (responseData == "No Edited!") {
										window.location.href = "/WebsiteBanGiay/manager";
										

									}

								}
							});
				}
			}
		</script>
</body>
</html>