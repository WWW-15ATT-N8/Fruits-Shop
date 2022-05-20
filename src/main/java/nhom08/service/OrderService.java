package nhom08.service;

import java.sql.Date;
import java.util.List;

import nhom08.entity.Order;

public interface OrderService {
	public List<Order> getOrders();
	public Order getOrder(int id);
	public void saveOrder(Order order);
	public void updateOrder(Order order);
	public void deleteOrder(Order order);
	public int getMaxID();
	public List<Order> getOrdersByDK(String dk);
	public List<Order> getOrdersByDate(Date date);
}
