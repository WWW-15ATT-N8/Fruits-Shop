package nhom08.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nhom08.dao.OrderDetailDAO;
import nhom08.entity.Order_Detail;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
	
	@Autowired
	private OrderDetailDAO orderDetailDAO; 

	@Override
	@Transactional
	public List<Order_Detail> getOrdersDetails() {
		// TODO Auto-generated method stub
		return orderDetailDAO.getOrdersDetails();
	}

	@Override
	@Transactional
	public void saveOrderDetail(Order_Detail order_Detail) {
		// TODO Auto-generated method stub
		orderDetailDAO.saveOrderDetail(order_Detail);
	}

	@Override
	@Transactional
	public void updateOrderDetail(Order_Detail order_Detail) {
		// TODO Auto-generated method stub
		orderDetailDAO.updateOrderDetail(order_Detail);
	}

	@Override
	@Transactional
	public void deleteOrderDetail(Order_Detail order_Detail) {
		// TODO Auto-generated method stub
		orderDetailDAO.deleteOrderDetail(order_Detail);
	}

	@Override
	@Transactional
	public List<Order_Detail> getOrdersDetailsByOrderID(int id) {
		// TODO Auto-generated method stub
		return orderDetailDAO.getOrdersDetailsByOrderID(id);
	}

}
