/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.DAO;
import entity.Product;


@WebServlet(name = "EditControl", urlPatterns = {"/edit"})
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)
public class EditControl extends HttpServlet {

	  private static final long serialVersionUID = 205242440643911308L;
		 private static final String UPLOAD_DIR = "images";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 response.setContentType("text/html;charset=UTF-8");
         request.setCharacterEncoding("UTF-8");
         String id = request.getParameter("id");
         String pname = request.getParameter("name");
         String pcount = request.getParameter("count");
         String [] psize = request.getParameterValues("size");
         String pcolor = request.getParameter("color");
         String pprice = request.getParameter("price");
         String ptitle = request.getParameter("title");
         String pdescription = request.getParameter("description");
         String pcategory = request.getParameter("category");
         String size="";
       
         int count=psize.length;
         for (String s : psize) {
         	if(count>1) {
         		  size+=s+" ";
         		  count--;
         	}else {
         		 size+=s;
         	}
         }
         DAO dao = new DAO();
        Product pimage =new Product();
        Part filePart = request.getPart("image");
        if(getFileName(filePart)=="") {
        	 pimage=dao.getProductByID(id);
        		if(pname.equals(pimage.getName())  && Integer.parseInt(pcount)== pimage.getCount() &&
        		size.equals(pimage.getSize())&&pcolor.equals(pimage.getColor())&&
        		Double.parseDouble(pprice)== pimage.getPrice() &&ptitle.equals( pimage.getTitle())&&
        		pdescription.equals(pimage.getDescription())&&pimage.getCateID()==Integer.parseInt(pcategory)) {
        										
        			 String mess;
    				 mess = "No Edited!";
    				 response.getWriter().write(mess);		
        		}else {
				  String mess;
				  mess = "Edited!";
				  dao.editProduct(pname, pimage.getImage() , pprice, ptitle, pdescription,
				  pcategory, pcolor, size,pcount, id);
				 response.getWriter().write(mess);
				 }
				
        }else {
        	
  		    String fileName = getFileName(filePart);
  		    String applicationPath = request.getServletContext().getRealPath("");
  		    String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
  		    File fileSaveDir = new File(uploadFilePath);
  		    if (!fileSaveDir.exists()) {
  		        fileSaveDir.mkdirs();
  		    }
  		 filePart.write(uploadFilePath + File.separator + fileName);
     		 String mess;
     		 mess = "Edited!";
     		 dao.editProduct(pname,  fileName , pprice, ptitle, pdescription, pcategory, pcolor, size,pcount, id);
			 response.getWriter().write(mess);
     	}
        
         
         
       
		   

		   
      
     
    }
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
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
