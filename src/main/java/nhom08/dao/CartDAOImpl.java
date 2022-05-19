package nhom08.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom08.entity.Cart;
import nhom08.entity.Cart_FK;

@Repository
public class CartDAOImpl  implements CartDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Cart> getCartsbyUserID(int UserID) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Cart> query = currentSession.createQuery("from Carts where userID=:id", Cart.class);
		query.setParameter("id", UserID);
		List<Cart> carts = query.getResultList();
		return carts ;
	}

	@Override
	public void saveCart(Cart cart) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(cart);
	}

	@Override
	public void updateCart(Cart cart) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(cart);
	}

	@Override
	public void deleteCart(Cart cart) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(cart);
	}

	@Override
	public Cart getCart(int userID, int productID) {
		Session currentSession = sessionFactory.getCurrentSession();
		Cart cart  = currentSession.get(Cart.class, new Cart_FK(userID, productID));
		return cart;
	}

}
