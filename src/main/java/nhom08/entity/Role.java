package nhom08.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity(name="Roles")
@Table(name ="Roles")
public class Role implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int roleID;
	
	@NotNull(message = "* Tên không được để trống")
	private String title;
	
	private String description;
	
	@OneToMany(mappedBy = "role" ,fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	List<Account> accounts;
	
	public Role(int roleID, String title, boolean active, String description) {
		super();
		this.roleID = roleID;
		this.title = title;
		this.description = description;
	}

	public Role() {
		super();
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
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

	@Override
	public String toString() {
		return "Role [roleID=" + roleID + ", title=" + title  + ", desciption=" + description
				+ "]";
	}

	public Role(int roleID) {
		super();
		this.roleID = roleID;
	}
	
	

	
	
}
