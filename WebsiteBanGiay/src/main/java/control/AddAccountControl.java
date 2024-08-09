/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * author: H.M.Duc
 */
package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.Account;

@WebServlet(name = "AddAccountControl", urlPatterns = { "/addAccount" })
public class AddAccountControl extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @return
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		int isSell = 0;
		int isAdmin = 0;
		String email = request.getParameter("email");
		int isCustomer = 0;
		if (request.getParameter("is") != null) {
			if (request.getParameter("is").equals("isSell")) {

				isSell = 1;
			}
			if (request.getParameter("is").equals("isAdmin")) {
				isAdmin = 1;
			}
			if (request.getParameter("is").equals("isCustomer")) {
				isCustomer = 1;
			}
		}

		String error = "";
		response.setContentType("text/html;charset=UTF-8");

		request.setCharacterEncoding("UTF-8");
		DAO dao = new DAO();
		Account b = new Account();
		b.setUser(user);
		b.setEmail(email);
		b.setPass(pass);
		request.setAttribute("account", b);
		Account a = dao.checkAccountExistByUsernameAndEmail(user, email);

		if (a == null) {
			Account c = dao.checkAccountExist(user);
			Account d = dao.checkAccountExistByEmail(email);
			if (c != null) {
				if (d != null) {
					error = "Username và email đã tồn tại";
					response.getWriter().write(error);

				} else {

					error = "Username đã tồn tại";
					response.getWriter().write(error);

				}

			} else {
				if (d != null) {

					error = " Email đã tồn tại";
					response.getWriter().write(error);

				} else {
					String sucess;

					dao.insertAccount(user, pass, isSell, isAdmin, email, isCustomer);
					sucess = "Account Added!";
					response.getWriter().write(sucess);
				}

			}
		} else {
			error = "Username và email đã tồn tại";
			response.getWriter().write(error);

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
