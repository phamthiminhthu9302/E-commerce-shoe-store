package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;
import entity.Supplier;
@WebServlet(name = "EditSupplierControl", urlPatterns = {"/editSupplier"})
public class EditSupplierControl extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 response.setContentType("text/html;charset=UTF-8");
         request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String nameSupplier = request.getParameter("nameSupplier");
        String phoneSupplier = request.getParameter("phoneSupplier");
        String emailSupplier = request.getParameter("emailSupplier");
        String addressSupplier = request.getParameter("addressSupplier");
        String cateID = request.getParameter("cateID");

        DAO dao = new DAO();
        Supplier x = dao.getSupplierByID(id);
        if(x.getAddressSupplier().equals(addressSupplier) && x.getCateID()==Integer.parseInt(cateID)&&
        		x.getEmailSupplier().equals(emailSupplier)&& x.getNameSupplier().equals(nameSupplier)&&
        		x.getPhoneSupplier().equals(phoneSupplier)) {
        	 String mess;
			 mess = "No Edited!";
			 response.getWriter().write(mess);		
		}else {
			  String sucess;
		        sucess = "Edited!";
				dao.editSupplier(nameSupplier, phoneSupplier, emailSupplier, addressSupplier, cateID,id);
				response.getWriter().write(sucess);
        }
      
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
