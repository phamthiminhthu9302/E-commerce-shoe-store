package entity;

public class OrderDetail {
	 public int getAccountID() {
		return accountID;
	}
	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int oderID) {
		this.orderID = oderID;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	 public OrderDetail() {

	 }
	 public OrderDetail(int accountID, int productID, int amount,String size) {
		 super();
			this.accountID = accountID;
			this.productID = productID;
			this.amount = amount;
			this.size = size;

	 }
	 public OrderDetail(int orderID,int accountID, int amount, int status,int productID, String size, String name, String email, String phone,String address) {
	
		this.accountID = accountID;
		this.productID = productID;
		this.amount = amount;
		this.orderID = orderID;
		this.status = status;
		this.size = size;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		
	}
	 private int accountID;
	 private int productID;
	 private int amount;
	 private int orderID;
	 private int status;
	 private String size;
		private String name;
		private String address;
		private String email;
		private String phone;
	 public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}

}
