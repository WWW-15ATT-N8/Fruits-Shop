package nhom08.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name= "Comments" )
public class Comment implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String commentID;
	
	@Column(name = "rate")
	@NotNull(message = "* Đánh giá không được để trống")
	private double rate;
	
	@Column(name="[content]")
	@NotNull(message = "* Nội dung không được để trống")
	private String content;
	
	@Column(name = "email")
	@NotNull(message = "* Email không được để trống")
	private String email;
	
	@Column(name = "userName")
	@NotNull(message = "* Tên không được để trống")
	private String userName;
	
	@ManyToOne
	@JoinColumn(name="productID")
	private Product product;
	
	public Comment(String commentID, double rate, String content, String email, String userName, Product product) {
		super();
		this.commentID = commentID;
		this.rate = rate;
		this.content = content;
		this.email = email;
		this.userName = userName;
		this.product = product;
	}
	public String getCommentId() {
		return commentID;
	}
	public void setCommentId(String commentID) {
		this.commentID = commentID;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Comment() {
		super();
	}
	
	
}
