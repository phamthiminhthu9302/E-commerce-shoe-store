
package control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import dao.DAO;
import entity.Product;
import entity.SoLuongDaBan;





@WebServlet(name = "XuatExcelTop10ProductControl", urlPatterns = {"/xuatExcelTop10ProductControl"})
public class XuatExcelTop10ProductControl extends HttpServlet {
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAO dao = new DAO();
        List<Product> listAllProduct = dao.getAllProduct();
        List<SoLuongDaBan> listTop10Product = dao.getTop10SanPhamBanChay();



        int maximum=2147483647;
        int minimum=1;

        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum =  rn.nextInt(range) + minimum;


        FileOutputStream file=new FileOutputStream("C:\\ExcelWebBanGiay\\"+"top-10-san-pham-ban-chay-"+Integer.toString(randomNum)+".xlsx");
        XSSFWorkbook workbook=new XSSFWorkbook();
        XSSFSheet workSheet=workbook.createSheet("1");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;
        XSSFCell cell4;
        XSSFCell cell5;
    

        row=workSheet.createRow(0);
        cell0=row.createCell(0);
        cell0.setCellValue("ID");
        cell1=row.createCell(1);
        cell1.setCellValue("Name");
        cell2=row.createCell(2);
        cell2.setCellValue("Image");
        cell3=row.createCell(3);
        cell3.setCellValue("Price");
       
        cell4=row.createCell(4);
        cell4.setCellValue("Số lượng đã bán");

        int i=0;


		
		 for (SoLuongDaBan soluong : listTop10Product) {
		 for (Product pro : listAllProduct) {
		 if(soluong.getProductID() == pro.getId()) {
		 i=i+1;
		 row=workSheet.createRow(i);
		 cell0=row.createCell(0);
		 cell0.setCellValue(pro.getId());
		 cell1=row.createCell(1);
		 cell1.setCellValue(pro.getName());
		 cell2=row.createCell(2);
		 cell2.setCellValue(pro.getImage());
		 cell3=row.createCell(3);
		 double price=pro.getPrice();
		 cell3.setCellValue(price+"$");
		  cell4=row.createCell(4);
		 cell4.setCellValue(soluong.getSoLuongDaBan());
		 }
		 }
		 }
	

        workbook.write(file);
        workbook.close();
        file.close();

        request.setAttribute("mess", "Đã xuất file Excel thành công!");
        request.getRequestDispatcher("top10").forward(request, response);
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
