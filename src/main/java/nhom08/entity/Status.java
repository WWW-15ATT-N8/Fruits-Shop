package nhom08.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name = "Statuses")
@Table(name = "Statuses")
public class Status implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int statusID;
	private String name;
	private String description;
	
	@OneToMany(mappedBy = "status")
	List<Order> orders;
	
	public int getStatusID() {
		return statusID;
	}
	public void setStatusID(int statusID) {
		this.statusID = statusID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Status(int statusID, String name) {
		super();
		this.statusID = statusID;
		this.name = name;
	}
	
	public Status() {
		super();
	}
	@Override
	public String toString() {
		return "Status [statusID=" + statusID + ", name=" + name + ", description=" + description + "]";
	}
	public Status(int statusID) {
		super();
		this.statusID = statusID;
	}
	
	
}
