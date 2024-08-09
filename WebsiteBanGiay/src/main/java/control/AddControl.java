/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.DAO;


@WebServlet(name = "AddControl", urlPatterns = {"/addP"})
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)
public class AddControl extends HttpServlet {
    private static final long serialVersionUID = 205242440643911308L;
	 private static final String UPLOAD_DIR = "images";

	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
		    response.setContentType("text/html;charset=UTF-8");
		    request.setCharacterEncoding("UTF-8");

		    String pname = request.getParameter("name");
		    String pprice = request.getParameter("price");
		    String pcount = request.getParameter("count");
		    String ptitle = request.getParameter("title");
		    String[] psize = request.getParameterValues("size");
		    String pcolor = request.getParameter("color");
		    String pdescription = request.getParameter("description");
		    String pcategory = request.getParameter("category");

		    String size = "";
		    int count = psize.length;
		    for (String s : psize) {
		        if (count > 1) {
		            size += s + " ";
		            count--;
		        } else {
		            size += s;
		        }
		    }

		    Part filePart = request.getPart("image"); // "file" is the name attribute in your HTML form for the file input
		    String fileName = getFileName(filePart);
		    String applicationPath = request.getServletContext().getRealPath("");
		    String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
		    File fileSaveDir = new File(uploadFilePath);
		    if (!fileSaveDir.exists()) {
		        fileSaveDir.mkdirs();
		    }
		    System.out.println("Upload File Directory=" + fileSaveDir.getAbsolutePath());

		    filePart.write(uploadFilePath + File.separator + fileName);


        DAO dao = new DAO();
       dao.insertProduct(pname,  fileName , pprice, ptitle, pdescription, pcategory, pcolor, size,pcount);
		 response.getWriter().write("Product Added!"); 
      
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }


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
