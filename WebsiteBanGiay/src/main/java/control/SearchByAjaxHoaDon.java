/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.Account;
import entity.Invoice;
import entity.OrderDetail;

@WebServlet(name = "SearchByAjaxHoaDon", urlPatterns = { "/searchAjaxHoaDon" })
public class SearchByAjaxHoaDon extends HttpServlet {

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
		String ngayXuat = request.getParameter("ngayXuat");
		DAO dao = new DAO();
		List<Invoice> listInvoiceByDate = dao.searchByNgayXuat(ngayXuat);
		List<OrderDetail> ListOrder = dao.getListOrderSucess();
		PrintWriter out = response.getWriter();
		double tongGia;
		Account accountCus= new Account();
		Account accountSale= new Account();
		int mahd = 0;

		for (OrderDetail r : ListOrder) {
			for (Invoice o : listInvoiceByDate) {
					if (r.getOrderID() == o.getmaHD() && mahd != o.getmaHD()) {
						accountCus = dao.FindAccountByID(r.getAccountID());
						accountSale = dao.FindAccountByID(o.getAccountID());
						mahd = o.getmaHD();
						out.println("<tr>"

							+ "                  <td>" + o.getmaHD() + "</td>"
							+ "                  <td>" + accountCus.getUser() + "</td>"
							+ "                  <td>" + accountSale.getUser() + "</td>"
							+ "                  <td>" + o.getTongGia() + "$</td>"
							+ "                  <td>" + o.getNgayXuat() + "</td> "
							+ "                </tr>");
				}
					}



			}
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
