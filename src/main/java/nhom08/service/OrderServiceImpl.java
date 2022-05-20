package nhom08.service;

import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nhom08.dao.OrderDAO;
import nhom08.dao.OrderDetailDAO;
import nhom08.entity.Order;
import nhom08.entity.Order_Detail;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;

	@Override
	@Transactional
	public List<Order> getOrders() {
		// TODO Auto-generated method stub
		return orderDAO.getOrders();
	}

	@Override
	@Transactional
	public Order getOrder(int id) {
		// TODO Auto-generated method stub
		return orderDAO.getOrder(id);
	}

	@Override
	@Transactional
	public void saveOrder(Order order) {
		orderDAO.saveOrder(order);
		int id= orderDAO.getMaxID();
		for(Order_Detail detail : order.getOrder_Details()) {
			Order_Detail d = detail;
			d.setOrder(new Order(id));
			orderDetailDAO.saveOrderDetail(d);
		}
			
	}

	@Override
	@Transactional
	public void updateOrder(Order order) {
		orderDAO.updateOrder(order);
	}

	@Override
	@Transactional
	public void deleteOrder(Order order) {
		orderDAO.deleteOrder(order);
	}

	@Override
	@Transactional
	public int getMaxID() {
		// TODO Auto-generated method stub
		return orderDAO.getMaxID();
	}

	@Override
	@Transactional
	public List<Order> getOrdersByDK(String dk) {
		// TODO Auto-generated method stub
		return orderDAO.getOrdersByDK(dk);
	}

	@Override
	public List<Order> getOrdersByDate(Date date) {
		// TODO Auto-generated method stub
		return orderDAO.getOrdersByDate(date);
	}

}
