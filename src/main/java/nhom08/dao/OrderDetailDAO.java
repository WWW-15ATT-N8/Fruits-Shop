package nhom08.dao;

import java.util.List;

import nhom08.entity.Order;
import nhom08.entity.Order_Detail;

public interface OrderDetailDAO {
	public List<Order_Detail> getOrdersDetails();
	public void saveOrderDetail(Order_Detail order_Detail);
	public void updateOrderDetail(Order_Detail order_Detail);
	public void deleteOrderDetail(Order_Detail order_Detail);
	public List<Order_Detail> getOrdersDetailsByOrderID(int id);
}
