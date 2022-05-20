package nhom08.dao;

import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom08.entity.Category;
import nhom08.entity.Order;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Order> getOrders() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> query = currentSession.createQuery("from Orders", Order.class);
		List<Order> orders = query.getResultList();
		return orders;
	}

	@Override
	public Order getOrder(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Order order = currentSession.get(Order.class, id);
		return  order;
	}

	@Override
	public void saveOrder(Order order) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(order);
	}

	@Override
	public void updateOrder(Order order) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(order);
	}

	@Override
	public void deleteOrder(Order order) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(order);
	}

	@Override
	public int getMaxID() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Integer> query = currentSession.createQuery(" select max(orderID) from Orders");
		int max = query.getSingleResult();
		return max;
	}

	@Override
	public List<Order> getOrdersByDK(String dk) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> query = currentSession.createQuery("from Orders " + dk , Order.class);
		List<Order> orders = query.getResultList();
		return orders;
	}
	
	@Override
	@Transactional
	public List<Order> getOrdersByDate(Date date) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> query = currentSession.createQuery("from Orders where createdAt = :date" , Order.class);
		query.setParameter("date", date);
		List<Order> orders = query.getResultList();
		return orders;
	}

}
