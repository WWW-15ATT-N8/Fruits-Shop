package nhom08.entity;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name = "Users")
@Table(name = "Users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userID;
	private String fullName;
	private String address;
	private String email;
	private String phone;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Cart> carts;
	
	@OneToOne
	@JoinColumn(name = "accountID")
	private Account account;

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
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


	public User(int userID, String fullName, String address, String email, String phone, Account account) {
		super();
		this.userID = userID;
		this.fullName = fullName;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.account = account;
	}

	public User() {
		super();
	}

	

	public User(int userID, String phone) {
		super();
		this.userID = userID;
		this.phone = phone;
	}
	
	

	public User(int userID, String fullName, String phone) {
		super();
		this.userID = userID;
		this.fullName = fullName;
		this.phone = phone;
	}
	

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "User [userID=" + userID + ", fullName=" + fullName + ", address=" + address + ", email=" + email
				+ ", phone=" + phone + "]";
	}
}
