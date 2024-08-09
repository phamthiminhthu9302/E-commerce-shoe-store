/*
F * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import entity.Account;
import entity.Cart;
//import entity.Account;
import entity.Category;
import entity.Invoice;
import entity.OrderDetail;
import entity.Product;
import entity.Review;
import entity.SoLuongDaBan;
import entity.Supplier;
import entity.TongChiTieuBanHang;


public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<SoLuongDaBan> getTop10SanPhamBanChay() {
        List<SoLuongDaBan> list = new ArrayList<>();
        String query = "select top(10) *\r\n"
        		+ "from SoLuongDaBan\r\n"
        		+ "order by soLuongDaBan desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SoLuongDaBan(rs.getInt(1),
                        rs.getInt(2)
                  ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Invoice> getAllInvoice() {
        List<Invoice> list = new ArrayList<>();
        String query = "select * from Invoice";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                       
                        rs.getDate(3), rs.getDouble(4)
                       ));
            }
        } catch (Exception e) {
        }
        return list;
    }
	

    public int countAllProductBySellID() {
        String query = "select count(*) from Product ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    public int countAllAccount() {
        String query = "select count(*) from Account ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    public int countAllInvoice() {
        String query = "select count(*) from Invoice ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double totalMoneyDay(int day) {
        String query = "select \r\n"
        		+ "	SUM(tongGia) \r\n"
        		+ "from Invoice\r\n"
        		+ "where DATEPART(dw,[ngayXuat]) = ?\r\n"
        		+ "Group by ngayXuat ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, day);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double totalMoneyMonth(int month) {
        String query = "select SUM(tongGia) from Invoice\r\n"
        		+ "where MONTH(ngayXuat)=?\r\n"
        		+ "Group by MONTH(ngayXuat)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, month);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int countAllProduct() {
        String query = "select count(*) from Product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double sumAllInvoice() {
        String query = "select SUM(tongGia) from Invoice";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int countAllReview() {
        String query = "select count(*) from Review";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getCateIDByProductID(String id) {
        String query = "select [cateID] from Product\r\n"
        		+ "where [id] =?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    public int getProductID(String id) {
        String query = "select [cateID] from Product\r\n"
        		+ "where [id] =?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    public int getProductCount(int id) {
        String query = "select count from Product\r\n"
        		+ "where [id] =?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    public Supplier getSupplierByID(String id) {

        String query = "select * from Supplier where idSupplier=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Supplier(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                		rs.getInt(6));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Account getAccountByID(String id) {

        String query = "select * from Account where uID=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                		rs.getString(6), rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                		rs.getString(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Supplier> getAllSupplier() {
        List<Supplier> list = new ArrayList<>();
        String query = "select * from Supplier";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Supplier(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                		rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<TongChiTieuBanHang> getTop5KhachHang() {
        List<TongChiTieuBanHang> list = new ArrayList<>();
        String query = "select top(5) userID,TongChiTieu,TongBanHang from TongChiTieuBanHang as t, Account as a where t.userID=a.uID and a.isCustomer=1 order by TongChiTieu desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TongChiTieuBanHang(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getDouble(3)
                       ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<TongChiTieuBanHang> getTop5NhanVien() {
        List<TongChiTieuBanHang> list = new ArrayList<>();
        String query = "select top(5) userID,TongChiTieu,TongBanHang from TongChiTieuBanHang as t, Account as a where t.userID=a.uID and a.isSell=1  order by TongChiTieu desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TongChiTieuBanHang(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getDouble(3)
                       ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop3() {
        List<Product> list = new ArrayList<>();
        String query = "select top 3 * from Product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		  rs.getString(2),
                          rs.getString(3),
                          rs.getDouble(4),
                          rs.getString(5),
                          rs.getString(6),
                          rs.getInt(7),
                          rs.getString(8),
                          rs.getString(9),rs.getInt(10)

                        ));

            }
        } catch (Exception e) {
        }
        return list;

    }

    public List<Product> getNext3Product(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "  FROM Product\n"
                + " ORDER BY id\n"
                + "OFFSET ? ROWS\n"
                + " FETCH NEXT 3 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNext4NikeProduct(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where cateID=2\r\n"
        		+ "order by id desc\r\n"
        		+ "offset ? rows\r\n"
        		+ "fetch next 4 rows only";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNext4AdidasProduct(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where cateID=1\r\n"
        		+ "order by id desc\r\n"
        		+ "offset ? rows\r\n"
        		+ "fetch next 4 rows only";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\n"
                + "where cateID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getProductBySellIDAndIndex( int indexPage) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product \r\n"
        		+ "order by [id]\r\n"
        		+ "offset ? rows\r\n"
        		+ "fetch next 5 rows only";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            ps.setInt(1, (indexPage-1)*5);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),
                         rs.getInt(10)

                       ));


            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Account> getAccountAndIndex( int indexPage) {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account \r\n"
        		+ "order by [uID]\r\n"
        		+ "offset ? rows\r\n"
        		+ "fetch next 5 rows only";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            ps.setInt(1, (indexPage-1)*5);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add( new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6), rs.getInt(7)));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Invoice> getInvoiceAndIndex( int indexPage) {
        List<Invoice> list = new ArrayList<>();
        String query = "select * from Invoice \r\n"
        		+ "order by [maHD]\r\n"
        		+ "offset ? rows\r\n"
        		+ "fetch next 5 rows only";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            ps.setInt(1, (indexPage-1)*5);
            rs = ps.executeQuery();
            while (rs.next()) {
            	list.add(new Invoice(rs.getInt(1),
            			rs.getInt(2),
                        rs.getDate(3),rs.getDouble(4)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByIndex(int indexPage) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product \r\n"
        		+ "order by [id]\r\n"
        		+ "offset ? rows\r\n"
        		+ "fetch next 9 rows only";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, (indexPage-1)*9);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));


            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\n"
                + "where [name] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Invoice> searchByNgayXuat(String ngayXuat) {
        List<Invoice> list = new ArrayList<>();
        String query = "select * from Invoice\r\n"
        		+ "where [ngayXuat] ='"+ngayXuat+"'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
//            ps.setString(1,ngayXuat);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                		  rs.getInt(2),
                          
                          rs.getDate(3), rs.getDouble(4))
                       );
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Invoice> searchInvoice() {
        List<Invoice> list = new ArrayList<>();
        String query = "select * from Invoice";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                		  rs.getInt(2),
                          
                          rs.getDate(3), rs.getDouble(4))
                       );
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchPriceUnder100() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where [price] < 100";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchPrice100To200() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where [price] >= 100 and [price]<=200";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchColorWhite() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'White'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchColorGray() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'Gray'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product>  searchColorGreen() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'Green'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product>  searchColorBlue() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'Blue'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product>  searchColorPurple() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'Purple'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product>  searchColorIndigo() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'Indigo'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product>  searchColorRed() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'Red'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product>  searchColorOrange() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'Orange'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> searchColorBlack() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'Black'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> searchColor(String color) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, color);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> searchColorYellow() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where color = 'Yellow'";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> searchByPriceMinToMax(String priceMin,String priceMax) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where [price] >= ? and [price]<=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, priceMin);
            ps.setString(2, priceMax);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchPriceAbove200() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
        		+ "where [price] > 200";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getRelatedProduct(int cateIDProductDetail) {
        List<Product> list = new ArrayList<>();
        String query = "select top 4 * from product\r\n"
        		+ "where [cateID] =?\r\n"
        		+ "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, cateIDProductDetail);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }


    public List<Review> getAllReviewByProductID(String productId) {
        List<Review> list = new ArrayList<>();
        String query = "select * from Review\r\n"
        		+ "where [productID] =?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDate(4)
                       ));
            }
        } catch (Exception e) {
        }
        return list;
    }
   
    public Product getProductByID(String id) {
        String query = "select * from Product \n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       );

            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Cart> getCartByAccountID(int accountID) {
    	 List<Cart> list = new ArrayList<>();
        String query = "select * from Cart where accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<OrderDetail> getOrderByID(int accountID) {
   	 List<OrderDetail> list = new ArrayList<>();
       String query = "select * from [Order] where orderID = ?";
       try {
           conn = new DBContext().getConnection();//mo ket noi voi sql
           ps = conn.prepareStatement(query);
           ps.setInt(1, accountID);
           rs = ps.executeQuery();
           while (rs.next()) {
               list.add(new OrderDetail(rs.getInt(1),
                       rs.getInt(2),
                       rs.getInt(3),
                       rs.getInt(4),
                       rs.getInt(5),
                       rs.getString(6),rs.getString(7),rs.getString(8),
                       rs.getString(9),rs.getString(10)));
           }
       } catch (Exception e) {
       }
       return list;
   }
    public Account FindAccountByID(int accountID) {

        String query = "select * from [Account]"
        		+ "where [uID] = ? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6), rs.getInt(7));
            }
        } catch (Exception e) {
        }
       return null;
    }
    public List<OrderDetail> FindOrderByIDAccount(int accountID) {
    	 List<OrderDetail> list = new ArrayList<>();
        String query = "select * from [Order]"
        		+ "where [accountID] = ? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);

            rs = ps.executeQuery();
            while (rs.next()) {
            	   list.add(new OrderDetail(rs.getInt(1),
            			   rs.getInt(2),
                           rs.getInt(3),
                           rs.getInt(4),
                           rs.getInt(5),
                           rs.getString(6),rs.getString(7),rs.getString(8),
                           rs.getString(9),rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Cart checkCartExist(int accountID,int productID) {

       String query = "select * from Cart\r\n"
       		+ "where [accountID] = ? and [productID] = ?";
       try {
           conn = new DBContext().getConnection();//mo ket noi voi sql
           ps = conn.prepareStatement(query);
           ps.setInt(1, accountID);
           ps.setInt(2, productID);
           rs = ps.executeQuery();
           while (rs.next()) {
               return new Cart(rs.getInt(1),
                       rs.getInt(2),
                       rs.getInt(3),
                       rs.getInt(4),
                       rs.getString(5));
           }
       } catch (Exception e) {
       }
      return null;
   }

    public int checkAccountAdmin(int userID) {

        String query = "select isAdmin from Account where [uID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);

            rs = ps.executeQuery();
            while (rs.next()) {
            	 return rs.getInt(1);
             }
        } catch (Exception e) {

        }
        return 0;
    }

    public TongChiTieuBanHang checkTongChiTieuBanHangExist(int userID) {

        String query = "select * from TongChiTieuBanHang where [userID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new TongChiTieuBanHang(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getDouble(3)
                        );
            }
        } catch (Exception e) {
        }
       return null;
    }

    public SoLuongDaBan checkSoLuongDaBanExist(int productID) {

        String query = "select * from SoLuongDaBan where productID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new SoLuongDaBan(rs.getInt(1),
                        rs.getInt(2)
                       );
            }
        } catch (Exception e) {
        }
       return null;
    }



    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }


//
    public Product getLast() {
        String query = "select top 1 * from Product\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                		 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       );

            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> get8Last() {
    	List<Product> list = new ArrayList<>();
        String query = "select top 8 * from Product order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
            	list.add(new Product(rs.getInt(1),
            			 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> get4NikeLast() {
    	List<Product> list = new ArrayList<>();
        String query = "select top 4 * from Product\r\n"
        		+ "where cateID = 2\r\n"
        		+ "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
            	list.add(new Product(rs.getInt(1),
            			 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> get4AdidasLast() {
    	List<Product> list = new ArrayList<>();
        String query = "select top 4 * from Product\r\n"
        		+ "where cateID = 1\r\n"
        		+ "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
            	list.add(new Product(rs.getInt(1),
            			 rs.getString(2),
                         rs.getString(3),
                         rs.getDouble(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9),rs.getInt(10)

                       ));

            }
        } catch (Exception e) {
        }
        return list;
    }
    public int CountOrder(int id) {
        String query = "select count(orderID) from [Order] \n"
                + "where orderID = ?";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
             }
         } catch (Exception e) {
         }
         return 0;

}
    public Account login(String user, String pass) {
        String query = "select * from Account\n"
                + "where [user] = ?\n"
                + "and pass = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                		rs.getString(6),
                		 rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public List<Invoice> getListInvoice() {
    	List<Invoice> list = new ArrayList<>();
        String query = "SELECT *FROM [Invoice]";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);


            rs = ps.executeQuery();
            while (rs.next()) {
            	list.add(new Invoice(rs.getInt(1),
            			rs.getInt(2),
                        rs.getDate(3),rs.getDouble(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Invoice getInvoice(String id) {

        String query = "SELECT *FROM [Invoice] where maHD=?";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
            	return new Invoice(rs.getInt(1),
            			rs.getInt(2),
                        rs.getDate(3),rs.getDouble(4));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void UpdateOrder(int id, String status) {

        String query = "UPDATE [Order] SET  [status] =? where orderID=?  ";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1,status);
            ps.setInt(2,id);
            rs = ps.executeQuery();

        } catch (Exception e) {
        }

    }
 public void UpdateTrans(int accountID,int id) {

        String query = "UPDATE [Invoice] SET  [accountID] =? ,[ngayXuat] =? where maHD=?  ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1,accountID);
            ps.setDate(2,getCurrentDate());
            ps.setInt(3,id);
            rs = ps.executeQuery();

        } catch (Exception e) {
        }

    }
 public List<OrderDetail> getListOrderSucess() {
 	List<OrderDetail> list = new ArrayList<>();
     String query = "SELECT *FROM [Order] where status=?  ORDER BY orderID ASC";

     try {
         conn = new DBContext().getConnection();//mo ket noi voi sql
         ps = conn.prepareStatement(query);
         ps.setInt(1,1);

         rs = ps.executeQuery();
         while (rs.next()) {
         	list.add(new OrderDetail(rs.getInt(1),
         			 rs.getInt(2),
                     rs.getInt(3),
                     rs.getInt(4),
                     rs.getInt(5),
                     rs.getString(6),rs.getString(7),rs.getString(8),
                     rs.getString(9),rs.getString(10)));
         }
     } catch (Exception e) {
     }
     return list;
 }
    public List<OrderDetail> getListOrder() {
    	List<OrderDetail> list = new ArrayList<>();
        String query = "SELECT *FROM [Order] ORDER BY orderID ASC";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);


            rs = ps.executeQuery();
            while (rs.next()) {
            	list.add(new OrderDetail(rs.getInt(1),
            			 rs.getInt(2),
                         rs.getInt(3),
                         rs.getInt(4),
                         rs.getInt(5),
                         rs.getString(6),rs.getString(7),rs.getString(8),
                         rs.getString(9),rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<OrderDetail> getOderDetail(int acountID) {
    	List<OrderDetail> list = new ArrayList<>();
        String query = "SELECT *FROM [Order] where accountID=? ORDER BY orderID ASC ";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1,acountID);

            rs = ps.executeQuery();
            while (rs.next()) {
            	list.add(new OrderDetail(rs.getInt(1),
            			 rs.getInt(2),
                         rs.getInt(3),
                         rs.getInt(4),
                         rs.getInt(5),
                         rs.getString(6),rs.getString(7),rs.getString(8),
                         rs.getString(9),rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account checkAccountExist(String user) {
        String query = "select * from Account\n"
                + "where [user] = ?\n";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                		rs.getString(6)
                		, rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Account checkAccountExistByEmail(String user) {
        String query = "select * from Account\n"
                + "where [email] = "+"'"+user+"'";
        try {
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                		rs.getString(6)
                		, rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Account checkAccountExistByID(String user) {
        String query = "select * from Account\n"
                + "where [uID] = ?\n";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                		rs.getString(6)
                		, rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccountExistByUsernameAndEmail(String username, String email) {
        String query = "select * from Account where [user]=? and [email]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                		rs.getString(6), rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Review getNewReview(int accountID, int productID) {
        String query = "select top 1 * from Review\r\n"
        		+ "where accountID = ? and productID = ?\r\n"
        		+ "order by maReview desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Review(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDate(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void singup(String user, String pass, String email) {
        String query = "insert into Account ([user],[pass],[isSell],[isAdmin],[email],[isCustomer])"
                + "values(?,?,0,0,?,1)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }


    public void deleteInvoiceByAccountId(String id) {
        String query = "delete from Invoice\n"
                + "where [accountID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteTongChiTieuBanHangByUserID(String id) {
        String query = "delete from TongChiTieuBanHang\n"
                + "where [userID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }


    public void deleteProduct(String pid) {
        String query = "delete from Product\n"
                + "where [id] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProductBySellID(String id) {
        String query = "delete from Product"
                + "where [id] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCartByAccountID(int accountID) {
        String query = "delete from Cart \r\n"
        		+ "where [accountID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCartByProductID(String productID) {
        String query = "delete from Cart where [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteSoLuongDaBanByProductID(String productID) {
        String query = "delete from SoLuongDaBan where [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteReviewByProductID(String productID) {
        String query = "delete from Review where [productID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteReviewByAccountID(String id) {
        String query = "delete from Review where [accountID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteAccount(String id) {
        String query = "delete from Account where uID= ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteSupplier(String idSupplier) {
        String query = "delete from Supplier\r\n"
        		+ "where idSupplier=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, idSupplier);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCart(int productID) {
        String query = "delete from Cart where productID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String name, String image, String price,
            String title, String description, String category, String color, String size, String count) {
        String query = "INSERT INTO Product ([name], [image], [price], [title], [description], [cateID], [color],[size],[count] ) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
        	 conn = new DBContext().getConnection();//mo ket noi voi sql
             ps = conn.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, color);
            ps.setString(8, size);
            ps.setString(9, count);


            ps.executeUpdate();


        } catch (Exception e) {


        }
    }

    public void insertAccount(String user, String pass, int isSell,
    		int isAdmin, String email,int isCustomer) {
        String query = "insert Account([user], pass, isSell, isAdmin, email, isCustomer)"
        		+ "values(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, isSell);
            ps.setInt(4, isAdmin);
            ps.setString(5, email);
            ps.setInt(6, isCustomer);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void editAccount(String id,String user, String pass, int isSell,int isAdmin, String email,int isCustomer) {
        String query = "update Account\r\n"
        		+ "set [user] = ?,\r\n"
        		+ "pass = ?,\r\n"
        		+ "isSell = ?,\r\n"
        		+ "isAdmin = ?,\r\n"
        		+ "email = ?,\r\n"
        		+ "isCustomer = ?\r\n"

        		+ "where uID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3,  isSell);
            ps.setInt(4, isAdmin);
            ps.setString(5, email);
            ps.setInt(6, isCustomer);
            ps.setString(7, id);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void insertTongChiTieuBanHang(int userID, double tongChiTieu, double tongBanHang) {
        String query = "insert TongChiTieuBanHang(userID,TongChiTieu,TongBanHang)\r\n"
        		+ "values(?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setDouble(2, tongChiTieu);
            ps.setDouble(3, tongBanHang);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertSoLuongDaBan(int productID, int soLuongDaBan) {
        String query = "insert SoLuongDaBan(productID,soLuongDaBan)\r\n"
        		+ "values(?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setInt(2, soLuongDaBan);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertSupplier(String nameSupplier, String phoneSupplier, String emailSupplier, String addressSupplier, String cateID) {
        String query = "insert Supplier(nameSupplier, phoneSupplier, emailSupplier, addressSupplier, cateID) \r\n"
        		+ "values(?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, nameSupplier);
            ps.setString(2, phoneSupplier);
            ps.setString(3, emailSupplier);
            ps.setString(4, addressSupplier);
            ps.setString(5, cateID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }

    public void insertReview(int accountID, int productID, String contentReview) {
        String query = "insert Review(accountID, productID, contentReview, dateReview)\r\n"
        		+ "values(?,?,?,?)";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setString(3, contentReview);
            ps.setDate(4,getCurrentDate());
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    public int FindIDOderDetail() {
    	String query = "SELECT Max([orderID]) FROM [Order]";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }

        } catch (Exception e) {

        } return 0;

    }
    public void insertOderDetail(int orderID,int accountID,int productID,int amount,String size, String name,String phone, String email, String address) {
    	String query = "INSERT INTO [Order] ([orderID],[accountID],[productID] ,[amount] ,[status],[size],[name],[phone],[email],[address] )"
        		+ " VALUES(?,?,?,?,?,?,?,?,?,?)";


        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            ps.setInt(4, amount);
            ps.setInt(5,0);
            ps.setString(6,size);
            ps.setString(7, name);
            ps.setString(8, phone);
            ps.setString(9, email);
            ps.setString(10, address);

            ps.executeUpdate();


 } catch (Exception e) {

        }

    }
    public void insertInvoice( int maHD,double tongGia) {
        String query = "insert Invoice(maHD,tongGia)"
        		+ "values(?,?)";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, maHD);
            ps.setDouble(2, tongGia);
           

            ps.executeUpdate();

        } catch (Exception e) {

        }

    }

    public void insertCart(int accountID, int productID, int amount, String size) {
        String query = "insert Cart(accountID, productID, amount,size)"
        		+ "values(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setInt(3, amount);
            ps.setString(4, size);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void editSupplier(String name, String phone, String email,
            String address,  String category, String pid) {
        String query = "update Supplier\r\n"
        		+ "set [nameSupplier]=?,[phoneSupplier]=?,[emailSupplier]=?,[addressSupplier]=?,[cateID]=?\r\n"
        		+ "where [idSupplier] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, category);
            ps.setString(6, pid);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }
    public void editProduct(String name, String image, String price,
            String title, String description, String category, String color, String size, String count, String pid) {
        String query = "update Product\r\n"
        		+ "set [name] = ?,\r\n"
        		+ "[image] = ?,\r\n"
        		+ "[price] = ?,\r\n"
        		+ "[title] = ?,\r\n"
        		+ "[description] = ?,\r\n"
        		+ "[cateID] = ?,\r\n"
        		+ "[color]= ?,\r\n"
        		+ "[size]=?,\r\n"
        		+ "[count]= ?\r\n"
        		+ "where [id] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, color);
            ps.setString(8, size);
            ps.setString(9, count);
            ps.setString(10, pid);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }
    public void editProductCount( int count, int pid) {
        String query = "update Product\r\n"
        		+ "set count= ?\r\n"
        		+ "where [id] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, count);
            ps.setInt(2, pid);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void editProfile(String username, String password, String email, int uID) {
        String query = "update Account set [user]=?,\r\n"
        		+ "[pass]=?,\r\n"
        		+ "[email]=?\r\n"
        		+ "where [uID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setInt(4, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editTongChiTieu(int accountID, double totalMoneyVAT) {
        String query = "exec dbo.proc_CapNhatTongChiTieu ?,?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setDouble(2, totalMoneyVAT);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void editSoLuongDaBan(int productID, int soLuongBanThem) {
        String query = "exec dbo.proc_CapNhatSoLuongDaBan ?,?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setInt(2, soLuongBanThem);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void editTongBanHang(int sell_ID, double tongTienBanHangThem) {
        String query = "exec dbo.proc_CapNhatTongBanHang ?,?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, sell_ID);
            ps.setDouble(2, tongTienBanHangThem);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void editAmountAndSizeCart(int accountID, int productID, int amount, String size) {
        String query = "update Cart set [amount]=?,\r\n"
        		+ "[size]=?\r\n"
        		+ "where [accountID]=? and [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setString(2, size);
            ps.setInt(3, accountID);
            ps.setInt(4, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editAmountCart(int accountID, int productID, int amount) {
        String query = "update Cart set [amount]=?\r\n"
        		+ "where [accountID]=? and [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

   public static void main(String[] args) {
        DAO dao = new DAO();

   }

}
