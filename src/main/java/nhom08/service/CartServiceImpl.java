package nhom08.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nhom08.dao.CartDAO;
import nhom08.entity.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;
	
	@Override
	@Transactional
	public List<Cart> getCartsbyUserID(int UserID) {
		// TODO Auto-generated method stub
		return cartDAO.getCartsbyUserID(UserID);
	}

	@Override
	@Transactional
	public void saveCart(Cart cart) {
		cartDAO.saveCart(cart);
	}

	@Override
	@Transactional
	public void updateCart(Cart cart) {
		// TODO Auto-generated method stub
		cartDAO.updateCart(cart);
	}

	@Override
	@Transactional
	public void deleteCart(Cart cart) {
		cartDAO.deleteCart(cart);
	}

	@Override
	@Transactional
	public Cart getCart(int userID, int productID) {
		// TODO Auto-generated method stub
		return cartDAO.getCart(userID, productID);
	}

}
