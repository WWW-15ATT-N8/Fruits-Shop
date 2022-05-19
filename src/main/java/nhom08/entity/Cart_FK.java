package nhom08.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Cart_FK implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    private int user;
	
	private int product;
	

	public Cart_FK(int user, int product) {
		super();
		this.user = user;
		this.product = product;
	}

	public Cart_FK() {
		super();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + product;
		result = prime * result + user;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cart_FK other = (Cart_FK) obj;
		if (product != other.product)
			return false;
		if (user != other.user)
			return false;
		return true;
	}


	
}
