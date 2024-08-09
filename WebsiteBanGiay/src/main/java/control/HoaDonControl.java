/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;
import entity.Invoice;
import entity.OrderDetail;
import entity.Product;
import entity.SoLuongDaBan;
import entity.TongChiTieuBanHang;

@WebServlet(name = "HoaDonControl", urlPatterns = { "/hoaDon" })
public class HoaDonControl extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Account a = (Account) session.getAttribute("acc");
		if (a == null) {
			response.sendRedirect("login");
			return;
		}
		DAO dao = new DAO();
		int accountID = a.getId();
		int id = Integer.parseInt(request.getParameter("id"));
		List<Invoice> ListInvoice = dao.getListInvoice();
		
		Invoice invoice=dao.getInvoice(String.valueOf(id));
		List<OrderDetail> listorder= dao.getListOrder();
		 int pcount=0;
		 String status=request.getParameter("status");
		
				
				dao.UpdateOrder(id,status);
			
		 if(status.equals("1") ) {
			 if(invoice.getNgayXuat()==null) {
		 
				for (Invoice i : ListInvoice) {
					for(OrderDetail c : listorder) {
						if(c.getOrderID()==i.getmaHD()&& i.getmaHD() == id  ) {
							SoLuongDaBan s = dao.checkSoLuongDaBanExist(c.getProductID());
							if(s == null) {
								dao.insertSoLuongDaBan(c.getProductID(), c.getAmount());
								pcount=dao.getProductCount(c.getProductID());
								pcount-=c.getAmount();
								dao.editProductCount(pcount,c.getProductID());
							}
							else {
								dao.editSoLuongDaBan(c.getProductID(), c.getAmount());
								pcount=dao.getProductCount(c.getProductID());
								pcount-=c.getAmount();
								dao.editProductCount(pcount,c.getProductID());
							}
						}	
					
						
					}
					if ( i.getmaHD() == id   ) {
						
						TongChiTieuBanHang t2 = dao.checkTongChiTieuBanHangExist(accountID);
						if (t2 == null) {
							dao.insertTongChiTieuBanHang(accountID, 0, i.getTongGia());
						} else {
							dao.editTongBanHang(accountID, i.getTongGia());
						}
						
					}
				
			
		}
			
					dao.UpdateTrans(accountID, id);
				
		 }
		 }
		 OrderDetail p = new OrderDetail();
	      
	        for (OrderDetail o : listorder) {
					if ( id==o.getOrderID()) {
						p.setName(o.getName());
						p.setPhone(o.getPhone());
						p.setAddress(o.getAddress());
						p.setEmail(o.getEmail());
						p.setOrderID(o.getOrderID());
					}
	        }
		 request.setAttribute("detail", p);
		 request.getRequestDispatcher("DonHangDetail.jsp").forward(request, response);
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
