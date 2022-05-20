package nhom08.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity(name = "Products")
@Table(name = "Products")
public class Product implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productID;
	
	@NotNull(message = "Tên thiệp không được để trống")
	private String name;
	
	@NotNull(message = "Giá không được trống")
    @Min(value = 0, message = "Giá sản phẩm không được âm")
	private double price;
	
	@NotNull(message = "Giá cũ không được trống")
    @Min(value = 0, message = "Giá cũ không được âm")
	private double oldPrice;
	
	private String description;
	
	private String detail;
	
	@NotNull(message = "Số lượng không được trống")
    @Min(value = 0, message = "Số lượng không được âm")
	private int stock;
	
	@NotNull(message = "Giảm giá không được trống")
    @Min(value = 0, message = "Giảm giá không được âm")
	@Max(value = 100, message = "Giảm giá phải nhỏ hơn 100")
	private double discount;
	
	private boolean newProduct;
	
	private boolean bestSaler;
	
	@ManyToOne
	@JoinColumn(name = "categoryID")
	private Category category;
	
	@OneToMany(mappedBy = "product" ,fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Comment> comments;
	
	@OneToMany(mappedBy = "product" ,fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	private List<Image> images;
	
	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Cart> carts;
	
	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Order_Detail> order_Details;
	

	public Product() {
		super();
	}
	
	public Product(int productID, String name, double price, double oldPrice, String description, String detail,
			int stock, double discount, boolean newProduct, boolean bestSaler, Category category) {
		super();
		this.productID = productID;
		this.name = name;
		this.price = price;
		this.oldPrice = oldPrice;
		this.description = description;
		this.detail = detail;
		this.stock = stock;
		this.discount = discount;
		this.newProduct = newProduct;
		this.bestSaler = bestSaler;
		this.category = category;
	}
	
	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
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

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(double oldPrice) {
		this.oldPrice = oldPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public boolean isNewProduct() {
		return newProduct;
	}

	public void setNewProduct(boolean newProduct) {
		this.newProduct = newProduct;
	}

	public boolean isBestSaler() {
		return bestSaler;
	}

	public void setBestSaler(boolean bestSaler) {
		this.bestSaler = bestSaler;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	

	public String getDetail() {
		return detail;
	}





	public void setDetail(String detail) {
		this.detail = detail;
	}





	public static long getSerialversionuid() {
		return serialVersionUID;
	}





	@Override
	public String toString() {
		return "Product [productID=" + productID + ", name=" + name + ", price=" + price + ", oldPrice=" + oldPrice
				+ ", description=" + description + ", detail=" + detail + ", stock=" + stock + ", discount=" + discount
				+ ", newProduct=" + newProduct + ", bestSaler=" + bestSaler + ", category=" + category + "]";
	}
	
}
