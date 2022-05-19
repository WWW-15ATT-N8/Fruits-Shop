package nhom08.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Order_Detail_FK implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    private int product;
	
	private int order;

	public Order_Detail_FK() {
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + order;
		result = prime * result + product;
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
		Order_Detail_FK other = (Order_Detail_FK) obj;
		if (order != other.order)
			return false;
		if (product != other.product)
			return false;
		return true;
	}

	
	
	
}
