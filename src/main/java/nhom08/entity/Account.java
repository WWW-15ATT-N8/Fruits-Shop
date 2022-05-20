package nhom08.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name = "Accounts")
@Table(name = "Accounts")
public class Account implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int accountID;
	private String phone;
	private String password;
	private int enabled;

	@ManyToOne
	@JoinColumn(name = "roleID")
	private Role role;

	@OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
	private User user;

	public Account() {
		super();
	}

	public Account(int accountID, String phone, String password, int enabled, Role role, User user) {
		super();
		this.accountID = accountID;
		this.phone = phone;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
		this.user = user;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}
	
	

	public Account(String phone, String password, int enabled, Role role) {
		super();
		this.phone = phone;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
