package entity;

import java.util.Date;

public class Invoice {
	private int maHD;
	private int accountID;
	private double tongGia;
	Date ngayXuat;
	public Invoice(int maHD, int accountID, Date ngayXuat,
			 double tongGia) {
		
		this.maHD = maHD;
		this.accountID = accountID;
		this.ngayXuat = ngayXuat;
		this.tongGia = tongGia;
	}
	


	public Invoice() {}

	



	@Override
	public String toString() {
		return "Invoice [maHD=" + maHD + ", accountID=" + accountID + ", tongGia=" + tongGia + ", ngayXuat=" + ngayXuat
				+ "]";
	}
	public int getmaHD() {
		return maHD;
	}
	public void setmaHD(int maHD) {
		this.maHD = maHD;
	}
	public int getAccountID() {
		return accountID;
	}
	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}
	public double getTongGia() {
		return tongGia;
	}
	public void setTongGia(double tongGia) {
		this.tongGia = tongGia;
	}
	public Date getNgayXuat() {
		return ngayXuat;
	}
	public void setNgayXuat(Date ngayXuat) {
		this.ngayXuat = ngayXuat;
	}
}
