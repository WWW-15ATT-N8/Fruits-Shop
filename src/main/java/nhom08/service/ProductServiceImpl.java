package nhom08.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import nhom08.dao.ProductDao;
import nhom08.entity.Product;
import nhom08.entity.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Override
	@Transactional
	public List<Product> getProducts() {
		
		return productDao.getProducts();
	}

	@Override
	@Transactional
	public void saveProduct(Product product) {
		productDao.saveProduct(product);
	}

	@Override
	@Transactional
	public Product getProduct(int id) {
		return productDao.getProduct(id);
	}

	@Override
	@Transactional
	public void deleteProduct(int id) {
		productDao.deleteProduct(id);
	}

	@Override
	@Transactional
	public List<Product> getProductsFilter(String name, int categoryID, String newProduct, String bestSaler,
			String[] rangePrice, String[] rangeStock) {
		return productDao.getProductsFilter(name, categoryID, newProduct, bestSaler, rangePrice, rangeStock);
	}
	
	@Override
	@Transactional
	public List<Product> getProductsbyDK(String dk) {
		return productDao.getProductsbyDK(dk);
	}
	

}
