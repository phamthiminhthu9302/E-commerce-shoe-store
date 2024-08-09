package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.Account;

@WebServlet(name = "EditAccountControl", urlPatterns = { "/editAccount" })
public class EditAccountControl extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");

		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		int isSell = 0;
		int isAdmin = 0;
		int isCustomer = 0;
		if(request.getParameter("is")!=null) {
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
		DAO dao = new DAO();
		String error;

		Account b = dao.checkAccountExistByID(id);
		Account a = dao.checkAccountExistByUsernameAndEmail(user, email);

		/*
		 * if (b!=null &&a!=null) {
		 * if(a.getId()==b.getId()) {
		 * if(b.getPass()!=pass||b.getIsSell()!=isSell||b.getIsAdmin()!=isAdmin||b.
		 * getIsCustomer()!=
		 * isCustomer) {
		 */
						 String sucess;
						 sucess = "Edited!";
						 dao.editAccount(id,user, pass, isSell, isAdmin, email, isCustomer);
						 response.getWriter().write(sucess);
							/*
							 * }
							 * 
							 * else {
							 * if(!email.equals(b.getEmail())||user.equals(b.getUser())) {
							 * String sucess;
							 * sucess = "Edited!";
							 * dao.editAccount(id,user, pass, isSell, isAdmin, email, isCustomer);
							 * response.getWriter().write(sucess);
							 * }else {
							 * String sucess;
							 * sucess = "No Edited!";
							 * response.getWriter().write(sucess);
							 * }
							 * 
							 * }
							 * 
							 * }
							 * 
							 * }
							 */
	

							/*
							 * Account c = dao.checkAccountExist(user);
							 * Account d = dao.checkAccountExistByEmail(email);
							 * if (a == null) {
							 * 
							 * if (c!= null ) {
							 * if (d!= null ) {
							 * error = "Username và email đã tồn tại";
							 * response.getWriter().write(error);
							 * 
							 * }else {
							 * error = "Username đã tồn tại";
							 * response.getWriter().write(error);
							 * 
							 * }
							 * 
							 * }else {
							 * if (d != null) {
							 * 
							 * error = "Email đã tồn tại";
							 * response.getWriter().write(error);
							 * 
							 * } else {
							 * if(b.getPass() != pass ||
							 * b.getIsSell()!=isSell||b.getIsAdmin()!=isAdmin||b.getIsCustomer()!=
							 * isCustomer) {
							 * String sucess;
							 * sucess = "Edited!";
							 * dao.editAccount(id,user, pass, isSell, isAdmin, email, isCustomer);
							 * response.getWriter().write(sucess);
							 * }
							 * String sucess;
							 * dao.editAccount(id,user, pass, isSell, isAdmin, email, isCustomer);
							 * sucess = "Edited!";
							 * response.getWriter().write(sucess);
							 * 
							 * }
							 * 
							 * }
							 * }
							 */

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
