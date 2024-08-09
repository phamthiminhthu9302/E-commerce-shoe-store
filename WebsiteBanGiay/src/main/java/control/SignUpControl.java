/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.Account;

@WebServlet(name = "SignUpControl", urlPatterns = { "/signup" })
public class SignUpControl extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		String re_pass = request.getParameter("repass");
		String email = request.getParameter("email");
		String error = "";
	
		Account b = new Account();
		b.setUser(user);
		b.setEmail(email);
		b.setPass(pass);
		request.setAttribute("account", b);
		request.setAttribute("re_pass", re_pass);
		
		DAO dao = new DAO();
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
						if (!pass.equals(re_pass)) {
							error = "Mật khẩu không trùng nhau";
							response.getWriter().write(error);

						} else {
							String sucess;
							dao.singup(user, pass, email);
							sucess = "Sign Up Success";
							response.getWriter().write(sucess);
							
						}
					}

				}
			} else {
				error = "Username và email đã tồn tại";
				response.getWriter().write(error);
			}


		// sign up
	}

	
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
