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
import entity.Cart;
import entity.Email;
import entity.EmailUtils;
import entity.Invoice;
import entity.OrderDetail;
import entity.Product;
import entity.SoLuongDaBan;
import entity.TongChiTieuBanHang;

/**
 * Servlet implementation class ForgotPasswordControl
 */
@WebServlet(name = "OrderControl", urlPatterns = {"/order"})
public class OrderControl extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String emailAddress = request.getParameter("email");
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");
		String deliveryAddress = request.getParameter("deliveryAddress");
	
		

			try {
				 HttpSession session = request.getSession();
			        Account a = (Account) session.getAttribute("acc");
			        if(a == null) {
			        	response.sendRedirect("login");
			        	return;
			        }
			        int accountID = a.getId();
			        DAO dao = new DAO();
			        List<Cart> list = dao.getCartByAccountID(accountID);
			        List<Product> list2 = dao.getAllProduct();
			        List<OrderDetail> listorder= new ArrayList<>();
			        

			        double totalMoney=0;
			        for(Cart c : list) {
						for(Product p : list2) {
							if(c.getProductID()==p.getId()) {
								totalMoney=totalMoney+(p.getPrice()*c.getAmount());
								listorder.add(new OrderDetail(accountID ,c.getProductID(),c.getAmount(),c.getSize()));
								

							}
						}
					}

			        int orderID;
			        if(dao.FindIDOderDetail()!=0) {
			        	  orderID=dao.FindIDOderDetail();
					      orderID+=1;

			        }else {
			        	orderID=1;
			        }
			     
		            
			        for(OrderDetail c : listorder) {

			        	dao.insertOderDetail(orderID,c.getAccountID(),c.getProductID(),c.getAmount(),c.getSize(),name, phoneNumber, emailAddress,deliveryAddress);
			        }

			        double totalMoneyVAT=totalMoney+totalMoney*0.1;
			       
			  	    dao.insertInvoice(orderID,totalMoneyVAT);

			  	    TongChiTieuBanHang t = dao.checkTongChiTieuBanHangExist(accountID);
			        if(t==null) {
			        	dao.insertTongChiTieuBanHang(accountID,totalMoneyVAT,0);
			        }
			        else {
			        	dao.editTongChiTieu(accountID, totalMoneyVAT);
			        }


			        //old code
					Email email =new Email();
					email.setFrom("huwuxsgu@gmail.com"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
					email.setFromPassword("doqs njkc lgme ptlf"); //mat khau email tren
					email.setTo(emailAddress);
					email.setSubject("Dat hang thanh cong tu Fashion Family");
					StringBuilder sb = new StringBuilder();
					sb.append("Dear ").append(name).append("<br>");
					sb.append("Ban vua dat dang tu Fashion Family. <br> ");
					sb.append("Dia chi nhan hang cua ban la: <b>").append(deliveryAddress).append(" </b> <br>");
					sb.append("So dien thoai khi nhan hang cua ban la: <b>").append(phoneNumber).append(" </b> <br>");
					sb.append("Cac san pham ban dat la: <br>");
					for(Cart c : list) {
						for(Product p : list2) {
							if(c.getProductID()==p.getId()) {
								sb.append(p.getName()).append(" | ").append("Price:").append(p.getPrice()).append("$").append(" | ").append("Amount:").append(c.getAmount()).append(" | ").append("Size:").append(c.getSize()).append("<br>");
							}
						}
					}
					sb.append("Tong Tien: ").append(String.format("%.02f",totalMoneyVAT)).append("$").append("<br>");
					sb.append("Cam on ban da dat hang tai Fashion Family<br>");
					sb.append("Chu cua hang");

					email.setContent(sb.toString());
					EmailUtils.send(email);
					
					dao.deleteCartByAccountID(accountID);
					response.getWriter().write("Sucess"); 

			} catch (Exception e) {
				
				 response.getWriter().write("Faild"); ;
				 
			
				 
			}

		


	}

}
