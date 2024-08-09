<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- Sidebar -->
  <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white" style="padding: 0px">
    <div class="position-sticky">
      <div class="list-group list-group-flush mx-3 mt-4">
    
        <a href="admin" class="list-group-item list-group-item-action" aria-current="true"> 
          <i class="fas fa-tachometer-alt fa-fw me-3"></i><span> Main dashboard</span>
        </a>
         
        <a href="doanhThuTheoThu" class="list-group-item list-group-item-action ">
          <i class="fas fa-chart-pie fa-fw me-3"></i><span> Danh thu thứ</span>
        </a>
         <a href="doanhThuTheoThang" class="list-group-item list-group-item-action ">
          <i class="fas fa-chart-bar fa-fw me-3"></i><span> Doanh thu tháng</span>
        </a>
        <a href="DonHang.jsp" class="list-group-item list-group-item-action"><i class="fas fa-file-invoice-dollar fa-fw me-3"></i><span>Quản lý đơn hàng</span></a>
        <a href="HoaDon.jsp" class="list-group-item list-group-item-action "><i class="fas fa-file-invoice-dollar fa-fw me-3"></i><span> Quản lý hóa đơn</span></a>
         
         <a href="managerAccount" class="list-group-item list-group-item-action ">
          <i class="fas fa-user-circle fa-fw me-3"></i><span> Quản lý tài khoản</span>
        </a>
       
        <a href="manager" class="list-group-item list-group-item-action ">
          <i class="fas fa-shoe-prints fa-fw me-3"></i><span> Quản lý sản phẩm</span>
        </a>
        <a href="top10" class="list-group-item list-group-item-action ">
          <i class="fas fa-shoe-prints fa-fw me-3"></i><span> Top 10 sản phẩm</span>
        </a>
        <a href="top5khachhang" class="list-group-item list-group-item-action ">
          <i class="fas fa-user-circle fa-fw me-3"></i><span> Top 5 khách hàng</span>
        </a>
        <a href="top5nhanvien" class="list-group-item list-group-item-action ">
          <i class="fas fa-user-circle fa-fw me-3"></i><span> Top 5 nhân viên</span>
        </a>
         <a href="managerSupplier" class="list-group-item list-group-item-action ">
          <i class="fas fa-parachute-box fa-fw me-3"></i><span> Quản lý nhà cung cấp</span>
        </a>
        <a href="logout" class="list-group-item list-group-item-action ">
       <i class="fas fa-sign-in-alt"></i><span> Đăng xuất</span>
        </a>
      </div>
    </div>
  </nav>
  <!-- Sidebar -->