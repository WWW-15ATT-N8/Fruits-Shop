package nhom08.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom08.entity.Category;
import nhom08.entity.Order;
import nhom08.entity.Order_Detail;

@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Order_Detail> getOrdersDetails() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order_Detail> query = currentSession.createQuery("from Order_Detail", Order_Detail.class);
		List<Order_Detail> order_Details = query.getResultList();
		return order_Details;
	}

	@Override
	public void saveOrderDetail(Order_Detail order_Detail) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(order_Detail);
	}

	@Override
	public void updateOrderDetail(Order_Detail order_Detail) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(order_Detail);
	}

	@Override
	public void deleteOrderDetail(Order_Detail order_Detail) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(order_Detail);
	}

	@Override
	public List<Order_Detail> getOrdersDetailsByOrderID(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order_Detail> query = currentSession.createQuery("from Order_Detail where orderID=:id", Order_Detail.class);
		query.setParameter("id",id);
		List<Order_Detail> order_Details = query.getResultList();
		return order_Details;
	}

}
