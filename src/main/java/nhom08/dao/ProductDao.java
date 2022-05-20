package nhom08.dao;

import java.util.List;

import nhom08.entity.Product;
import nhom08.entity.Product;

public interface ProductDao {
	public List<Product> getProducts();
	public List<Product> getProductsFilter(String name, int categoryID, String newProduct, String bestSaler, String[] rangePrice, String[] rangeStock);
	public void saveProduct(Product product);
	public Product getProduct(int id);
	public void deleteProduct(int id);
}
