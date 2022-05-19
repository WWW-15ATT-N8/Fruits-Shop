package nhom08.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "Order_Detail")
@IdClass(Order_Detail_FK.class)
public class Order_Detail implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "orderID")
	private Order order;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "productID")
	private Product product;
	
	private int amount;
	
	private double price;
	
	

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Order_Detail() {
		super();
	}
	
	


	public Order_Detail(Product product, int amount, double price) {
		super();
		this.product = product;
		this.amount = amount;
		this.price = price;
	}

	@Override
	public String toString() {
		return "Order_Detail [order=" + order + ", product=" + product + ", amount=" + amount + ", price=" + price
				+ "]";
	}
	
	
}
