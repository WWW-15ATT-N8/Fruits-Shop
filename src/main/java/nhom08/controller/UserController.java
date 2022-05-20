package nhom08.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nhom08.entity.Account;
import nhom08.entity.Cart;
import nhom08.entity.Category;
import nhom08.entity.Image;
import nhom08.entity.Order;
import nhom08.entity.Order_Detail;
import nhom08.entity.Product;
import nhom08.entity.Status;
import nhom08.entity.User;
import nhom08.service.AccountService;
import nhom08.service.CartService;
import nhom08.service.CategoryService;
import nhom08.service.ImageService;
import nhom08.service.OrderDetailService;
import nhom08.service.OrderService;
import nhom08.service.ProductService;
import nhom08.service.StatusService;
import nhom08.service.UserService;

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
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private StatusService statusService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private ImageService imageService;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@InitBinder
	public void initBiner(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	public void loadUser(HttpServletRequest request, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
			User u = new User();
			String phone = authentication.getName();
			u = userService.getUserbyPhone(phone);
			List<Cart> carts  =  cartService.getCartsbyUserID(u.getUserID());
			double total = 0.0;
			for(Cart c : carts)
				total += c.getAmount()*c.getProduct().getPrice();
				
			session.setAttribute("USER",u);
			session.setAttribute("total",total);
		}
		
		if(session.getAttribute("category") == null) {
			List<Category> categories = categoryService.getCategories();
			session.setAttribute("category", categories);
		}
	}
	
	
	@GetMapping("/cart/addcart")
	public String addCart(HttpServletRequest request, HttpSession session, @RequestParam("productID") int productID,
						  @RequestParam("quantity") int quantity , Model theModel){
		if(quantity <= 0) {
			Product product = productService.getProduct(productID);
			if (product == null) {
				throw new RuntimeException("Không tìm thấy id  product : " + productID);
			}
			Category category = product.getCategory();

			List<Image> imgs = imageService.getImagesByProductID(productID);
			for (Image i : imgs)
				System.out.println(i);
			int cnt = 0;
			List<Product> products = new ArrayList<Product>();
			for (Product p : productService.getProducts()) {
				if (p.getCategory().getCategoryID() == category.getCategoryID()) {
					products.add(p);
					cnt++;
				}
				if (cnt == 4)
					break;
			}

			theModel.addAttribute("product", product);
			theModel.addAttribute("category", category);
			theModel.addAttribute("img", imgs);
			theModel.addAttribute("desc", product.getDescription());
			theModel.addAttribute("sam_product", products);
			theModel.addAttribute("addcartError","Số lượng phải lớn hơn hoặc bằng 1");
			return "customer/ChiTietSanPham";
		}
		loadUser(request, session);
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
	
	@PostMapping("/cart/updatecart")
	public String updateCart(HttpServletRequest request, HttpSession session, Model theModel) {
		loadUser(request, session);
		User u = (User)session.getAttribute("USER");
		String []listAmount = request.getParameterValues("amount");
		List<Cart> carts = cartService.getCartsbyUserID(u.getUserID());
		
		for(int i = carts.size()- 1;i >= 0 ; i--) {
			if(Integer.valueOf(listAmount[i])<0) {
				theModel.addAttribute("carts", carts);
				theModel.addAttribute("updatecartError","Số lượng phải lớn hơn hoặc bằng 0");
				return "customer/GioHang";
			}
		}
		
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
		loadUser(request, session);
		User u = (User)session.getAttribute("USER");
		List<Cart> carts = cartService.getCartsbyUserID(u.getUserID());

		theModel.addAttribute("carts", carts);
		return "customer/GioHang";
	}
	
	
	@GetMapping("/order")
	public String thanhToan(HttpServletRequest request, HttpSession session, Model theModel) {
		loadUser(request, session);
		User u = (User)session.getAttribute("USER");
		if(u.getFullName().equals("")) {
			theModel.addAttribute("saveOrderError", "Vui lòng cập nhật đầy đủ thông tin trước khi đặt hàng");
			theModel.addAttribute("UserUpdate",u);
			return "customer/ThongTinCaNhan";
		}
		List<Cart> carts = cartService.getCartsbyUserID(u.getUserID());
		Order order =  new Order();
		order.setShipAddress(u.getAddress());
		order.setShipPhone(u.getPhone());
		theModel.addAttribute("Order",order);
		theModel.addAttribute("carts", carts);
		return "customer/ThanhToan";
	}
	
	@PostMapping("/order/saveorder")
	public String saveOrder(@Valid @ModelAttribute("Order") Order theOrder, BindingResult bindingResult,
			HttpServletRequest request, HttpSession session, Model theModel) {
		loadUser(request, session);
		User u = (User)session.getAttribute("USER");
		List<Cart> carts = cartService.getCartsbyUserID(u.getUserID());
		if (bindingResult.hasErrors()) {
			theModel.addAttribute("Order", theOrder);
			theModel.addAttribute("carts", carts);
			return "customer/ThanhToan";
		}
		Date now = new Date(System.currentTimeMillis());
		List<Order_Detail> details = new ArrayList<Order_Detail>();
		if(carts.size() == 0) {
			return "redirect:/";
		}
		for(Cart c : carts) {
			details.add(new Order_Detail(c.getProduct(), c.getAmount(), c.getProduct().getPrice()));
		}
		theOrder.setUser(u);
		theOrder.setCreatedDate(now);
		theOrder.setOrderID(0);
		theOrder.setStatus(new Status(1));
		theOrder.setDiscount(0.0f);
		theOrder.setOrder_Details(details);
		theOrder.setTotal(theOrder.getThanhTien());


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
		int filter = 1;
		if(session.getAttribute("filteroder") != null) {
			filter = (int)session.getAttribute("filteroder");
		}
		if(request.getParameter("filteroder") != null) {
			filter = Integer.valueOf(request.getParameter("filteroder"));
		}
		
		
		loadUser(request, session);
		User user = (User)session.getAttribute("USER");
		List<Order> orders;
		if(filter == 1)
			 orders = orderService.getOrdersByDK(" where userID=" + user.getUserID());
		else
			 orders = orderService.getOrdersByDK(" where userID=" + user.getUserID() + " and statusID=" + (filter-1));
		session.setAttribute("filteroder", filter);
		theModel.addAttribute("listorder",  orders);
		return "customer/DanhSachDonHang";
	}
	
	@GetMapping("/thong-tin-ca-nhan")
	public String getInfo(HttpServletRequest request, HttpSession session, Model theModel){
		loadUser(request, session);
		User user = (User)session.getAttribute("USER");
		
		theModel.addAttribute("UserUpdate",user);
		return "customer/ThongTinCaNhan";
	}
	
	@PostMapping("/thong-tin-ca-nhan/update")
	public String updateInfo(@Valid @ModelAttribute("UserUpdate") User UserUpdate,BindingResult bindingResult, 
			HttpSession session, HttpServletRequest request, Model theModel){
		loadUser(request, session);
		if (bindingResult.hasErrors()) {
//			System.out.println("lỗi mẹ rồi: "+UserUpdate);
//			bindingResult
//			.getFieldErrors()
//			.stream()
//			.forEach(f -> System.out.println(f.getField() + ": " + f.getDefaultMessage()));
			return "customer/ThongTinCaNhan";
		}
			

		User user = (User)session.getAttribute("USER");
		String name= UserUpdate.getFullName().toString().trim().toUpperCase();
		String email= UserUpdate.getEmail().toString().trim().toLowerCase();
		String diachi = UserUpdate.getAddress().toString().trim().toUpperCase();
		
		UserUpdate.setFullName(name);
		UserUpdate.setEmail(email);
		UserUpdate.setAddress(diachi);
		UserUpdate.setPhone(user.getPhone());
		UserUpdate.setAccount(user.getAccount());
		userService.saveUser(UserUpdate);

		theModel.addAttribute("updateMessage", "Cập nhật thông tin thành công");
		return "customer/ThongTinCaNhan";
	}
	
	@GetMapping({"doi-mat-khau","change-password"})
	public String changePassword(HttpSession session, HttpServletRequest request){
		loadUser(request, session);
		return "customer/DoiMatKhau";
	}
	
	@PostMapping({"/doi-mat-khau/save","/change-password/save"})
	public String saveChangePassword(@RequestParam("oldpassword") String oldpass,
			@RequestParam("newpassword") String newpass, @RequestParam("confirmpassword") String confirmpass,
			HttpSession session, HttpServletRequest request, Model theModel){
		
		if(oldpass == null) {
			theModel.addAttribute("changpasswordError","Mật khẩu cũ không được để trống");
			return "customer/DoiMatKhau";
		}else if(newpass == null) {
			theModel.addAttribute("changpasswordError","Mật khẩu mới không được để trống");
			return "customer/DoiMatKhau";
		}else if(newpass.length() < 6) {
			theModel.addAttribute("changpasswordError","* Mật khẩu mới có ít nhất 6 kí tự");
			return "customer/DoiMatKhau";
		}else if(confirmpass == null) {
			theModel.addAttribute("changpasswordError","Nhập lại mật khẩu không được để trống");
			return "customer/DoiMatKhau";
		}else if(!confirmpass.equals(newpass)) {
			theModel.addAttribute("changpasswordError","Mật khẩu mới và nhập lại mật khẩu không trùng khớp");
			return "customer/DoiMatKhau";
		}
		loadUser(request, session);
		User user = (User)session.getAttribute("USER");
		Account account = user.getAccount();
		String password = passwordEncoder.encode(newpass);
		password = "{bcrypt}" + password;
		account.setPassword(password);
		theModel.addAttribute("changpasswordSuccess","Thay đổi mật khẩu thành công");
		return "customer/DoiMatKhau";
	}
	
	
	@GetMapping("/order/delete/id={orderID}")
	public String deleteOrder(@PathVariable int orderID, Model theModel) {

		Order order = orderService.getOrder(orderID);
		List<Order_Detail> details = orderDetailService.getOrdersDetailsByOrderID(orderID);
		order.setOrder_Details(details);
		if(order.getStatus().getStatusID() >= 3) {
			theModel.addAttribute("ORDER", order);
			theModel.addAttribute("deleteError", "Không thể hủy vì đơn hàng " +order.getStatus().getName());
			return "customer/ChiTietDonHang";
		}
		order.setStatus(statusService.getStatus(4));
		orderService.updateOrder(order);
		theModel.addAttribute("deleteSuccess", "Bạn đã hủy đơn hàng thành công " );
		theModel.addAttribute("ORDER", order);
		return "customer/ChiTietDonHang";
	}
	
	
}
