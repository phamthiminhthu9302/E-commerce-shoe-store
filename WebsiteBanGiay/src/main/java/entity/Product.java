/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author
 */
public class Product {
    private int id;
    private String name;
    private double price;
    private String title;
    private String description;
    private String size;
    private String color;
    private String image;
    private int cateID;
    private int count;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCateID() {
		return cateID;
	}
	public void setCateID(int cateID) {
		this.cateID = cateID;
	}
	public Product(int id, String name, String image, double price, String title, String description,int cateID,
			String color, String size,int count) {

		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.title = title;
		this.description = description;
		this.cateID = cateID;
		this.color = color;
		this.size = size;
		this. count =  count;

	}



	public Product() {

	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", image=" +image + ", price=" + price + ", title=" + title
				+ ", description=" + description + ", color=" + color + ", size=" + size+ ", count=" + count+"]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}

	   public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}


}
