package nhom08.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.jsf.FacesContextUtils;


@Entity(name = "Orders")
@Table(name = "Orders")
public class Order implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderID;
	
	@Column(name ="createdAt")
	private Date createdDate;
	
	private double total;
	
	@Column(name = "shipAddress")
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String shipAddress;
	
	@NotNull(message = "is required")
	@Pattern(regexp = "^0[0-9]{9}", message = "* Số điện thoại có đúng 10 kí tự số")
	private String shipPhone;
	
	private String comment;
	private float discount;
	
	@ManyToOne
	@JoinColumn(name="userID")
	private User user;
	
	
	@ManyToOne
	@JoinColumn(name = "statusID")
	private Status status;
	
	@OneToMany(mappedBy = "order")
	private List<Order_Detail> order_Details;

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}



	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public String getShipPhone() {
		return shipPhone;
	}

	public void setShipPhone(String shipPhone) {
		this.shipPhone = shipPhone;
	}



	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}
	
	



	public List<Order_Detail> getOrder_Details() {
		return order_Details;
	}

	public void setOrder_Details(List<Order_Detail> order_Details) {
		this.order_Details = order_Details;
	}

	public Order(int orderID, Date createdDate, double total, String shipAddress, String shipPhone, String comment,
			float discount, User user) {
		super();
		this.orderID = orderID;
		this.createdDate = createdDate;
		this.total = total;
		this.shipAddress = shipAddress;
		this.shipPhone = shipPhone;
		this.comment = comment;
		this.discount = discount;
		this.user = user;
	}
	
	

	public Order(int orderID, Date createdDate, double total, String shipAddress, String shipPhone, String comment,
			float discount, User user, Status status, List<Order_Detail> order_Details) {
		super();
		this.orderID = orderID;
		this.createdDate = createdDate;
		this.total = total;
		this.shipAddress = shipAddress;
		this.shipPhone = shipPhone;
		this.comment = comment;
		this.discount = discount;
		this.user = user;
		this.status = status;
		this.order_Details = order_Details;
	}
	
	

	public Order(int orderID) {
		super();
		this.orderID = orderID;
	}

	public Order() {
		super();
	}

	@Override
	public String toString() {
		return "Order [orderID=" + orderID + ", createdDate=" + createdDate + ", total=" + total + ", shipAddress="
				+ shipAddress + ", shipPhone=" + shipPhone + ", comment=" + comment + ", discount=" + discount
				+ ", user=" + user + ", status=" + status + "]";
	}

}
