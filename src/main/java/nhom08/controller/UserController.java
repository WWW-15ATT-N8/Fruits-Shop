package nhom08.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nhom08.entity.Cart;
import nhom08.entity.Order;
import nhom08.entity.Order_Detail;
import nhom08.entity.Status;
import nhom08.entity.User;
import nhom08.service.CartService;
import nhom08.service.OrderDetailService;
import nhom08.service.OrderService;
import nhom08.service.ProductService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private CartService cartService;
	
	@InitBinder
	public void initBiner(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	
	@GetMapping("/cart/addcart")
	public String addCart(HttpServletRequest request, HttpSession session, @RequestParam("productID") int productID,
						  @RequestParam("quantity") int quantity , Model theModel){
		User u = (User) session.getAttribute("USER");
		Cart cart = cartService.getCart(u.getUserID(), productID);
		if(cart == null) {
			cart = new Cart(productService.getProduct(productID), (User)session.getAttribute("USER"), quantity);
			
		}
		else {
			cart.setAmount(cart.getAmount() + quantity);
		}
		
		double total = (double)session.getAttribute("total")  + cart.getProduct().getPrice()*quantity;	
		session.setAttribute("total", total );		
		cartService.saveCart(cart);
		return "redirect:/product/id=" + productID;
	}
	
	@GetMapping("/cart/updatecart")
	public String updateCart(HttpServletRequest request, HttpSession session, Model theModel) {
		String []listAmount = request.getParameterValues("amount");
		User u = (User)session.getAttribute("USER");
		List<Cart> carts = cartService.getCartsbyUserID(u.getUserID());
		double total = 0.0;
		for(int i = carts.size() - 1;i >= 0 ; i--) {
			if(Integer.valueOf(listAmount[i])>0) {
				carts.get(i).setAmount(Integer.valueOf(listAmount[i]));
				cartService.updateCart(carts.get(i));
				total += carts.get(i).getProduct().getPrice()*carts.get(i).getAmount();
			}				
			else
				cartService.deleteCart(carts.get(i));
		}	
		session.setAttribute("total",total);
		return "redirect:/user/cart/";
	}
	
	@GetMapping("/cart")
	public String GioHang(HttpServletRequest request, HttpSession session, Model theModel){
		User u = (User)session.getAttribute("USER");
		List<Cart> carts = cartService.getCartsbyUserID(u.getUserID());

		theModel.addAttribute("carts", carts);
		return "customer/GioHang";
	}
	
	
	@GetMapping("/order")
	public String thanhToan(HttpServletRequest request, HttpSession session, Model theModel) {
		User u = (User)session.getAttribute("USER");
		if(u.getFullName().equals("")) {
			theModel.addAttribute("saveOrderError", "Vui lòng cập nhật đầy đủ thông tin trước khi đặt hàng");
			return "customer/ThongTinCaNhan";
		}
		List<Cart> carts = cartService.getCartsbyUserID(u.getUserID());
		theModel.addAttribute("Order", new Order());
		theModel.addAttribute("carts", carts);
		return "customer/ThanhToan";
	}
	
	@GetMapping("/order/saveorder")
	public String saveOrder(HttpServletRequest request, HttpSession session, @Valid @ModelAttribute("Order") Order theOrder, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) 
			return "customer/ThanhToan";
		Date now = new Date(System.currentTimeMillis());
		User u = (User)session.getAttribute("USER");
		List<Cart> carts = cartService.getCartsbyUserID(u.getUserID());
		List<Order_Detail> details = new ArrayList<Order_Detail>();
		for(Cart c : carts) {
			details.add(new Order_Detail(c.getProduct(), c.getAmount(), c.getProduct().getPrice()));
		}
		theOrder.setUser(u);
		theOrder.setCreatedDate(now);
		theOrder.setOrderID(0);
		theOrder.setStatus(new Status(1));
		theOrder.setDiscount(0.0f);
		theOrder.setOrder_Details(details);

//		System.out.println(theOrder);
		orderService.saveOrder(theOrder);
		for(Cart c : carts) 
			cartService.deleteCart(c);
		int orderID = orderService.getMaxID();
		session.setAttribute("total",0.0);
		return "redirect:/user/order/id=" + orderID;
	}
	
	@GetMapping("/order/id={orderID}")
	public String getOrder(HttpServletRequest request, HttpSession session,
							@PathVariable int orderID, Model theModel) {
		Order o = orderService.getOrder(orderID);
		List<Order_Detail> details = orderDetailService.getOrdersDetailsByOrderID(o.getOrderID());

		o.setOrder_Details(details);
		theModel.addAttribute("ORDER", o);
		return "customer/ChiTietDonHang";
	}
	
	@GetMapping({"/order/list","/order/list/"})
	public String listOrder(HttpServletRequest request, HttpSession session,Model theModel) {
		User user = (User)session.getAttribute("USER");
		List<Order> orders = orderService.getOrdersByDK(" where userID=" + user.getUserID());
		theModel.addAttribute("listorder",  orders);
		return "customer/DanhSachDonHang";
	}
	
	@GetMapping("/thong-tin-ca-nhan")
	public String getInfo(){

		return "customer/ThongTinCaNhan";
	}
	
}
