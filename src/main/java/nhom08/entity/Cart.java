package nhom08.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity(name = "Carts")
@Table(name = "Carts")
@IdClass(Cart_FK.class)
public class Cart implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@ManyToOne
    @JoinColumn( name = "productID")
	private Product product;
	
	@Id
	@ManyToOne
    @JoinColumn( name = "userID")
	private User user;
	
	private int amount;
	

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Cart() {
		super();
	}

	public Cart(Product product, User user, int amount) {
		super();
		this.product = product;
		this.user = user;
		this.amount = amount;
	}

	

	@Override
	public String toString() {
		return "Cart [product=" + product + ", user=" + user + ", amount=" + amount + "]";
	}
		
}
