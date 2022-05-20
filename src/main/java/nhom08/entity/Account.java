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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

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
	
	@NotNull(message = "* Số điện thoại không được để trống")
	@Pattern(regexp = "^0[0-9]{9}", message = "* Số điện thoại phải có 10 kí tự bắt đầu bằng 0")
	private String phone;
	
	@NotNull(message = "* Mật khẩu không được để trống")
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
	

	public Account(String phone, String password, Role role) {
		super();
		this.phone = phone;
		this.password = password;
		this.enabled = 1;
		this.role = role;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
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
