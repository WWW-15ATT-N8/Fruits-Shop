package nhom08.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import nhom08.entity.Category;
import nhom08.entity.Product;
import nhom08.entity.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Product> getProducts() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Product> query = currentSession.createQuery("from Products", Product.class);
		List<Product> Products = query.getResultList();
		return Products;
	}

	@Override
	public void saveProduct(Product product) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(product);
	}

	@Override
	public Product getProduct(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Product product = currentSession.get(Product.class, id);
		return product;
	}

	@Override
	public void deleteProduct(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("delete from Products where ProductID=:ProductId");
		query.setParameter("ProductId", id);
		query.executeUpdate();		
	}

	@Override
	@Transactional
	public List<Product> getProductsFilter(String name, int categoryID, boolean newProduct, boolean bestSaler,
			String[] rangePrice, String[] rangeStock) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Product> query = currentSession.createQuery("from Products where "
				+ "name like :name and "
				+ "categoryID = :categoryID and "
				+ "newProduct = :newProduct and "
				+ "bestSaler = :bestSaler and "
				+ "price between :minPrice and :maxPrice  and "
				+ "stock between :minStock and :maxStock", Product.class);
		query.setParameter("name", "%"+name+"%");
		query.setParameter("categoryID", categoryID);
		query.setParameter("newProduct", newProduct);
		query.setParameter("bestSaler", bestSaler);
		query.setParameter("maxPrice", Double.parseDouble(rangePrice[1]+"000"));
		query.setParameter("minPrice", Double.parseDouble(rangePrice[0]+"000"));
		query.setParameter("maxStock", Integer.parseInt(rangeStock[1]));
		query.setParameter("minStock", Integer.parseInt(rangeStock[0]));
		List<Product> products = query.getResultList();
		System.out.println("product dao" + Double.parseDouble(rangePrice[1]+"000"));
		return products;
	}

}
