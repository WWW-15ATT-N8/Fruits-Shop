package nhom08.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;

@Entity(name = "Categories")
@Table(name = "Categories")
public class Category implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryID;
	
	@NotNull(message = "* Tên loại không được để trống")
	private String name;
	
	private String description;
	
	@OneToMany(mappedBy = "category" ,fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	private List<Product> products;

	public Category(int categoryID, String name, String description) {
		super();
		this.categoryID = categoryID;
		this.name = name;
		this.description = description;
	}

	public Category() {
		super();
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
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

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Category [categoryID=" + categoryID + ", name=" + name + ", description=" + description + ", products="
				 + "]";
	}
	
	
}
