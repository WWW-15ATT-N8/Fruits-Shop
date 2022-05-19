package nhom08.service;

import java.util.List;

import nhom08.entity.Product;
import nhom08.entity.Product;

public interface ProductService {
	public List<Product> getProducts();
	public List<Product> getProductsFilter(String name, int categoryID, boolean newProduct, boolean bestSaler, String[] rangePrice, String[] rangeStock);
	public void saveProduct(Product product);
	public Product getProduct(int id);
	public void deleteProduct(int id);
}
